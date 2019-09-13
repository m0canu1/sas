```plantuml
Actor User
Participant "CatERingAppManager.RecipeManager:  \nRecipeManager" as RM
Participant "RecipeManager.currentRecipe:  \nr" as CR


User -> RM:setStepDetails()
Activate RM
alt ["currentRecipe == null"]
	RM --> User: throw UseCaseLogicException
else
    RM -> CR: setStepDetails()
    Activate CR
    CR -> "steps: list<Step>": getSteps()
    Activate "steps: list<Step>"
    "steps: list<Step>" --> CR: steps
    loop ["for each step in steps"]
        alt ["step.getDetails() == null"]
            CR -> "steps: list<Step>": setDetails(details)
            Deactivate "steps: list<Step>"
        else
        end
    end
end
Deactivate CR
Deactivate RM
```
