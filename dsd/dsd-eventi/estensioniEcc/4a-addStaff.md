```plantuml

title: 4a. addStaff

Actor User
Participant "CatERingAppManager.EventManager: \nEventManager" as EM
Participant "CatERingAppManager.StaffManager" as SM
Participant "e: Event" as E

User -> EM: addStaff()
Activate EM

alt [currentEvent==null]
    EM --> User: throw UseCaseLogicException
else
    EM -> E: getStaffList()
    Activate E
    E -> EM: staff_list
    Deactivate E
    
    loop ["fino a soddisfacimento"]
        EM -> SM: selectStaffMember(staff_list)
        Activate SM
        
        alt ["staffmember.isAvailable() == true"]
            SM -> "staff_list: list<StaffMember>": add(staffmember)
            Activate "staff_list: list<StaffMember>"
            "staff_list: list<StaffMember>" -> SM: staff_list
            Deactivate "staff_list: list<StaffMember>"
        else 
        end
        SM --> EM: staff_list
        Deactivate SM
    end    
end
Deactivate EM

```