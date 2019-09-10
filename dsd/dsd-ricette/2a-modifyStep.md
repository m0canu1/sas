```plantuml
Actor User
Participant "CatERingAppManager.RecipeManager" as RM 
Participant "CatERingAppManager.RecipeManager: \ncurrentRecipe" as CR
Participant "currentRecipe.currentStep: \ns" as CS 
opt
    User -> RM: modifyStep(recipe, step, details)
    Activate RM
    alt ["currentRecipe == null"]
        RM --> User: throw UseCaseLogicException
    
    else
        RM -> CR: modifyStep(step, details)
        Activate CR
        
        CR -> CS: modifyStep(step, details)
        Activate CS
    
        CS -> CS: setDetails(details)
       
       
        CR --> RM: recipe
        Deactivate CS
        Deactivate CR
    
        RM --> User: recipe
        Deactivate RM
    end
end
```
