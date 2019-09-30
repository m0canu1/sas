```plantuml
title: 3. setIngredientDose

Actor User
Participant "CatERingAppManager.RecipeManager: \nRecipeManager" as RM
Participant "RecipeManager.currentRecipe:  \nr" as CR

opt
	User -> RM: setIngredientDose()
	Activate RM

	alt ["currentRecipe == null"]
		RM --> User: throw UseCaseLogicException
	else 
		RM -> CR: setIngredientDose()
		Activate CR
		loop ["fino a soddisfacimento"]
			CR -> "ingredients: list<String>": addIngredient(ingredient)
			Activate "ingredients: list<String>"
			Deactivate "ingredients: list<String>"
			CR -> "doses: list<Number>": addDose(ingredient, dose)
			Activate "doses: list<Number>"
			Deactivate "doses: list<Number>"
		end
		Deactivate CR
		Deactivate RM
	end
end
```
