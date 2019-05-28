```plantuml
Actor User
Participant "CatERingAppManager.RecipeManager:  \nRecipeManager"
Participant "RecipeManager.currentRecipe:  \nr"

User -> "CatERingAppManager.RecipeManager:  \nRecipeManager": setIngredientDose(recipe)
Activate "CatERingAppManager.RecipeManager:  \nRecipeManager"

alt ["currentRecipe != null"]
	"CatERingAppManager.RecipeManager:  \nRecipeManager" --> User: throw UseCaseLogicException
else 
	"CatERingAppManager.RecipeManager:  \nRecipeManager" -> "RecipeManager.currentRecipe:  \nr": setIngredientDose()
	Activate "RecipeManager.currentRecipe:  \nr"
	loop ["fino a soddisfacimento"]
		"RecipeManager.currentRecipe:  \nr" -> "RecipeManager.currentRecipe:  \nr": addIngredient(ingredient)
		"RecipeManager.currentRecipe:  \nr" -> "RecipeManager.currentRecipe:  \nr": addDose(ingredient, dose)
	end
	"RecipeManager.currentRecipe:  \nr" -> "CatERingAppManager.RecipeManager:  \nRecipeManager": r
	Deactivate "RecipeManager.currentRecipe:  \nr"
	"CatERingAppManager.RecipeManager:  \nRecipeManager" -> User: r
	Deactivate "CatERingAppManager.RecipeManager:  \nRecipeManager"
end
```