```plantuml

title: 2c. groupSteps

Actor User
Participant "CatERingAppManager.RecipeManager:  \nRecipeManager" as RM
Participant "RecipeManager.currentRecipe:  \nRecipe" as CR
Participant "steps: list<Step>" as CS
Participant "rec: \nRecipeEventReciever" as RER

User -> RM: groupRecipeSteps(<list>steps_to_group)
activate RM
alt ["currentRecipe == null"]
    RM -> CR: groupSteps(<list>steps_to_group)
    activate CR
    loop "for all s in <list>steps_to_group"
        CR -> CS: removeStep(s)
    end
    create "s_group: GroupedStep()"
    CR -> "s_group: GroupedStep()": create(<list>steps_to_group)
    "s_group: GroupedStep()" -> CR: s_group
    CR -> CS: addStep(s_group)
    loop for each rec in RecipeEventReciever
        RM --> RER: notifyStepsGrouped(currentRecipe, steps)
        activate RER
        deactivate RER
    end
end
deactivate CR
deactivate RM

```
