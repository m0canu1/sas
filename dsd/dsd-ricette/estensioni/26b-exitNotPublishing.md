```plantuml
Actor User
Participant "CatERingAppManager.RecipeManager:  \nRecipeManager" as RM
Participant "RecipeManager.currentRecipe:  \nr" as CR

opt
	User -> RM: dontPublish()
	Activate RM
	alt ["currentRecipe == null"]
		RM --> User: Throw UseCaseLogicException
	else 
		RM -> CR: exitWithoutPublishing()
		Activate CR
		CR -> CR: setPubblished(false)
	end
	Deactivate CR
	Deactivate RM
end

```