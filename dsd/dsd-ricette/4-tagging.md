```plantuml

title: 5. addClassification

Actor User
Participant "CatERing.AppManager.RecipeManager: \nRecipeManager" as RM
Participant "RecipeManager.currentRecipe: \nRecipe" as CR
Participant "rec: \nRecipeEventReceiver" as RER

User -> RM: addTag(tag)
Activate RM

alt ["currentRecipe == null"]
	RM --> User: throw UseCaseLogicException
else
	RM -> CR: addClassification(tag)
	Activate CR

	CR -> "currentRecipe.tag: Tag": getTagName()
	Activate "currentRecipe.tag: Tag"
	"currentRecipe.tag: Tag" -> CR: tagName
	Deactivate "currentRecipe.tag: Tag"
	CR -> CR: setTag(tagName)
	loop for each rec in receivers
		RM -> RER: notifyRecipeTagged(currentRecipe, tag)
	end
end
Deactivate CR
Deactivate RM


```
