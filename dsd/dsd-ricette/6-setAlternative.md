```plantuml
Actor User
Participant "CatERingAppManager.RecipeManager:  \nRecipeManager" as RM
Participant "RecipeManager.currentRecipe:  \nr" as CR

User -> RM: setAlternativeRecipe()
Activate RM

alt ["currentRecipe == null"]
	RM --> User: throw UseCaseLogicException
else 

	RM -> "recipe: Recipe": lookupOriginalRecipe()
	Activate "recipe: Recipe"
	"recipe: Recipe" -> RM: original_recipe
	Deactivate "recipe: Recipe"
	
	RM -> CR: setOriginal(original_recipe)
	Activate CR
	Deactivate CR
end
Deactivate RM


```