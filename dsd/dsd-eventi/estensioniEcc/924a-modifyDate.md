```plantuml

title: (2-4)a. modifyDate

Actor User
Participant "CatERingAppManager.EventManager: \nEventManager" as EM
Participant "EventManager.currentEvent: \nEvent" as CE
Participant "currentEvent.form: \nForm" as FM
Participant "rec: EventEventReciever" as EER

User -> EM: modifyDate(d)
Activate EM

EM -> CE: modifyDate(d)
Activate CE
CE -> FM: setDate(d)
Activate FM
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
