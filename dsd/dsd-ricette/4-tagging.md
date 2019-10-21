```plantuml

title: 5. addClassification

Actor User
Participant "CatERing.AppManager.RecipeManager: \nrecipeManager" as RM
Participant "RecipeManager.currentRecipe: \nr" as CR

User -> RM: addTag(r, tag)
Activate RM

alt ["currentRecipe == null"]
	RM --> User: throw UseCaseLogicException
else
	RM -> CR: addClassification(tag)
	Activate CR

	CR -> "class: Tag": getTagName()
	Activate "class: Tag"
	"class: Tag" -> CR: tagname REMEMBER TO CHECK MDD
	Deactivate "class: Tag"
	CR -> CR: setTag(tagname)
	CR --> RM: notifyRecipeUpdated(r)
end
Deactivate CR
Deactivate RM


```