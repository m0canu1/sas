```plantuml

title: 2e. addRepetition

Actor User
Participant "CatERingAppManager.RecipeManager" as RM 
Participant "CatERingAppManager.RecipeManager: \ncurrentRecipe" as CR


opt
	User -> RM: addRepetition(original_step)
	Activate RM

	alt ["currentRecipe == null"]
        RM --> User: throw UseCaseLogicException
    else
    	
    	RM -> CR: getStepList()
        Activate CR
        CR --> RM: steps: list<Step>
        Deactivate CR

    	create "s_rep: Step"

            RM -> "s_rep: Step": step(original_step)
        Activate "s_rep: Step"
            "s_rep: Step" -> "s_rep: Step": setDetails(original_step.getDetails())
            "s_rep: Step" --> RM: s_rep
          
        Deactivate "s_rep: Step"

        RM -> "steps: list<Step>": addStep(s_rep)
        Activate "steps: list<Step>"
        Deactivate "steps: list<Step>"
    	Deactivate CR
    	Deactivate RM
   	end
end
```
