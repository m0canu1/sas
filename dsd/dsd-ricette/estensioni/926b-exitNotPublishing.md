```plantuml

title: 2-5a. exiDontPublish

Actor User
Participant "CatERingAppManager.RecipeManager:  \nRecipeManager" as RM
Participant "RecipeManager.currentRecipe:  \nr" as CR
Participant "rec: \nRecipeEventReceiver" as RER

opt
	User -> RM: exitWithoutPublishing()
	Activate RM
	alt ["currentRecipe == null"]
		RM --> User: Throw UseCaseLogicException
	else
		RM -> CR: setPublished(false)
		Activate CR
        Deactivate CR
	end

	loop for each rec in reciever
		RM -> RER: notifyExitWithoutPublishing(currentRecipe)
		activate RER
		deactivate RER
	end
	Deactivate RM
end

```
