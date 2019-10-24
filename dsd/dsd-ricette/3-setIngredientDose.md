```plantuml
title: 3. setIngredientDose

Actor User
Participant "CatERingAppManager.RecipeManager: \nRecipeManager" as RM
Participant "RecipeManager.currentRecipe:  \nRecipe" as CR
Participant "rec: \nRecipeEventReciever" as RER
opt
	User -> RM: setIngredientDose(ingredient, dose?)
	Activate RM

	alt ["currentRecipe == null"]
		RM --> User: throw UseCaseLogicException
	else 
		RM -> CR: setIngredientDose(ingredient, dose?)
		Activate CR
			CR -> "currentRecipe.ingr_doses: HashMap<Ingredient, Dose>": addIngredient(ingredient)
			Activate "currentRecipe.ingr_doses: HashMap<Ingredient, Dose>"

            opt ["dose != null"]
			    CR -> "currentRecipe.ingr_doses: HashMap<Ingredient, Dose>": addDose(ingredient, dose)
                "currentRecipe.ingr_doses: HashMap<Ingredient, Dose>" --> CR: ingr_doses
            end
        Deactivate "currentRecipe.ingr_doses: HashMap<Ingredient, Dose>" 
        loop for each rec in reciever
        RM -> RER: notifyIngrDosesAdded(currentRecipe, ingr_doses)
        end
		Deactivate CR
		Deactivate RM
        
	end
end
```
