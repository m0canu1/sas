```plantuml
Actor User
Participant "CatERingAppManager.RecipeManager:  \nRecipeManager"
Participant "RecipeManager.currentRecipe:  \nr"

User -> "RecipeManager.currentRecipe:  \nr": writeRecipeStep(recipe)
activate "RecipeManager.currentRecipe:  \nr"
alt ["currentRecipe == null"]
    "RecipeManager.currentRecipe:  \nr" --> User: throw UseCaseLogicException
    create "s: Step"
    "RecipeManager.currentRecipe:  \nr" -> "s: Step":createStep(details)
    activate "s: Step"
    "s: Step" -> "s: Step":setDetails(details)
    "s: Step" --> "RecipeManager.currentRecipe:  \nr": s
    deactivate "s: Step"
    "RecipeManager.currentRecipe:  \nr" -> "RecipeManager.currentRecipe:  \nr": addStep(s)
    "RecipeManager.currentRecipe:  \nr" -> "CatERingAppManager.RecipeManager:  \nRecipeManager": r
    deactivate "RecipeManager.currentRecipe:  \nr"
    "CatERingAppManager.RecipeManager:  \nRecipeManager" --> User: r
    
end

```