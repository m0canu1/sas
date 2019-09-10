```plantuml
Actor User
Participant "CatERingAppManager.RecipeManager: \nRecipeManager" as RM
Participant "RecipeManager.currentRecipe:  \nr" as CR

opt
	User -> RM: setIngredientDose(recipe)
	Activate RM

	alt ["currentRecipe == null"]
		RM --> User: throw UseCaseLogicException
	else 
		RM -> CR: setIngredientDose()
		Activate CR
		loop ["fino a soddisfacimento"]
			CR -> CR: addIngredient(ingredient)
			CR -> CR: addDose(ingredient, dose)
		end
		CR -> RM: r
		Deactivate CR
		RM -> User: r
		Deactivate RM
	end
end
```
