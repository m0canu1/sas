```plantuml
Actor User
Participant "CatERing.AppManager.RecipeManager: \nrecipeManager"
Participant "RecipeManager.currentRecipe: \nr"
opt
    User -> "CatERing.AppManager.RecipeManager: \nrecipeManager": addAlternative(recipe)
    Activate "CatERing.AppManager.RecipeManager: \nrecipeManager"
    alt [""RecipeManager.currentRecipe: \nr"ecipe!=null"]
        "CatERing.AppManager.RecipeManager: \nrecipeManager" --> User: throw UseCaseLogicException
    else
        "CatERing.AppManager.RecipeManager: \nrecipeManager" -> "RecipeManager.currentRecipe: \nr": addAlternative()
        Activate "RecipeManager.currentRecipe: \nr"
        loop ["n volte"]
            create "r: AlternativeRecipe"
            "RecipeManager.currentRecipe: \nr" -> "r: AlternativeRecipe": copyCurrentRecipe(recipe)
            Activate "r: AlternativeRecipe"
            "r: AlternativeRecipe" -> "r: AlternativeRecipe": setTitle(title)
            loop forever
                "r: AlternativeRecipe" -> "r: AlternativeRecipe": setIngredients(ingredient)
                "r: AlternativeRecipe" -> "r: AlternativeRecipe": setDoses(ingredient, dose)
            end
        end
        "r: AlternativeRecipe" --> "RecipeManager.currentRecipe: \nr": r
        Deactivate "r: AlternativeRecipe"
        "RecipeManager.currentRecipe: \nr" --> "CatERing.AppManager.RecipeManager: \nrecipeManager": r
        Deactivate "RecipeManager.currentRecipe: \nr"
        "CatERing.AppManager.RecipeManager: \nrecipeManager" -> "CatERing.AppManager.RecipeManager: \nrecipeManager": addRecipe(r)
        "CatERing.AppManager.RecipeManager: \nrecipeManager" --> User
        Deactivate "CatERing.AppManager.RecipeManager: \nrecipeManager"
    end
end
```
