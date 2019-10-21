```plantuml

title: 7. publishRecipe

Actor User
Participant "CatERingAppManager.RecipeManager:  \nRecipeManager" as RM
Participant "RecipeManager.currentRecipe:  \nr" as CR

User -> RM: publishRecipe(r)
Activate RM

alt ["currentRecipe == null"]
	RM --> User: throw UseCaseLogicException
else 
	RM -> CR: setPublished(true)
	Activate CR
    CR --> RM: notifyRecipeUpdated(r)
	Deactivate CR
end
Deactivate RM


```
