```plantuml
Actor User
Participant "CatERingAppManager.RecipeManager:  \nRecipeManager"
Participant "RecipeManager.currentRecipe:  \nr"

User -> "CatERingAppManager.RecipeManager:  \nRecipeManager": publishRecipe(recipe)
Activate "CatERingAppManager.RecipeManager:  \nRecipeManager"

alt ["currentRecipe == null"]
	"CatERingAppManager.RecipeManager:  \nRecipeManager" --> User: throw UseCaseLogicException
else 
	"CatERingAppManager.RecipeManager:  \nRecipeManager" -> "RecipeManager.currentRecipe:  \nr": publishRecipe()
	Activate "RecipeManager.currentRecipe:  \nr"
	"RecipeManager.currentRecipe:  \nr" -> "RecipeManager.currentRecipe:  \nr": setPubblicata(true)
	"RecipeManager.currentRecipe:  \nr" -> "CatERingAppManager.RecipeManager:  \nRecipeManager": r
	Deactivate "RecipeManager.currentRecipe:  \nr"
	"CatERingAppManager.RecipeManager:  \nRecipeManager" -> User: r
	Deactivate "CatERingAppManager.RecipeManager:  \nRecipeManager"
end


```
