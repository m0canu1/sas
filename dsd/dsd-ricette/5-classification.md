```plantuml
Actor User
Participant "CatERing.AppManager.RecipeManager: \nrecipeManager" as RM
Participant "RecipeManager.currentRecipe: \nr" as CR
Participant "CatERing.AppManager.ClassManager: \nclassManager" as CM

User -> RM: addClassification(recipe)
Activate RM

alt ["currentRecipe == null"]
	RM --> User: throw UseCaseLogicException
else
	RM -> CR: addClassification()
	Activate CR

	CR -> CM: getClass()
	Activate CM

	CM --> CR: class
	Deactivate CM

	CR -> CR: setClass(class)
	
	CR --> RM: r
	Deactivate CR

	RM --> User: r
	Deactivate RM

end


```
