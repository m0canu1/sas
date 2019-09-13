```plantuml
Actor User
Participant "CatERingAppManager.RecipeManager" as RM 
Participant "CatERingAppManager.RecipeManager: \ncurrentRecipe" as CR


opt
	User -> RM: addVariant(original_step)
	Activate RM

	alt ["currentRecipe == null"]
        RM --> User: throw UseCaseLogicException
    else
    	RM -> CR: writeStep(original_step)
    	Activate CR

    	create "s_alt: Step"
    	Activate "s_alt: Step"
            CR -> "s_alt: Step": step(details?)

        	opt ["details!=null"]
        		"s_alt: Step" -> "s_alt: Step": setDetails(details)
        	end
        	"s_alt: Step" --> CR: s_alt
            CR -> "s_alt: Step": setOriginal(original_step)
        Deactivate "s_alt: Step"

        CR -> "steps: list<Step>": addStep(s_alt)
        Activate "steps: list<Step>"
        Deactivate "steps: list<Step>"

    	Deactivate CR
    	Deactivate RM
   	end
end
```