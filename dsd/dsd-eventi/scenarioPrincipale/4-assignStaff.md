```plantuml

title: 4. assignStaff

Actor User
Participant "CatERingAppManager.EventManager: \nEventManager" as EM
Participant "EventManager.currentEvent: \nEvent" as CE
Participant "CatERingAppManager.StaffManager: \nStaffManager" as SM
Participant "currentEvent.staff: \nList<StaffMember>" as SL

Participant "rec: EventEventReceiver" as EER
Participant "rec: StaffEventReceiver" as SER

User -> EM: addStaff()
Activate EM

alt [currentEvent==null]
    EM --> User: throw UseCaseLogicException
else
    EM -> CE: addStaffToEvent()
    Activate CE
        CE -> SM: selectStaffMember()
        Activate SM
        SM --> CE: staff_member
        Deactivate SM
        alt ["staff_member.isAvailable() == true"]
            CE -> SL: add(staffmember)
            Activate SL
            Deactivate SL
        else
        end
        CE --> EM: staff_member
    Deactivate CE

    loop for each rec in receiver
        EM -> EER: notifyEventStaffUpdated(currentEvent, staff_member)
        Activate EER
        Deactivate EER
        EM -> SER: notifyStaffAssigned(staff_member)
        Activate SER
        Deactivate SER
    end
    
end
Deactivate EM



```
