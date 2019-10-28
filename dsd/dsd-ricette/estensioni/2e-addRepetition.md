```plantuml

title: 2e. addRepetition

Actor User
Participant "CatERingAppManager.RecipeManager" as RM 
Participant "CatERingAppManager.RecipeManager.currentRecipe: \nRecipe" as CR
Participant "rec: RecipeEventReceiver" as RER


opt
	User -> RM: addRepetition(original_step)
	Activate RM

	alt ["currentRecipe == null"]
        RM --> User: throw UseCaseLogicException
    else
    	
    	RM -> CR: addRepetition(original_step)
        Activate CR
        

    	create "s_rep: Step"
        
            CR -> "s_rep: Step": create(original_step)
        Activate "s_rep: Step"
            "s_rep: Step" -> "s_rep: Step": setDetails(original_step.getDetails())
          
        
        
        Deactivate "s_rep: Step"
        CR --> RM: s_rep
        CR -> "currentRecipe.steps: List<Step>": add(s_rep)
        Activate "currentRecipe.steps: List<Step>"
        Deactivate CR
        Deactivate "currentRecipe.steps: List<Step>"
        loop for each rec in reciever
            RM -> RER: notifyRepetitionAdded(currentRecipe, original_step, s_rep)
            Activate RER
            Deactivate RER
        end
    	
    	Deactivate RM
   	end
end
```
