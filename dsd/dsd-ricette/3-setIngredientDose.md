```plantuml
title: 3. setIngredientDose

Actor User
Participant "CatERingAppManager.RecipeManager: \nRecipeManager" as RM
Participant "RecipeManager.currentRecipe:  \nr" as CR

opt
	User -> RM: setIngredientDose(r, ingredient, dose?)
	Activate RM

	alt ["currentRecipe == null"]
		RM --> User: throw UseCaseLogicException
	else 
		RM -> CR: setIngredientDose(ingredient, dose?)
		Activate CR
		loop ["fino a soddisfacimento"]
			CR -> "ingredients: list<String>": addIngredient(ingredient)
			Activate "ingredients: list<String>"
            "ingredients: list<String>" --> CR: ingredients
			Deactivate "ingredients: list<String>"
            opt ["dose != null"]
			    CR -> "doses: list<Number>": addDose(ingredient, dose)
			    Activate "doses: list<Number>"
                "doses: list<Number>" --> CR: doses
			    Deactivate "doses: list<Number>"
            end
		end
        CR --> RM: notifyRecipeUpdated(r)
		Deactivate CR
		Deactivate RM
	end
end
```
