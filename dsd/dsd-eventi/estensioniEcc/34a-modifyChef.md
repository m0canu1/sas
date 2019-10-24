```plantuml

title: 4a. addStaff

Actor User
Participant "CatERingAppManager.EventManager: \nEventManager" as EM
Participant "CatERingAppManager.StaffManager" as SM
Participant "EventManager.currentEvent: \nEvent" as CE

User -> EM: modifyChef(chef)
Activate EM
EM -> CE: assignChef(chef)
Activate CE
EM -> CE: assignChef(chef)
Activate CE
CE -> CE: setChef(chef)
loop ["while chef.isAvailable() != true"]
    CE -> SM: selectChef()
    Activate SM
    SM --> CE: chef
    Deactivate SM
    CE -> CE: setChef(chef)
end
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
```
