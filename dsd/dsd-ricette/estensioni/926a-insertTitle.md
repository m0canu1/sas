```plantuml

title: 26a. insertTitle

Actor User
Participant "CatERingAppManager.RecipeManager:  \nRecipeManager" as RM
Participant "RecipeManager.currentRecipe:  \nr" as CR
Participant "rec: \nRecipeEventReceiver" as RER

opt
	User -> RM: insertTitle()
	Activate RM
	alt ["currentRecipe == null"]
		RM --> User: Throw UseCaseLogicException
	else
		RM -> CR: changeTitle(title)
		Activate CR
		CR -> CR: setTitle(title)
		Deactivate CR
	end
	loop for each rec in reciever
		RM -> RER: notifyRecipeTitleChanged(currentRecipe)
		activate RER
		deactivate RER
	end
	Deactivate RM
end
```
