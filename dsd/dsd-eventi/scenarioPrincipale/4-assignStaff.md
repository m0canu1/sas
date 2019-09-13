```plantuml
Actor User
Participant "CatERingAppManager.EventManager: \nEventManager" as EM
Participant "CatERingAppManager.StaffManager" as SM

User -> EM: addStaff()
Activate EM

alt [currentEvent==null]
    EM --> User: throw UseCaseLogicException
else
    Create "staff: list<StaffMember>"
    EM -> "staff: list<StaffMember>": createStaffList()
    Activate "staff: list<StaffMember>"
    "staff: list<StaffMember>" -> EM: staff_list
    
    loop ["fino a soddisfacimento"]
        EM -> SM: selectStaffMember(staff_list)
        Activate SM
        
        alt ["staffmember.isAvailable() == true"]
            SM -> "staff: list<StaffMember>": add(staffmember)
        else 
        end
        SM --> EM: staff_list
    end    
    Deactivate "staff: list<StaffMember>"
    Deactivate SM
end
Deactivate EM



```