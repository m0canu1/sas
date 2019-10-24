```plantuml

title: (2-5)a. removeEvent

Actor  User
Participant "CatERingAppManager.EventManager: \nEventManager"  as EM
Participant "EventManager.currentEvent: \nEvent" as CE
Participant "rec: EventEventReciever" as EER

User -> EM: deleteEvent(event)
Activate EM
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
Deactivate EM

```
