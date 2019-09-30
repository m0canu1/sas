```plantuml

title: 2a. modifyStep

Actor User
Participant "CatERingAppManager.RecipeManager" as RM 
Participant "CatERingAppManager.RecipeManager: \ncurrentRecipe" as CR
Participant "steps: list<Step>" as CS 
opt
    User -> RM: modifyStep(step, details)
    Activate RM
    alt ["currentRecipe == null"]
        RM --> User: throw UseCaseLogicException
    
    else
        RM -> CR: modifyStep(step, details)
        Activate CR
        
        CR -> CS: setDetails(details)
        Activate CS
        Deactivate CS       
        Deactivate CR    
    end
    Deactivate RM
end
```
