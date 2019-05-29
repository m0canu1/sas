```plantuml
Actor User
Participant "CatERingAppManager.RecipeManager"
Participant "CatERingAppManager.RecipeManager: \ncurrentRecipe"
Participant "currentRecipe.currentStep: \ns"
opt
    User -> "CatERingAppManager.RecipeManager": modifyStep(recipe, step)
    Activate "CatERingAppManager.RecipeManager"
    alt [currentRecipe!=null]
        "CatERingAppManager.RecipeManager" --> User: throw UseCaseLogicException
    
    else
        "CatERingAppManager.RecipeManager" -> "CatERingAppManager.RecipeManager: \ncurrentRecipe": modifyStep(step)
        Activate "CatERingAppManager.RecipeManager: \ncurrentRecipe"
        
        "CatERingAppManager.RecipeManager: \ncurrentRecipe" -> "currentRecipe.currentStep: \ns": modifyStep(step)
        Activate "currentRecipe.currentStep: \ns"
    
        "currentRecipe.currentStep: \ns" -> "currentRecipe.currentStep: \ns": setDetails(details)
       
       
        "CatERingAppManager.RecipeManager: \ncurrentRecipe" --> "CatERingAppManager.RecipeManager": recipe
        Deactivate "currentRecipe.currentStep: \ns"
        Deactivate "CatERingAppManager.RecipeManager: \ncurrentRecipe"
    
        "CatERingAppManager.RecipeManager" --> User: recipe
        Deactivate "CatERingAppManager.RecipeManager"
    end
end
```
