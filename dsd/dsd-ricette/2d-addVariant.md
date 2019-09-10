```plantuml
Actor User
Participant "CatERingAppManager.RecipeManager" as RM 
Participant "CatERingAppManager.RecipeManager: \ncurrentRecipe" as CR
Participant "currentRecipe.currentStep: \ns" as CS 

opt
	User -> RM: addVariant(recipe, step)
	Activate RM

	alt ["currentRecipe == null"]
        RM --> User: throw UseCaseLogicException
    
    else
    	RM -> CR: addVariant(step)
    	Activate CR

    	CR -> CS: addVariant(step)
    	Activate CS

    	create "s_alt: Step"
    	Activate "s_alt: Step"
    	CS -> "s_alt: Step": createStep(details?)

    	opt ["details!=null"]
    		"s_alt: Step" -> "s_alt: Step": setDetails(details)
    	end
    	"s_alt: Step" --> CS: "s_alt: Step"
    	Deactivate "s_alt: Step"

    	CS -> CS: addVariant("s_alt: Step")

    	CS --> CR: step
    	Deactivate CS

    	CR --> RM: step
    	Deactivate CR

    	RM --> User: recipe
    	Deactivate RM
   	end
end
```
