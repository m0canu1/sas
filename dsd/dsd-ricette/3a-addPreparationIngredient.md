```plantuml

Actor User
Participant "CatERingAppManager.RecipeManager:  \nRecipeManager" as RM
Participant "RecipeManager.currentRecipe:  \nr" as CR

opt 

	User -> RM: addPreparationIngredient(recipe, preparation)
	Activate RM

	alt ["currentRecipe == null"]
		RM --> User: throw UseCaseLogicException
	else 
		RM -> CR: addPreparationIngredient(preparation)
		Activate CR
		CR -> CR: addIngredient(preparation)
		CR --> RM: r
		Deactivate CR
		RM -> User: r
		Deactivate RM
	end

end

```
