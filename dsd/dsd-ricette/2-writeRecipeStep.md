```plantuml

title: 2. writeRecipeStep

Actor User
Participant "CatERingAppManager.RecipeManager:  \nRecipeManager" as RM
Participant "RecipeManager.currentRecipe:  \nr" as CR
Participant "rec: \nRecipeEventReciever" as RER
User -> RM: writeRecipeStep(details)
Activate RM
RM -> CR: writeStep(details)
activate CR
alt ["currentRecipe == null"]
    CR --> User: throw UseCaseLogicException
        create "s: Step"
        CR -> "s: Step": create(details)
        Activate "s: Step"
        "s: Step" -> "s: Step": setDetails(details)
        Deactivate "s: Step"
        CR -> "currentRecipe.steps: \nList<Step>": add(s)
        Activate "currentRecipe.steps: \nList<Step>"
        Deactivate "currentRecipe.steps: \nList<Step>"
        CR --> RM: s
        loop for each rec in RecipeEventReciever
            RM --> RER: notifyRecipeUpdated(r)
            activate RER
            deactivate RER
        end
    deactivate CR
    Deactivate RM    
end

```
