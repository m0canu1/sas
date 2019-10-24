```plantuml

title: DSD per "Gestire ricette"
title: 1. createRecipe
Actor User
Participant "CatERingAppManager.RecipeManager:  \nRecipeManager" as RM
Participant "CatERingAppManager.UserManager:  \nUserManager" as UM
Participant "rec: \nRecipeEventReceiver" as RER

User -> RM: createRecipe(title?)
activate RM
RM -> UM: getCurrentUser()
activate UM
UM -> RM: user
deactivate UM

alt [!user.isChef() or !user.isCuoco()]
    RM --> User: throw UseCaseLogicException
else
    create "r: Recipe"
    RM -> "r: Recipe": create(user, title?)
    activate "r: Recipe"
    opt [title!=null]
        "r: Recipe" -> "r: Recipe": setTitle(title)
    end
    "r: Recipe" -> "r: Recipe": setOwner(user)
    "r: Recipe" -> "r: Recipe": setPublished(false)
    create "r.ingr_doses: HashMap<Ingredient, Dose>"
    "r: Recipe" -> "r.ingr_doses: HashMap<Ingredient, Dose>":create()
    create "r.steps:\nList<Step>"
    "r: Recipe" -> "r.steps:\nList<Step>":create()
    "r: Recipe" --> RM: r
    deactivate "r: Recipe"
    RM -> RM : setCurrentRecipe(r)
    loop for each rec in receivers
      RM -> RER: notifyRecipeCreated(r)
      activate RER
  		activate RER
    end
end
    deactivate RM

```
