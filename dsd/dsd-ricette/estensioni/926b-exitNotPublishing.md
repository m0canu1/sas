```plantuml

title: 25a. exiDontPublish

Actor User
Participant "CatERingAppManager.RecipeManager:  \nRecipeManager" as RM
Participant "RecipeManager.currentRecipe:  \nr" as CR
Participant "rec: \nRecipeEventReceiver" as RER

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
	loop for each rec in reciever
		RM -> RER: notifyExitWithoutPublishing(currentRecipe)
		activate RER
		deactivate RER
	end
	Deactivate RM
end

```
