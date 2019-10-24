```plantuml

title: (2-4)a. modifyDate

Actor User
Participant "CatERingAppManager.EventManager: \nEventManager" as EM
Participant "currentEvent.form: \nForm" as FM
Participant "rec: EventEventReciever" as EER

User -> EM: modifyDate(d)
Activate EM

EM -> CE: modifyDate(d)
Activate CE
CE -> FM: modifyDate(d)
Activate FM
FM -> FM: setDate(d)
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
