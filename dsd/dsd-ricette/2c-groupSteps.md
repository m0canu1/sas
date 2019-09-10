```plantuml

Actor User
Participant "CatERingAppManager.RecipeManager:  \nRecipeManager" as RM
Participant "RecipeManager.currentRecipe:  \nr" as CR
Participant "CatERingAppManager.currentRecipe.currentStep: \ns" as CS

User -> RM: groupRecipeSteps(recipe, <list>step)
activate RM
RM -> CR: groupSteps(<list>step)
activate CR
alt ["currentRecipe == null"]

    create "s_group: Step"
    Activate "s_group: Step"

    CR -> "s_group: Step": createStep(<list>step) 

    "s_group: Step" -> "s_group: Step": setGroupOfSteps(<list>step)
    "s_group: Step" --> CR: s_group
    deactivate "s_group: Step"
    CR --> RM: s_group
    deactivate CR
    RM --> User: recipe
end

```