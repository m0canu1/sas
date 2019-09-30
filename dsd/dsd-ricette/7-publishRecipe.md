```plantuml

title: 7. publishRecipe

Actor User
Participant "CatERingAppManager.RecipeManager:  \nRecipeManager" as RM
Participant "RecipeManager.currentRecipe:  \nr" as CR

User -> RM: publishRecipe()
Activate RM

alt ["currentRecipe == null"]
	RM --> User: throw UseCaseLogicException
else 
	RM -> CR: setPublished(true)
	Activate CR
	Deactivate CR
end
Deactivate RM


```
