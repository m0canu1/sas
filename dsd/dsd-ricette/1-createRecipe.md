```plantuml

title: DSD per "Gestire ricette"

Actor User
Participant "CatERingAppManager.RecipeManager:  \nRecipeManager" as RM
Participant "CatERingAppManager.UserManager:  \nUserManager" as UM

User -> RM:createRecipe(title?)
activate RM
RM -> UM:getCurrentUser()
activate UM
UM -> RM :user
deactivate UM

alt [!user.isChef()]
    RM --> User:throw UseCaseLogicException
else 
    create "r: Recipe"
    RM -> "r: Recipe":create(user, title?)
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
    "r: Recipe" --> RM : r
    deactivate "r: Recipe"
    RM -> RM :setCurrentRecipe(r)
    RM --> User:r
end
    deactivate RM

```
