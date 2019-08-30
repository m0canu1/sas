```plantuml
Actor User
Participant "CatERingAppManager.EventManager"
Participant "CatERingAppManager.EventManager: event"
Participant "CatERingAppManager.StaffManager"

opt
    User -> "CatERingAppManager.EventManager": addStaffMember(event)
    Activate "CatERingAppManager.EventManager"
    
    alt currentevent!=null
        "CatERingAppManager.EventManager" --> User: UseCaseLogicException
    else
        "CatERingAppManager.EventManager" -> "CatERingAppManager.EventManager: event": addStaffMember(event)
        Activate "CatERingAppManager.EventManager: event"
        loop            
            "CatERingAppManager.EventManager: event" -> "CatERingAppManager.StaffManager": addMember(staffmember, "staff:List<staffMembers>")
             Activate "CatERingAppManager.StaffManager"

            "CatERingAppManager.StaffManager" -> "CatERingAppManager.StaffManager": checkAvailability(staffMember)
            alt ["staffmember.availability==true"]
                 "CatERingAppManager.StaffManager" -> "CatERingAppManager.StaffManager": add(staffmember, "staff:List<staffMembers>")                
            end
            "CatERingAppManager.StaffManager" --> "CatERingAppManager.EventManager: event": "staff:List<staffMembers>"
            Deactivate "CatERingAppManager.StaffManager"
        end


    end

    "CatERingAppManager.EventManager: event" --> "CatERingAppManager.EventManager": event
    Deactivate "CatERingAppManager.EventManager: event"
    "CatERingAppManager.EventManager" --> User: event
    Deactivate "CatERingAppManager.EventManager"
end




```
