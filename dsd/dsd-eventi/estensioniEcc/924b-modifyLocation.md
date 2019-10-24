```plantuml

title: (2-4)b. modifyLocation

Actor User
Participant "CatERingAppManager.EventManager: \nEventManager" as EM
Participant "currentEvent.form: \nForm" as FM
Participant "rec: EventEventReciever" as EER

User -> EM: modifyLocation(loc)
Activate EM

EM -> CE: modifyLocation(loc)
Activate CE
CE -> FM: modifyLocation(loc)
Activate FM
FM -> FM: setLocation(loc)
Deactivate FM
CE --> EM: form
Deactivate CE

loop for each r in receiver
    EM -> EER: notifyFormModified(event)
    Activate EER
    Deactivate EER
end

Deactivate EM


```
