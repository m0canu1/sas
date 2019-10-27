```plantuml

title: 4a. removeRoleToStaff

Actor User
Participant "CatERingAppManager.EventManager: \nEventManager" as EM
Participant "EventManager.currentEvent: \nEvent" as E
Participant "currentEvent.staff: \nList<StaffMember>" as SM
Participant "rec: EventEventReceiver" as EER
Participant "rec: StaffMemberEventReceiver" as SER
User -> EM: removeRole (staff_member)
Activate EM
    EM -> E: removeRoleToMember(staff_member)
    Activate E
       E -> SM: get(staff_member)
       Activate SM
       alt staff_member in staff
       SM --> E: staff_member
       Deactivate SM
       create "staff_member: StaffMember"
       E -> "staff_member: StaffMember": removeRole(staff_member)
       E --> EM: staff
    Deactivate E
    loop for each rec in receiver
       EM -> EER: notifyRoleRemovedforEvent(event)
       Activate EER
       Deactivate EER

    EM -> SER: notifyRoleRemovedForEvent(event, staff_member)
    Activate SER
    Deactivate SER
    end
Deactivate EM

```
