```plantuml

title: 2a. modifyStepDetails

Actor User
Participant "CatERingAppManager.RecipeManager" as RM 
Participant "CatERingAppManager.RecipeManager: \ncurrentRecipe" as CR
Participant "steps: list<Step>" as CS 
opt
    User -> RM: modifyStepDetails(step, details)
    Activate RM
    alt ["currentRecipe == null"]
        RM --> User: throw UseCaseLogicException
    
    else
        RM -> CR: getStepList()
        Activate CR
        CR --> RM: steps: list<Step>

       
        Deactivate CR

        Activate CS
        RM -> CS: setDetails(step, details)
        Deactivate CS       
    end
    Deactivate RM
end
```
