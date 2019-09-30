```plantuml
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
	getCurrentUser(): User
}

Class User {
	isChef(): boolean
    isManager(): boolean
}

Class Classification {
    className: String
    getClassName(): String
}

Class Event {
    owner: Manager
    fine: boolean
    cancelled: boolean
    notes: List<String>
    form: Form
    chef: Chef
    staff: list<StaffMember>
    setChef(chef: Chef)
    setOwner(manager: Manager)
    setFine(fine: Boolean)
    setCancelled(cancelled: Boolean)
    createNotes()
    addNote(text: String)
    cancelEvent()
}

Interface EventEvReceiver{
    notifyEventCreated(e: Event)
    notifyEventSelected(e: Event)
    notifyStaffRemoved(e: Event s: List<StaffMember>)
    notifyEventCancelled(e: Event)
    notifyInfoModified(e: Event)
    notifyFormCreated(e: Event, f: Form)
    notifyChefAdded(e: Event, c: Chef)
    notifyStaffAdded(e: Event, s: List<Staff>)
    notifyNotesWritten(e: Event)
}

Class EventManager {
    currentEvent: Event
    createEvent(owner: Manager)
    setCurrentEvent(e: Event)
    selectEvent()
    getStaffList(): list<StaffMember>
    removeStaff()
    removeEvent()
    modifyInfo()
    getEvent(): Event
    createForm()
    setForm(form: Form)
    addChef()
    addStaff()
    writeNote()
}


Class Form {
    date: Data
    location: String
    n_participants: Number
    Form()
    setDate(date: Data)
    setLocation(place: String)
    setParticipants(n_part: Number)
    modifyForm()
}


Class Chef {
    isAvailable(): boolean
}
    
Class StaffMember {
    isAvailable(): Boolean
}

Class StaffManager {
    selectChef(): Chef
    selectStaffMember(staff_list: list<StaffMember>): StaffMember
}


EventEvReceiver "0..n" <-- EventManager

User "1" -- "0.n" Event
Event "1" -- "0..n" EventManager
User -- "0..n" UserManager
Form "1" -- "1" Event
StaffMember -- "0..n" StaffManager
Chef -- "0..n" StaffManager
Chef "1" -- "0..n" Event
StaffMember "0..n" -- "1..n" Event



RecipeManager "0..n" <-- RecipeEventReceiver

RecipeManager -- "0..n" Recipe: currentRecipe >

Recipe "1..n" -- "0..n" Classification: contains <

Recipe "1..n" -- "1" Step: contains >


Preparation "0..n" -- Recipe: contains <

User -- RecipeManager

```
