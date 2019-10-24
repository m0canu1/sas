```plantuml

title: 4b. removeStaff

Actor User
Participant "CatERingAppManager.EventManager: \nEventManager" as EM
Participant "CatERingAppManager.StaffManager" as SM
Participant "e: Event" as E

User -> EM: removeStaff()
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
        
            SM -> "staff_list: list<StaffMember>": remove(staffmember)
            Activate "staff_list: list<StaffMember>"
            "staff_list: list<StaffMember>" -> SM: staff_list
            Deactivate "staff_list: list<StaffMember>"
        SM --> EM: staff_list
        Deactivate SM
    end    
end
Deactivate EM

```