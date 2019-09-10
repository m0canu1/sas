```plantuml
Actor User
Participant "CatERingAppManager.EventManager: \nEventManager" as EM
Participant "CatERingAppManager.EventManager: \nevent" as E
Participant "CatERingAppManager.StaffManager" as SM

User -> EM: addStaff(event)
Activate EM
alt [currentEvent==null]
    EM --> User: throw UseCaseLogicException
else
    EM -> E: addStaff(event, staff:List<StaffMember>)
    Activate E
    
    loop n volte
        E -> SM: selectStaffMember(staffMember)
        Activate SM
        
        SM -> SM: checkAvailability()
        alt staffmember.available() == true
            SM -> SM: add(staffmember, staff:List<StaffMember>)
        else
            
        end
        SM --> E: staff:List<StaffMember>
        Deactivate SM
    end
    E -> E: addStaff(event, staff:List<StaffMember>)
    
    E --> EM: event
    Deactivate E
    EM --> User: event
    Deactivate EM
end
Deactivate EM
Deactivate E



```
