```plantuml

title: 2b. deleteStep

Actor User
Participant "CatERingAppManager.RecipeManager" as RM
Participant "CatERingAppManager.RecipeManager.currentRecipe: \nRecipe" as CR
Participant "currentRecipe.steps: list<Step>" as CS
Participant "rec: \nRecipeEventReciever" as RER

opt
    User -> RM: deleteStep(step)
    Activate RM
    alt ["currentRecipe == null"]
        RM --> User: throw UseCaseLogicException
    else
        RM -> CR: deleteStep(step)
        Activate CR
        CR -> CS: remove(step)
        Activate CS
        Deactivate CS
        Deactivate CR
        loop for each rec in receivers
      		RM -> RER: notifyStepDeleted(currentRecipe, step)
          activate RER
          deactivate RER
      	end
    end
    Deactivate RM
end

```
