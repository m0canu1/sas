```plantuml
Actor User
Participant "CatERingAppManager.RecipeManager:  \nRecipeManager" as RM
Participant "RecipeManager.currentRecipe:  \nr" as CR

User -> RM: setAlternativeRecipe(recipe)
Activate RM

alt ["currentRecipe == null"]
	RM --> User: throw UseCaseLogicException
else 

	RM -> CR: setAlternativeRecipe()
	Activate CR
	CR -> RM: getOriginalRecipe()
	Activate RM
	RM -> CR: original_r
	Deactivate RM
	CR -> CR: setAlternative(original_r)
	CR -> RM: r
	Deactivate CR
	RM -> User: r
	Deactivate RM
end


```