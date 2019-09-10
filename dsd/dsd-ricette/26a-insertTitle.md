```plantuml
Actor User
Participant "CatERingAppManager.RecipeManager:  \nRecipeManager" as RM
Participant "RecipeManager.currentRecipe:  \nr" as CR

opt

	User -> RM: insertTitle(recipe)
	Activate RM
	alt ["currentRecipe == null"]
		RM --> User: Throw UseCaseLogicException
	else 
		RM -> CR: insertTitle(title)
		Activate CR
		CR -> CR: setTitle(title)
		CR -> RM: r
		Deactivate CR
	end
	RM -> User: r
	Deactivate RM
end
```