```plantuml
Actor User
Participant "CatERingAppManager.RecipeManager:  \nRecipeManager"
Participant "RecipeManager.currentRecipe:  \nr"

User -> "CatERingAppManager.RecipeManager:  \nRecipeManager": writeRecipeStep(recipe)
Activate "CatERingAppManager.RecipeManager:  \nRecipeManager"
"CatERingAppManager.RecipeManager:  \nRecipeManager" -> "RecipeManager.currentRecipe:  \nr": writeStep()
activate "RecipeManager.currentRecipe:  \nr"
alt ["currentRecipe == null"]
    "RecipeManager.currentRecipe:  \nr" --> User: throw UseCaseLogicException
    loop forever
        "RecipeManager.currentRecipe:  \nr" -> "RecipeManager.currentRecipe:  \nr": addIngredients(ingredient)
        opt
            "RecipeManager.currentRecipe:  \nr" -> "RecipeManager.currentRecipe:  \nr": addDose(ingredient, dose)
        end
         create "s: Step"
         "RecipeManager.currentRecipe:  \nr" -> "s: Step":createStep(details)
         Activate "s: Step"
         opt
            "s: Step" -> "s: Step":setDetails(details)
         end
         Deactivate "s: Step"
         "RecipeManager.currentRecipe:  \nr" -> "currentRecipe.currentStep:  \ns": addStep(s)
         Activate "currentRecipe.currentStep:  \ns"
         Deactivate "currentRecipe.currentStep:  \ns"
    end
    "RecipeManager.currentRecipe:  \nr" -> "CatERingAppManager.RecipeManager:  \nRecipeManager": r
    deactivate "RecipeManager.currentRecipe:  \nr"
    "CatERingAppManager.RecipeManager:  \nRecipeManager" --> User: r
    Deactivate "CatERingAppManager.RecipeManager:  \nRecipeManager"
    
end

```
