```plantuml

title: 34a. modifyChef

Actor User
Participant "CatERingAppManager.EventManager: \nEventManager" as EM
Participant "CatERingAppManager.ChefManager" as SM
Participant "EventManager.currentEvent: \nEvent" as CE
Participant "currentEvent.form: \nForm" as F
Participant "rec: ChefEventReceiver" as CER
Participant "rec: EventEventReceiver" as EER

User -> EM: modifyChef(chef)
Activate EM
EM -> CE: assignChef(chef)
Activate CE
    CE -> F: getDate()
    Activate F
    F --> CE: date
    Deactivate F
    CE -> SM: checkChefAvailability(chef, date)
alt ["chef.isAvailable(date) == true"]
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
  EM -> CER: notifyChefAssigned(chef)
  Activate CER
  Deactivate CER
end
Deactivate EM
```
