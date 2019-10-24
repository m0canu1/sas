```plantuml

title: 2a. modifyStepDetails

Actor User
Participant "CatERingAppManager.RecipeManager" as RM 
Participant "CatERingAppManager.RecipeManager.currentRecipe: \nRecipe" as CR
Participant "currentRecipe.steps: list<Step>" as CS 
Participant "rec: RecipeEventReciever" as RER
opt
    User -> RM: modifyStepDetails(step, details)
    Activate RM
    alt ["currentRecipe == null"]
        RM --> User: throw UseCaseLogicException
    
    else
        RM -> CR: modifyStepDetails(step, details)
        Activate CR

       
        CR -> CS: setDetails(step, details)
        Activate CS
        Deactivate CS       
        Deactivate CR
        loop for each rec in recievers
        RM -> RER: notifyDetailsModified(currentRecipe, step, details)
        end
    end
    Deactivate RM
end
```
