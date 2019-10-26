```plantuml

title: 3. assignChef

Actor User
Participant "CatERingAppManager.EventManager: \nEventManager" as EM
Participant "CatERingAppManager.ChefManager: \nChefManager" as SM
Participant "EventManager.currentEvent: Event" as CE
Participant "currentEvent.form: \nForm" as F
Participant "rec: EventEventReceiver" as EER
Participant "rec: ChefManagerEventReciever" as SMER

User -> EM: addChef(chef)
Activate EM
alt [currentEvent==null]
    EM --> User: throw UseCaseLogicException
else
    EM -> CE: assignChef(chef)
    Activate CE
    CE -> F: getDate()
    Activate F
    F --> CE: date
    Deactivate F
    
    CE -> SM: checkChefAvailability(chef, date)
    Activate SM
    alt ["chef.isAvailable(date) == true"]
        SM --> CE: chef
        Deactivate SM
        CE -> CE: setChef(chef)
        CE --> EM: chef

    Deactivate CE
    loop for rec in receivers
      EM -> EER: notifyChefAssigned(chef)
      Activate EER
      Deactivate EER
      EM -> SMER: notifyChefAssigned(chef)
      Activate SMER
      Deactivate SMER
    end
    end
end
Deactivate EM

```
