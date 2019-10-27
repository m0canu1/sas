```plantuml

title: (2-4)c. modifyNofParticipants

Actor User
Participant "CatERingAppManager.EventManager: \nEventManager" as EM
Participant "EventManager.currentEvent: \nEvent" as CE
Participant "currentEvent.form: \nForm" as FM
Participant "rec: EventEventReciever" as EER

User -> EM: modifyNParticipants(nof_part)
Activate EM

EM -> CE: modifyNParticipants(nof_part)
Activate CE
CE -> FM: setParticipants(nof_part)
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
