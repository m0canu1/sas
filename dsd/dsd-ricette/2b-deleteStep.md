```plantuml
Actor User
Participant "CatERingAppManager.RecipeManager"
Participant "CatERingAppManager.RecipeManager: \ncurrentRecipe"

opt
    User -> "CatERingAppManager.RecipeManager": deleteStep(recipe, step)
    Activate "CatERingAppManager.RecipeManager"

    alt [currentRecipe!=null]
        "CatERingAppManager.RecipeManager" --> User: throw UseCaseLogicException
    else
        "CatERingAppManager.RecipeManager" -> "CatERingAppManager.RecipeManager: \ncurrentRecipe": deleteStep(step)
        Activate "CatERingAppManager.RecipeManager: \ncurrentRecipe"
        
        "CatERingAppManager.RecipeManager: \ncurrentRecipe" -> "CatERingAppManager.RecipeManager: \ncurrentRecipe": deleteStep(step)

        "CatERingAppManager.RecipeManager: \ncurrentRecipe" -> "CatERingAppManager.RecipeManager": recipe
        Deactivate "CatERingAppManager.RecipeManager: \ncurrentRecipe"

        "CatERingAppManager.RecipeManager" -> User: recipe
        Deactivate "CatERingAppManager.RecipeManager"

    end
    


end




```
