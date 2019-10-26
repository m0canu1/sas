```plantuml

title: 4b. removeStaff

Actor User
Participant "CatERingAppManager.EventManager: \nEventManager" as EM
Participant "currentEvent.staff: \nList<StaffMember>" as SM
Participant "EventManager.currentEvent: \nEvent" as CE
Participant "rec: EventEventReceiver" as EER
User -> EM: removeStaff(staff_member)
Activate EM

EM -> CE: removeStaff(staff_member)
Activate CE
  CE -> SM: removeStaff(staff_member)
  Activate SM
  Deactivate SM
Deactivate CE

loop for each r in receiver
    EM -> EER: notifyStaffMemberRemoved(event)
    Activate EER
    Deactivate EER
end

Deactivate EM

```
