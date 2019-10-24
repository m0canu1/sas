```plantuml

title: (2-4)c. modifyNofParticipants

Actor User
Participant "CatERingAppManager.EventManager: \nEventManager" as EM
Participant "currentEvent.form: \nForm" as FM
Participant "rec: EventEventReciever" as EER

User -> EM: modifyNofParticipants(nof_part)
Activate EM

EM -> CE: modifyNofParticipants(nof_part)
Activate CE
CE -> FM: modifyNofParticipants(nof_part)
Activate FM
FM -> FM: setNofParticipants(nof_part)
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
