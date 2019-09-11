```plantuml

Actor User
Participant "CatERingAppManager.RecipeManager:  \nRecipeManager" as RM
Participant "RecipeManager.currentRecipe:  \nr" as CR

User -> RM: groupRecipeSteps(<list>step)
activate RM
alt ["currentRecipe == null"]
RM -> CR: groupSteps(<list>step)
activate CR

    create "s_group: Step"

    CR -> "s_group: Step": aggregateSteps(<list>Step) 
    Activate "s_group: Step"

    "s_group: Step" --> CR: s_group
    Deactivate "s_group: Step"
    CR -> CR: addStep(s_group)
end
deactivate CR
deactivate RM

```