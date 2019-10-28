```plantuml

title: 2d. addVariant

Actor User
Participant "CatERingAppManager.RecipeManager" as RM 
Participant "CatERingAppManager.RecipeManager: \ncurrentRecipe" as CR
Participant "rec: RecipeEventReciever" as RER

opt
	User -> RM: addVariant(original_step, details)
	Activate RM

	alt ["currentRecipe == null"]
        RM --> User: throw UseCaseLogicException
    else
    	
    	RM -> CR: addVariant(original_step, details)
        Activate CR
        

    	create "s_alt: VariantStep"

            CR -> "s_alt: VariantStep": create(original_step, details)
        Activate "s_alt: VariantStep"
            "s_alt: VariantStep" -> "s_alt: VariantStep": setDetails(details)
           	"s_alt: VariantStep" -> "s_alt: VariantStep": setOriginal(original_step)
            CR --> RM: s_alt
            Deactivate "s_alt: VariantStep"

            CR -> "currentRecipe.steps: List<Step>": add(s_alt)   
            Deactivate CR           
            Activate "currentRecipe.steps: List<Step>"
            Deactivate "currentRecipe.steps: List<Step>"
       
        
       
    	Deactivate CR
        loop for each rec in reciever
        RM -> RER: notifyVariantAdded(currentRecipe, original_step, s_alt)
        end
    	Deactivate RM
   	end
end
```
