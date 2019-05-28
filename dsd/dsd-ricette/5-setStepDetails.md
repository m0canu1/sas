```plantuml
Actor User
Participant "CatERingAppManager.RecipeManager:  \nRecipeManager"
Participant "RecipeManager.currentRecipe:  \nr"
Participant "currentRecipe.currentStep:  \ns"

opt currentRecipe == null\n!currentMenu.hasRecipe(recipe)
User -> "CatERingAppManager.RecipeManager:  \nRecipeManager":setStepDetails(recipe, step)
Activate "CatERingAppManager.RecipeManager:  \nRecipeManager"
"CatERingAppManager.RecipeManager:  \nRecipeManager" -> "RecipeManager.currentRecipe:  \nr":setDetails(step)
Activate "RecipeManager.currentRecipe:  \nr"
"RecipeManager.currentRecipe:  \nr" --> User: throw UseCaseLogicException
loop
        "RecipeManager.currentRecipe:  \nr" -> "currentRecipe.currentStep:  \ns":setDetails(details)
        Activate "currentRecipe.currentStep:  \ns"
        "currentRecipe.currentStep:  \ns" -> "currentRecipe.currentStep:  \ns":setDetail(details)
        Deactivate "currentRecipe.currentStep:  \ns"
end
"RecipeManager.currentRecipe:  \nr" -> "CatERingAppManager.RecipeManager:  \nRecipeManager": r
Deactivate "RecipeManager.currentRecipe:  \nr"
"CatERingAppManager.RecipeManager:  \nRecipeManager" -> User: r
Deactivate "CatERingAppManager.RecipeManager:  \nRecipeManager"
end
```