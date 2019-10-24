```plantuml
title 5. publishEvent()
Actor User
Participant "CatERingAppManager.EventManager:  \neventManager" as EM
Participant "EventManager.currentEvent: \nEvent" as CE
Participant "rec: EventEventReciever" as EER
User -> EM : publishEvent()
Activate EM


    EM -> CE: publish()
    activate CE
   
    CE -> CE: setPublished(true)
    deactivate CE    
   
    loop for each r in receiver
        EM -> EER: notifyEventPublished(currentEvent)
        Activate EER
        Deactivate EER
    end

Deactivate EM








```
