```plantuml

title: 3b. modifyDose

Actor User
Participant "CatERingAppManager.RecipeManager:  \nRecipeManager" as RM
Participant "RecipeManager.currentRecipe:  \nr" as CR

User -> RM: modifyDose(ingredient, dose)
Activate RM
opt
	alt ["currentRecipe == null"]
		RM --> User: throw UseCaseLogicException
	else 
		loop ["fino a soddisfacimento"]
        

		RM -> CR: getIngredientList()
        Activate CR
        CR -> RM: ingredients: list<String>

		RM -> CR: getDosesList()
        CR -> RM: doses: list<Float>
       	Deactivate CR		
			RM -> "doses: list<Float>": setDose(ingredient, dose)
			Activate "doses: list<Float>"
			Deactivate "doses: list<Float>"
		end

	
		Deactivate RM
	end
end
```
