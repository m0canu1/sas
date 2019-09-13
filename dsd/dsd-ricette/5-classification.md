```plantuml
Actor User
Participant "CatERing.AppManager.RecipeManager: \nrecipeManager" as RM
Participant "RecipeManager.currentRecipe: \nr" as CR

User -> RM: addClassification()
Activate RM

alt ["currentRecipe == null"]
	RM --> User: throw UseCaseLogicException
else
	RM -> CR: addClassification()
	Activate CR

	CR -> "class: Class": getClassName()
	Activate "class: Class"
	"class: Class" -> CR: className
	Deactivate "class: Class"

	CR -> CR: setClass(class)
	
end
Deactivate CR
Deactivate RM


```
