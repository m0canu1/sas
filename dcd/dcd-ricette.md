```plantuml

Class RecipeManager {

	createRecipe(): Recipe
	createRecipe(title: String): Recipe
	
	setCurrentRecipe(recipe: Recipe)

	writeRecipeStep(recipe: Recipe)
	modifyStep(step: Step, details: String)
	deleteStep(step: Step)
	groupRecipeSteps(stepsToGroup: list<Step>)
	addVariant(original_step: Step)

	setIngredientDose()
	addPreparationIngredient(preparation: Preparation)
	modifyDose()
}

Class Recipe {
	title: String
	published: Boolean
	ingredients: list<String>
	doses: list<Number>
	original: Recipe

	setTitle(title: String)
	setOwner(user: User)
	setPublished(pub: Boolean)
	createIngredients(): list<String>
	createListDoses(): list<Number>
	createListSteps(): list<Step> 

	writeStep(): Step
	writeStep(originalStep: Step): Step
	addIngredient(ingredient: String)
	addDose(ingredient: String, dose: Number)
	addStep(step: Step)
	modifyStep(step: Step, details: String)
	groupSteps(stepsToGroup: list<Step>): Step
	removeStep(step: Step)

	addIngredientDose()
	addIngredient(ingredient: String)
	addDose(ingredient: String, dose: Number)
	addPreparationIngredient(preparation: Preparation)
	modifyDose(ingredient: String, dose: Number)
}

Class Step {
	details: String
	original: Step

	step()
	step(details: String)
	aggregateSteps(steps: list<Step>): Step
	setDetails(details: String)
	remove(step: Step)
	setOriginal(original_step: Step)
}

Class Preparation {
	name: String

	getName(): String
}


Class UserManager {
	getCurrentUser()
}

Class User {
	isChef(): boolean
}


RecipeManager -- "0..n" Recipe: currentRecipe >

```