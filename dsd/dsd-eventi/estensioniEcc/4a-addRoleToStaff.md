```plantuml

title: 4a. addRoleToStaff

Actor User
Participant "CatERingAppManager.EventManager: \nEventManager" as EM
Participant "EventManager.currentEvent: \nEvent" as E
Participant "currentEvent.staff: \nList<StaffMember>" as SM
Participant "rec: EventEventReceiver" as EER
Participant "rec: StaffMemberEventReceiver" as SER
User -> EM: addRole(role, staff_member)
Activate EM
    EM -> E: addRoleToMember(role, staff_member)
    Activate E
       E -> SM: get(staff_member)
       alt "staff_member in staff"
       Activate SM
       SM --> E: staff_member
       Deactivate SM
       create "staff_member: StaffMember"
       E -> "staff_member: StaffMember": assignRole(role)
       E --> EM: staff
    Deactivate E
    loop for each rec in receiver
       EM -> EER: notifyRoleAddedforEvent(event)
       Activate EER
       Deactivate EER

    EM -> SER: notifyRoleAddToMember(event, staff_member)
    Activate SER
    Deactivate SER
    end
    end
Deactivate EM

```
