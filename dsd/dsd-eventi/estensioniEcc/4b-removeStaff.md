```plantuml

title: 4b. removeStaff

Actor User
Participant "CatERingAppManager.EventManager: \nEventManager" as EM
Participant "currentEvent.staff: \nList<StaffMember>" as SM
Participant "EventManager.currentEvent: \nEvent" as CE
Participant "rec: EventEventReceiver" as EER
Participant "rec: StaffMemberEventReceiver" as SER

User -> EM: removeStaff(staff_member)
Activate EM

EM -> CE: removeStaff(staff_member)
Activate CE
  CE -> SM: remove(staff_member)
  Activate SM
  Deactivate SM
Deactivate CE

loop for each r in receiver
    EM -> EER: notifyStaffMemberRemoved(event, staff_member)
    Activate EER
    Deactivate EER

    EM -> SER: notifyStaffMemberRemoved(event, staff_member)
    Activate SER
    Deactivate SER
end

Deactivate EM

```
