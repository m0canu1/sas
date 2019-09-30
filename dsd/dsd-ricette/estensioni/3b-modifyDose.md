```plantuml
Actor User
Participant "CatERingAppManager.RecipeManager:  \nRecipeManager" as RM
Participant "RecipeManager.currentRecipe:  \nr" as CR

User -> RM: modifyDose()
Activate RM
opt
	alt ["currentRecipe == null"]
		RM --> User: throw UseCaseLogicException
	else 
		loop ["fino a soddisfacimento"]

		RM -> CR: modifyDose(ingredient, dose)
		Activate CR
			CR -> "doses: list<Dose>": setDose(ingredient, dose)
			Activate "doses: list<Dose>"
			Deactivate "doses: list<Dose>"
		end

		Deactivate CR
		Deactivate RM
	end
end
```