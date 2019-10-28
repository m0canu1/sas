```plantuml

title: 3b. modifyDose

Actor User
Participant "CatERingAppManager.RecipeManager:  \nRecipeManager" as RM
Participant "RecipeManager.currentRecipe:  \nRecipe" as CR
Participant "rec: RecipeEventReciever" as RER
Participant "currentRecipe.ingr_doses: \nHashMap<Ingredient, Dose>" as HM
User -> RM: modifyDose(ingredient, dose)
Activate RM
opt
	alt ["currentRecipe == null"]
		RM --> User: throw UseCaseLogicException
	else 

		RM -> CR: setIngredientDose(ingredient, dose)
        Activate CR
        CR -> HM: add(ingredient, dose)
        Deactivate CR		
        Activate HM
        
       	
        loop for each rec in receiver
            RM -> RER: notifyDoseModified(currentRecipe, ingredient, dose)
            activate RER 
            deactivate RER
		end
        Deactivate HM
	
		Deactivate RM
	end
end
```
