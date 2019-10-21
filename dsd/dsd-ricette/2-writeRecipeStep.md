```plantuml

title: 2. writeRecipeStep

Actor User
Participant "CatERingAppManager.RecipeManager:  \nRecipeManager" as RM
Participant "RecipeManager.currentRecipe:  \nr" as CR

User -> RM: writeRecipeStep(details?)
Activate RM
RM -> CR: writeStep(details?)
activate CR
alt ["currentRecipe == null"]
    CR --> User: throw UseCaseLogicException
        create "s: Step"
        CR -> "s: Step": step(details?)
        Activate "s: Step"
        opt ["details != null"]
            "s: Step" -> "s: Step": setDetails(details)
        end
        "s: Step" --> CR: s
        Deactivate "s: Step"
        CR -> "Steps: list<Step>": addStep(s)
        Activate "Steps: list<Step>"
        Deactivate "Steps: list<Step>"
        CR --> RM: notifyRecipeUpdated(r)
    deactivate CR
    Deactivate RM    
end

```
