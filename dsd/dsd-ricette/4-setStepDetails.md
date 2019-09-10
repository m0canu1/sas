```plantuml
Actor User
Participant "CatERingAppManager.RecipeManager:  \nRecipeManager" as RM
Participant "RecipeManager.currentRecipe:  \nr" as CR
Participant "currentRecipe.currentStep:  \ns" as CS


User -> RM:setStepDetails(recipe, step)
Activate RM
alt currentRecipe == null\n!currentMenu.hasRecipe(recipe)
	CR --> User: throw UseCaseLogicException
else
    RM -> CR:setDetails(step)
    Activate CR
    loop
            CR -> CS:setDetails(details)        
            Activate CS
            CS -> CS:setDetail(details)
            CS --> CR: s
            Deactivate CS
    end
end
CR -> RM: r
Deactivate CR
RM -> User: r
Deactivate RM
```
