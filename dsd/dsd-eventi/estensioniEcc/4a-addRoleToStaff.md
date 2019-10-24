```plantuml

title: 4a. addRoleToStaff

Actor User
Participant "CatERingAppManager.EventManager: \nEventManager" as EM
Participant "EventManager.currentEvent: \nEvent" as E
Participant "currentEvent.staff: \nList<StaffMember>" as SM
Participant "rec: EventEventReceiver" as EER
User -> EM: addRole(role, staff_member)
Activate EM
    EM -> E: addRoleToMember(role, staff_member)
    Activate E
       E -> SM: assignRoleStaffMember(role, staff_member)
       Activate SM
       Deactivate SM
       E --> EM: staff
    Deactivate E
    loop for each rec in receiver
       EM -> EER: notifyRoleAddedforEvent(event)
       Activate EER
       Deactivate EER
    end
Deactivate EM

```
