```plantuml
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
        RM -> CR: removeStep(step)
        Activate CR
    
        CR -> CS: remove(step)
        Activate CS
        Deactivate CS
        Deactivate CR


    end
    Deactivate RM
end

```
