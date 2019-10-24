```plantuml

title: 1b. removeEvent

Actor  User
Participant "CatERingAppManager.EventManager: \nEventManager"  as EM
Participant "CatERingAppManager.UserManager" as UM
Participant "EventManager.currentEvent: \nEvent" as CE
Participant "rec: EventEventReciever" as EER

User -> EM: selectEvent(event)
Activate EM

EM -> UM: getCurrentUser()
Activate UM
UM --> EM: user
Deactivate UM

alt [!user.isManager()]
    EM --> User: throw UseCaseLogicException
else
    EM -> EM: setCurrentEvent(event)
		EM -> CE: deleteEvent(event)
		Activate CE
		CE --> EM:
		Deactivate CE
		destroy CE
		loop for each r in receiver
        EM -> EER: notifyEventDestroyed(event)
        Activate EER
        Deactivate EER
    end
end
Deactivate EM

```
