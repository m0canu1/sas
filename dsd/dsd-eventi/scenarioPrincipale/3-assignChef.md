```plantuml

title: 3. assignChef

Actor User
Participant "CatERingAppManager.EventManager: \nEventManager" as EM
Participant "CatERingAppManager.StaffManager: \nStaffManager" as SM
Participant "EventManager.currentEvent: Event" as CE
Participant "rec: EventEventReceiver" as EER
Participant "manag_rec: StaffManagerEventReciever" as SMER

User -> EM: addChef(chef)
Activate EM
alt [currentEvent==null]
    EM --> User: throw UseCaseLogicException
else
    EM -> CE: assignChef(chef)
    Activate CE
    CE -> CE: setChef(chef)
    loop ["while chef.isAvailable() != true"]
        CE -> SM: selectChef()
        Activate SM
        SM --> CE: chef
        Deactivate SM
        CE -> CE: setChef(chef)
        Deactivate SM
    end
    CE -> EM: chef
    Deactivate CE
    loop for rec in receivers
      EM -> EER: notifyChefAssigned(chef)
      EM -> SM: notifyChefAssigned(chef)
      Activate EER
      Activate SMER
      Deactivate SMER
      Deactivaate EER
end
Deactivate EM

```
