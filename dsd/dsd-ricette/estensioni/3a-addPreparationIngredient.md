```plantuml

title: 3a. addPreparationAsIngredient

Actor User
Participant "CatERingAppManager.RecipeManager:  \nRecipeManager" as RM
Participant "RecipeManager.currentRecipe:  \nr" as CR

opt 

	User -> RM: addPreparationIngredient(preparation)
	Activate RM

	alt ["currentRecipe == null"]
		RM --> User: throw UseCaseLogicException
	else 
		RM -> CR:  getIngredientsList()
		Activate CR
        CR --> RM: ingredients: list<String>
        Deactivate CR
		RM -> "preparation: Preparation": getPrepName()
		Activate "preparation: Preparation"
		"preparation: Preparation" -> RM: prep_name
		Deactivate "preparation: Preparation"
        RM -> "ingredients: list<String>": addIngredient(prep_name)
        Activate "ingredients: list<String>"
		Deactivate "ingredients: list<String>"
		Deactivate RM
	end

end

```
