```plantuml

title: 2-4.a setAlternative

Actor User
Participant "CatERingAppManager.RecipeManager:  \nRecipeManager" as RM
Participant "RecipeManager.currentRecipe:  \nRecipe" as CR
Participant "rec: RecipeEventReciever" as RER
User -> RM: setAlternativeRecipe(original_recipe)
Activate RM

alt ["currentRecipe == null"]
	RM --> User: throw UseCaseLogicException
else
	RM -> CR: setAlternativeRecipe(original_recipe)
	Activate CR
    
	CR -> CR: setOriginal(original_recipe)


	Deactivate CR
	loop for each rec in reciever
		RM -> RER: notifyNewAlternativeRecipe(currentRecipe)
		activate RER
		Deactivate RER
	end
end
Deactivate RM


```
