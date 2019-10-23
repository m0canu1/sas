```plantuml

title: 2b. deleteStep

Actor User
Participant "CatERingAppManager.RecipeManager" as RM
Participant "CatERingAppManager.RecipeManager: \ncurrentRecipe" as CR
Participant "steps: list<Step>" as CS

opt
    User -> RM: deleteStep(step)
    Activate RM

    alt ["currentRecipe == null"]
        RM --> User: throw UseCaseLogicException
    else
        RM -> CR: getStepList()
        Activate CR
    
        CR --> RM: steps: list<Step>
        Deactivate CR
        Activate CS
        RM -> CS: removeStep(step)
        Deactivate CS

    end
    Deactivate RM
end

```
