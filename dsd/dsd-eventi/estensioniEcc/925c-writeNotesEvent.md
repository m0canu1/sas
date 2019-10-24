```plantuml

title: (2-5)b. writeNotesEvent

Actor  User
Participant "CatERingAppManager.EventManager: \nEventManager"  as EM
Participant "EventManager.currentEvent: \nEvent" as CE
Participant "rec: EventEventReciever" as EER
Participant "currentEvent.notes: \n List<String>" as NO

User -> EM: writeNotesEvent(nts)
Activate EM
EM -> CE: writeNotesEvent(nts)
Activate CE
      CE -> NO: add(nts)
      Activate NO
      Deactivate NO
Deactivate CE

loop for each r in receiver
    EM -> EER: notifyNewNotesEvent(event)
    Activate EER
    Deactivate EER
end
Deactivate EM

```
