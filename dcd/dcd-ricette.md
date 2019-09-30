```plantuml
title: DCD per "Gestire ricette"
Interface RecipeEventReceiver {
    notifyRecipeCreated(r: Recipe)
    notifyRecipeSelected(r: Recipe)
    notifyStepAdded(r: Recipe, s: Step)
    notifyStepModified(r: Recipe, s: Step)
    notifyStepDeleted(r: Recipe, s: Step)
    notifyStepsGrouped(r: Recipe, s: List<Step>)
    notifyVariantAdded(r: Recipe, s: Step, s_variant: Step)
    notifyStepDetailsAdded(r: Recipe, s: Step)
    notifyPreparationAdded(r: Recipe, p: Preparation)
    notifyDoseModified(r: Recipe)
    notifyClassAdded(r: Recipe)
    notifyRecipePublished(r: Recipe, b: Boolean)


}


Class RecipeManager {
	createRecipe(): Recipe
	createRecipe(title: String): Recipe
	setCurrentRecipe(recipe: Recipe)
    setAlternativeRecipe()
	writeRecipeStep(recipe: Recipe)
	modifyStep(step: Step, details: String)
	deleteStep(step: Step)
	groupRecipeSteps(stepsToGroup: list<Step>)
	addVariant(original_step: Step)
	setStepDetails()
    setIngredientDose()
	addPreparationIngredient(preparation: Preparation)
	modifyDose()
    addClassification()
    lookUpOriginalRecipe(): Recipe
    publishRecipe()
    insertTitle()
    dontPublish()
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
    setClass(className: String)
    getSteps(): list<Step>
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
    setStepDetails()
    setOriginal(recipe: Recipe)
    exitWithoutPublishing()
}

Class Step {
	details: String
	original: Step
	step()
	step(details: String)
	aggregateSteps(steps: list<Step>): Step
	setDetails(details: String)
    getDetails(): String
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

Class Classification {
    className: String
    getClassName(): String
}


RecipeManager "0..n" <-- RecipeEventReceiver

RecipeManager -- "0..n" Recipe: currentRecipe >

Recipe "1..n" -- "0..n" Classification: contains <

Recipe "1..n" -- "1" Step: contains >

User -- UserManager

Preparation "0..n" -- Recipe: contains <

User -- RecipeManager

```
