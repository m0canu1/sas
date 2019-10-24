```plantuml

title: (2-5)b. cancelEvent

Actor  User
Participant "CatERingAppManager.EventManager: \nEventManager"  as EM
Participant "EventManager.currentEvent: \nEvent" as CE
Participant "rec: EventEventReciever" as EER

User -> EM: cancelEvent(event)
Activate EM
EM -> CE: cancelEvent(event)
Activate CE
      CE -> CE: setCancelled(true)
      opt
        CE -> CE: setFine(true)
      end
Deactivate CE

loop for each r in receiver
    EM -> EER: notifyEventDestroyed(event)
    Activate EER
    Deactivate EER
end
Deactivate EM

```
