```plantuml
Actor  User
Participant "CatERingAppManager.EventManager: \nEventManager"  as EM
Participant "CatERingAppManager.UserManager" as UM

opt
	User -> EM: selectEvent()
	Activate EM

	EM -> UM: getCurrentUser()
	Activate UM
	    
	UM --> EM: user
	Deactivate UM

	EM -> "e: Event": getEvent()
	Activate "e: Event"
	"e: Event" -> EM: e
	Deactivate "e: Event"

	alt [!user.isManager()]
	    EM --> User: throw UseCaseLogicException
	else
	    EM -> EM: setCurrentEvent(e)
	end
	Deactivate EM
end
```
