```plantuml

title: 2c. groupSteps

Actor User
Participant "CatERingAppManager.RecipeManager:  \nRecipeManager" as RM
Participant "RecipeManager.currentRecipe:  \nr" as CR
Participant "steps: list<Step>" as CS

User -> RM: groupRecipeSteps(<list>steps_to_group)
activate RM
alt ["currentRecipe == null"]
    RM -> CR: getStepList()
    activate CR
        CR --> RM: steps: list<Steps>
    deactivate CR
    
    loop "for all Step:s in <list>steps_to_group"
        RM -> CS: removeStep(s)
    end
    create "s_group: GroupedStep"

    RM -> "s_group: GroupedStep": aggregateSteps(<list>Step) 
    "s_group: GroupedStep" --> RM: s_group
    
    RM -> CS: addStep(s_group)
end
deactivate CR
deactivate RM

```
