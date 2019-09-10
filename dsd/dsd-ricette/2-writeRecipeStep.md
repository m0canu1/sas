```plantuml

Actor User
Participant "CatERingAppManager.RecipeManager:  \nRecipeManager" as RM
Participant "RecipeManager.currentRecipe:  \nr" as CR

User -> RM: writeRecipeStep(recipe)
Activate RM
RM -> CR: writeStep()
activate CR
alt ["currentRecipe == null"]
    CR --> User: throw UseCaseLogicException
    loop forever
        CR -> CR: addIngredients(ingredient)
        opt
            CR -> CR: addDose(ingredient, dose)
        end
        create "s: Step"
        CR -> "s: Step":createStep(details?)
        Activate "s: Step"
        opt ["details != null"]
            "s: Step" -> "s: Step":setDetails(details)
        end
        Deactivate "s: Step"
        CR -> "currentRecipe.currentStep:  \ns": addStep(s)
        Activate "currentRecipe.currentStep:  \ns"
        Deactivate "currentRecipe.currentStep:  \ns"
    end
    CR -> RM: r
    deactivate CR
    RM --> User: r
    Deactivate RM
    
end

```
