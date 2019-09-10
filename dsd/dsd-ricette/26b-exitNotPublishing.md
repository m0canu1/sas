```plantuml
Actor User
Participant "CatERingAppManager.RecipeManager:  \nRecipeManager" as RM
Participant "RecipeManager.currentRecipe:  \nr" as CR

opt
	User -> RM: exitNotPublishing(recipe)
	Activate RM
	alt ["currentRecipe == null"]
		RM --> User: Throw UseCaseLogicException
	else 
		RM -> CR: exitNotPublishing()
		Activate CR
		CR -> CR: setPubblicata(false)
		CR -> RM: r
		Deactivate CR
	end
	RM -> User: r
	Deactivate RM
end

```