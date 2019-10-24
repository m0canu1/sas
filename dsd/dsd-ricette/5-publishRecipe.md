```plantuml

title: 5. publishRecipe

Actor User
Participant "CatERingAppManager.RecipeManager:  \nRecipeManager" as RM
Participant "RecipeManager.currentRecipe:  \nRecipe" as CR
Participant "rec: \nRecipeEventReceiver" as RER

User -> RM: publishRecipe()
Activate RM

alt ["currentRecipe == null"]
	RM --> User: throw UseCaseLogicException
else
	RM -> CR: publishRecipe()

	Activate CR
    CR --> CR: setPublished(true)
     Deactivate CR   


	loop for each rec in receivers
		RM -> RER: notifyRecipePublished(currentRecipe)
		activate RER
		activate RER
	end

end
Deactivate RM


```
