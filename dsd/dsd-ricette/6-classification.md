```plantuml
Actor User
Participant "CatERing.AppManager.RecipeManager: \nrecipeManager"
Participant "RecipeManager.currentRecipe: \nr"
Participant "CatERing.AppManager.ClassManager: \nclassManager"

User -> "CatERing.AppManager.RecipeManager: \nrecipeManager": addClassification(recipe)
Activate "CatERing.AppManager.RecipeManager: \nrecipeManager"

alt ["currentRecipe == null"]
	"CatERing.AppManager.RecipeManager: \nrecipeManager" --> User: throw UseCaseLogicException
else
	"CatERing.AppManager.RecipeManager: \nrecipeManager" -> "RecipeManager.currentRecipe: \nr": addClassification()
	Activate "RecipeManager.currentRecipe: \nr"

	"RecipeManager.currentRecipe: \nr" -> "CatERing.AppManager.ClassManager: \nclassManager": getClass()
	Activate "CatERing.AppManager.ClassManager: \nclassManager"

	"CatERing.AppManager.ClassManager: \nclassManager" --> "RecipeManager.currentRecipe: \nr": class
	Deactivate "CatERing.AppManager.ClassManager: \nclassManager"

	"RecipeManager.currentRecipe: \nr" -> "RecipeManager.currentRecipe: \nr": setClass(class)
	
	"RecipeManager.currentRecipe: \nr" --> "CatERing.AppManager.RecipeManager: \nrecipeManager": r
	Deactivate "RecipeManager.currentRecipe: \nr"

	"CatERing.AppManager.RecipeManager: \nrecipeManager" --> User: r
	Deactivate "CatERing.AppManager.RecipeManager: \nrecipeManager"

end


```
