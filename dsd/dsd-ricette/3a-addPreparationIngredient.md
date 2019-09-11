```plantuml

Actor User
Participant "CatERingAppManager.RecipeManager:  \nRecipeManager" as RM
Participant "RecipeManager.currentRecipe:  \nr" as CR

opt 

	User -> RM: addPreparationIngredient(preparation)
	Activate RM

	alt ["currentRecipe == null"]
		RM --> User: throw UseCaseLogicException
	else 
		RM -> CR:  addPreparationIngredient(preparation)
		Activate CR
		CR -> "preparation: Preparation": getName()
		Activate "preparation: Preparation"
		"preparation: Preparation" -> CR: name
		Deactivate "preparation: Preparation"
		CR -> "ingredients: list<String>": addIngredient(name)
		Activate "ingredients: list<String>"
		Deactivate "ingredients: list<String>"
		Deactivate CR
		Deactivate RM
	end

end

```
