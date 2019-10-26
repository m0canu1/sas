```plantuml

title: 4. assignStaff

Actor User
Participant "CatERingAppManager.EventManager: \nEventManager" as EM
Participant "EventManager.currentEvent: \nEvent" as CE
Participant "currentEvent.staff: \nList<StaffMember>" as SL
Participant "CatERingAppManager.StaffManager: \nStaffManager" as SM
Participant "currentEvent.form: \nForm" as F

Participant "rec: EventEventReceiver" as EER
Participant "rec: StaffEventReceiver" as SER

User -> EM: addStaff(staff_member)
Activate EM

alt [currentEvent==null]
    EM --> User: throw UseCaseLogicException
else
    EM -> CE: addStaffToEvent(staff_member)
    Activate CE
        CE -> F: getDate()
        Activate F
        F --> CE: date
        Deactivate F
        CE -> SM: checkStaffMemberAvailability(staff_member)
        Activate SM
        alt ["staff_member.isAvailable() == true"]
            SM --> CE: staff_member
            Deactivate SM
            CE -> SL: add(staffmember)
            Activate SL
            Deactivate SL
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
    
end
Deactivate EM



```
