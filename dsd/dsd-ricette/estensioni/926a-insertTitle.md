```plantuml

title: 26a. insertTitle

Actor User
Participant "CatERingAppManager.RecipeManager:  \nRecipeManager" as RM
Participant "RecipeManager.currentRecipe:  \nr" as CR
Participant "rec: \nRecipeEventReceiver" as RER

	User -> RM: insertTitle(title)
	Activate RM
	alt ["currentRecipe == null"]
		RM --> User: Throw UseCaseLogicException
	else
		RM -> CR: setTitle(title)
		Activate CR
		Deactivate CR
	end
	loop for each rec in reciever
		RM -> RER: notifyRecipeTitleChanged(currentRecipe, title)
		activate RER
		deactivate RER
	end
	Deactivate RM
```
