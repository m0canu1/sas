```plantuml

Actor User
Participant "CatERingAppManager.RecipeManager:  \nRecipeManager"
Participant "CatERingAppManager.UserManager:  \nUserManager"

User -> "CatERingAppManager.RecipeManager:  \nRecipeManager":createRecipe(title?)
activate "CatERingAppManager.RecipeManager:  \nRecipeManager"
"CatERingAppManager.RecipeManager:  \nRecipeManager" -> "CatERingAppManager.UserManager:  \nUserManager":getCurrentUser()
activate "CatERingAppManager.UserManager:  \nUserManager"
"CatERingAppManager.UserManager:  \nUserManager" -> "CatERingAppManager.RecipeManager:  \nRecipeManager":user
deactivate "CatERingAppManager.UserManager:  \nUserManager"

alt [!user.isChef()]
    "CatERingAppManager.RecipeManager:  \nRecipeManager" --> User:throw UseCaseLogicException
else 
    create "r: Recipe"
    "CatERingAppManager.RecipeManager:  \nRecipeManager" -> "r: Recipe":create(user, title?)
    activate "r: Recipe"
    opt [title!=null]
        "r: Recipe" -> "r: Recipe":setTitle(title)
    end
    "r: Recipe" -> "r: Recipe":setOwner(user)
    "r: Recipe" -> "r: Recipe":setPublished(false)
    create "ingredients:\nList<Ingredient>"
    "r: Recipe" -> "ingredients:\nList<Ingredient>":create()
    create "doses:\nList<Float>"
    "r: Recipe" -> "doses:\nList<Float>":create()
    create "steps:\nList<Step>"
    "r: Recipe" -> "steps:\nList<Step>":create()
    Event --> "CatERingAppManager.RecipeManager:  \nRecipeManager": r
    "CatERingAppManager.RecipeManager:  \nRecipeManager" -> "CatERingAppManager.RecipeManager:  \nRecipeManager":setCurrentRecipe(r)
    "CatERingAppManager.RecipeManager:  \nRecipeManager" --> User:r
end
    deactivate "CatERingAppManager.RecipeManager:  \nRecipeManager"

```