```plantuml

title: 4. Tagging

Actor User
Participant "CatERing.AppManager.RecipeManager: \nRecipeManager" as RM
Participant "RecipeManager.currentRecipe: \nRecipe" as CR
Participant "rec: \nRecipeEventReceiver" as RER

User -> RM: addTag(tag)
Activate RM

alt ["currentRecipe == null"]
	RM --> User: throw UseCaseLogicException
else
    RM -> CR: setTag(tag)
	Activate CR

	
	loop for each rec in receivers
		RM -> RER: notifyRecipeTagged(currentRecipe, tag)
		activate RER
		deactivate RER
	end
end
Deactivate CR
Deactivate RM


```
