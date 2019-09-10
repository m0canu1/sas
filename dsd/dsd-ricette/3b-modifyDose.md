```plantuml
Actor User
Participant "CatERingAppManager.RecipeManager:  \nRecipeManager" as RM
Participant "RecipeManager.currentRecipe:  \nr" as CR

User -> RM: modifyDose(recipe)
Activate RM
opt
	alt ["currentRecipe == null"]
		RM --> User: throw UseCaseLogicException
	else 
		RM -> CR: modifyDose()
		Activate CR
		loop ["fino a soddisfacimento"]
			CR -> CR: modifyDose(ingredient, dose)
		end
		CR -> RM: r
		Deactivate CR
		RM -> User: r
		Deactivate RM
	end
end
```
