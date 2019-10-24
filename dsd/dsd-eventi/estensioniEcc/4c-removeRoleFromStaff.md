```plantuml

title: 4a. removeRoleToStaff

Actor User
Participant "CatERingAppManager.EventManager: \nEventManager" as EM
Participant "EventManager.currentEvent: \nEvent" as E
Participant "currentEvent.staff: \nList<StaffMember>" as SM
Participant "rec: EventEventReceiver" as EER
User -> EM: removeRole (staff_member)
Activate EM
    EM -> E: removeRoleToMember(staff_member)
    Activate E
       E -> SM: removeRoleStaffMember(staff_member)
       Activate SM
       Deactivate SM
       E --> EM: staff
    Deactivate E
    loop for each rec in receiver
       EM -> EER: notifyRoleRemovedforEvent(event)
       Activate EER
       Deactivate EER
    end
Deactivate EM

```
