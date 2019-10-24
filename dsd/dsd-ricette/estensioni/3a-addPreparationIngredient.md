```plantuml

title: 3a. addPreparationAsIngredient

Actor User
Participant "CatERingAppManager.RecipeManager:  \nRecipeManager" as RM
Participant "RecipeManager.currentRecipe:  \nRecipe" as CR
Participant "rec: \nRecipeEventReceiver" as RER
Participant "currentRecipe.ingr_doses: HashMap<Ingredient, Dose>" as HM

opt

	User -> RM: addPreparationIngredient(preparation, dose?)
	Activate RM
	alt ["currentRecipe == null"]
		RM --> User: throw UseCaseLogicException
	else
		RM -> "preparation: Preparation": getPrepName()
		Activate "preparation: Preparation"
		"preparation: Preparation" -> RM: prep_name
		Deactivate "preparation: Preparation"

		RM -> CR: addPreparationIngredient(prep_name, dose?)
		Activate CR
			CR -> "currentRecipe.ingr_doses: HashMap<Ingredient, Dose>": addIngredient(prep_name)
			Activate "currentRecipe.ingr_doses: HashMap<Ingredient, Dose>"
				opt ["dose != null"]
			    CR -> "currentRecipe.ingr_doses: HashMap<Ingredient, Dose>": addDose(prep_name, dose)
				end
				"currentRecipe.ingr_doses: HashMap<Ingredient, Dose>" --> CR: ingr_doses
      Deactivate "currentRecipe.ingr_doses: HashMap<Ingredient, Dose>"

			loop for each rec in RecipeEventReciever
					RM --> RER: notifyPreparationIngredientAdded(currentRecipe, preparation)
					activate RER
					deactivate RER
			end
  end
	Deactivate RM

end

```
