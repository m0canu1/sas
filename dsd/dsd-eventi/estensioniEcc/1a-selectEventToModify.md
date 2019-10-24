```plantuml

title: 1a. selectEvent

Actor  User
Participant "CatERingAppManager.EventManager: \nEventManager"  as EM
Participant "CatERingAppManager.UserManager" as UM
Participant "rec: EventEventReceiver" as EER
opt
	User -> EM: selectEvent(event)
	Activate EM

	EM -> UM: getCurrentUser()
	Activate UM
	    
	UM --> EM: user
	Deactivate UM

	alt [!user.isManager()]
	    EM --> User: throw UseCaseLogicException
	else
	    EM -> EM: setCurrentEvent(e)
	end

    loop for each rec in receiver
        EM -> EER: notifyEventSelected(e)
        Activate EER
        Deactivate EER
    end

	Deactivate EM
end
```
