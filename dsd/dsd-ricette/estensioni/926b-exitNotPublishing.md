```plantuml

title: 25a. exiDontPublish

Actor User
Participant "CatERingAppManager.RecipeManager:  \nRecipeManager" as RM
Participant "RecipeManager.currentRecipe:  \nr" as CR

opt
	User -> RM: exitDontPublish()
	Activate RM
	alt ["currentRecipe == null"]
		RM --> User: Throw UseCaseLogicException
	else 
		RM -> CR: exitWithoutPublishing()
		Activate CR
		CR -> CR: setPublished(false)
	end
	Deactivate CR
	Deactivate RM
end

```
