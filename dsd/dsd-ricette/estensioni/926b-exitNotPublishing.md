```plantuml

title: 26b. dontPublish

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
	loop for each rec in reciever
		RM -> RER: notifyExitWithoutPublishing(currentRecipe)
		activate RER
		activate RER
	end
	Deactivate RM
end

```
