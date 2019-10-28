```plantuml

title: 2c. groupSteps

Actor User
Participant "CatERingAppManager.RecipeManager:  \nRecipeManager" as RM
Participant "RecipeManager.currentRecipe:  \nRecipe" as CR
Participant "currentRecipe.steps: list<Step>" as CS
Participant "rec: \nRecipeEventReciever" as RER

User -> RM: groupRecipeSteps(steps_to_group)
activate RM
alt ["currentRecipe == null"]
    RM -> CR: groupSteps(steps_to_group)
    activate CR
    loop "for all s in steps_to_group"
        CR -> CS: remove(s)
    end
    create "s_group: GroupedStep"
    
    CR -> "s_group: GroupedStep": create(steps_to_group)
    CR -> CS: add(s_group)
    activate CS
    deactivate CS
    CR --> RM: s_group
    
    loop for each rec in RecipeEventReciever
        RM --> RER: notifyStepsGrouped(currentRecipe, s_group)
        activate RER
        deactivate RER
    end
end
deactivate CR
deactivate RM

```
