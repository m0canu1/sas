```plantuml
Actor User
Participant "CatERingAppManager.EventManager"
Participant "CatERingAppManager.EventManager: event"
Participant "CatERingAppManager.StaffManager"

User -> "CatERingAppManager.EventManager": addStaff(event)
Activate "CatERingAppManager.EventManager"
alt [currentEvent==null]
    "CatERingAppManager.EventManager" --> User: throw UseCaseLogicException
else
    "CatERingAppManager.EventManager" -> "CatERingAppManager.EventManager: event": addStaff(event, staff:List<StaffMember>)
    Activate "CatERingAppManager.EventManager: event"
    
    loop n volte
        "CatERingAppManager.EventManager: event" -> "CatERingAppManager.StaffManager": selectStaffMember(staffMember)
        Activate "CatERingAppManager.StaffManager"
        
        "CatERingAppManager.StaffManager" -> "CatERingAppManager.StaffManager": checkAvailability()
        alt staffmember.available() == true
            "CatERingAppManager.StaffManager" -> "CatERingAppManager.StaffManager": add(staffmember, staff:List<StaffMember>)
        else
            
        end
        "CatERingAppManager.StaffManager" --> "CatERingAppManager.EventManager: event": staff:List<StaffMember>
        Deactivate "CatERingAppManager.StaffManager"
    end
    "CatERingAppManager.EventManager: event" -> "CatERingAppManager.EventManager: event": addStaff(event, staff:List<StaffMember>)
    
    "CatERingAppManager.EventManager: event" --> "CatERingAppManager.EventManager": event
    Deactivate "CatERingAppManager.EventManager: event"
    "CatERingAppManager.EventManager" --> User: event
    Deactivate "CatERingAppManager.EventManager"
end
Deactivate "CatERingAppManager.EventManager"
Deactivate "CatERingAppManager.EventManager: event"



```
