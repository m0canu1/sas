```plantuml

title: 2. writeRecipeStep

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
        CR -> "s: Step": step(details?)
        Activate "s: Step"
        opt ["details != null"]
            "s: Step" -> "s: Step": setDetails(details)
        end
        CR -> "s: Step": setOriginal(null)
        Deactivate "s: Step"
        CR -> "Steps: list<Step>": addStep(s)
        Activate "Steps: list<Step>"
        Deactivate "Steps: list<Step>"
    end
    deactivate CR
    Deactivate RM    
end

```
