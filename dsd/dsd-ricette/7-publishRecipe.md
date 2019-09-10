```plantuml
Actor User
Participant "CatERingAppManager.RecipeManager:  \nRecipeManager" as RM
Participant "RecipeManager.currentRecipe:  \nr" as CR

User -> RM: publishRecipe(recipe)
Activate RM

alt ["currentRecipe == null"]
	RM --> User: throw UseCaseLogicException
else 
	RM -> CR: publishRecipe()
	Activate CR
	CR -> CR: setPublished(true)
	CR -> RM: r
	Deactivate CR
	RM -> User: r
	Deactivate RM
end


```
