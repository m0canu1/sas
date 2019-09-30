```plantuml

title: 26a. insertTitle

Actor User
Participant "CatERingAppManager.RecipeManager:  \nRecipeManager" as RM
Participant "RecipeManager.currentRecipe:  \nr" as CR

opt
	User -> RM: insertTitle()
	Activate RM
	alt ["currentRecipe == null"]
		RM --> User: Throw UseCaseLogicException
	else 
		RM -> CR: setTitle(title)
		Activate CR
		Deactivate CR
	end
	Deactivate RM
end
```
