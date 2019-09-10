```plantuml
Actor User
Participant "CatERingAppManager.RecipeManager" as RM
Participant "CatERingAppManager.RecipeManager: \ncurrentRecipe" as CR
Participant "CatERingAppManager.currentRecipe.currentStep: \ns" as CS

opt
    User -> RM: deleteStep(recipe, step)
    Activate RM

    alt ["currentRecipe == null"]
        RM --> User: throw UseCaseLogicException
    else
        RM -> CR: deleteStep(step)
        Activate CR
    
        CR -> CS: deleteStep(step)
        Activate CS
        CS -> CS: delete()
        Destroy CS

        CR --> RM: recipe
        Deactivate CR

        RM --> User: recipe
        Deactivate RM

    end
end

```
