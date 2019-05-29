```plantuml
	Actor User
	Participant "CatERingAppManager.RecipeManager:  \nRecipeManager"
	Participant "RecipeManager.currentRecipe:  \nr"

	User -> "CatERingAppManager.RecipeManager:  \nRecipeManager": exitNotPublishing(recipe)
	Activate "CatERingAppManager.RecipeManager:  \nRecipeManager"
	alt ["currentRecipe == null"]
		"CatERingAppManager.RecipeManager:  \nRecipeManager" --> User: Throw UseCaseLogicException
	else 
		"CatERingAppManager.RecipeManager:  \nRecipeManager" -> "RecipeManager.currentRecipe:  \nr": exitNotPublishing()
		Activate "RecipeManager.currentRecipe:  \nr"
		"RecipeManager.currentRecipe:  \nr" -> "RecipeManager.currentRecipe:  \nr": setPubblicata(false)
		"RecipeManager.currentRecipe:  \nr" -> "CatERingAppManager.RecipeManager:  \nRecipeManager": r
		Deactivate "RecipeManager.currentRecipe:  \nr"
	end
	"CatERingAppManager.RecipeManager:  \nRecipeManager" -> User: r
	Deactivate "CatERingAppManager.RecipeManager:  \nRecipeManager"
```