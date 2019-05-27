```plantuml
Actor User
Participant "CatERingAppManager.EventManager"
Participant "CatERingAppManager.EventManager: event"
Participant "CatERingAppManager.StaffManager"

opt
    User -> "CatERingAppManager.EventManager": modifyStaff(event)
    Activate "CatERingAppManager.EventManager"
    
    alt currentevent!=null
        "CatERingAppManager.EventManager" --> User: UseCaseLogicException
    else
        "CatERingAppManager.EventManager" -> "CatERingAppManager.EventManager: event": modifyStaff(event)
        Activate "CatERingAppManager.EventManager: event"
        loop forever
            "CatERingAppManager.EventManager: event" -> "CatERingAppManager.StaffManager":  getStaff(event)
            Activate "CatERingAppManager.StaffManager"
    
            "CatERingAppManager.StaffManager" --> "CatERingAppManager.EventManager: event": "staff:List<staffMembers>"

            alt remove
                "CatERingAppManager.EventManager: event" -> "CatERingAppManager.StaffManager": remov"CatERingAppManager.EventManager"ember(staffmember, "staff:List<staffMembers>")
                Activate "CatERingAppManager.StaffManager"
                "CatERingAppManager.StaffManager" -> "CatERingAppManager.StaffManager": remove(staffmember, "staff:List<staffMembers>")
            else add
                "CatERingAppManager.EventManager: event" -> "CatERingAppManager.StaffManager": addMember(staffmember, "staff:List<staffMembers>")

                "CatERingAppManager.StaffManager" -> "CatERingAppManager.StaffManager": checkAvailability(staffMember)
                alt ["staffmember.availability==true"]
                    "CatERingAppManager.StaffManager" -> "CatERingAppManager.StaffManager": add(staffmember, "staff:List<staffMembers>")
                end
                "CatERingAppManager.StaffManager" --> "CatERingAppManager.EventManager: event": "staff:List<staffMembers>"
            end
            Deactivate "CatERingAppManager.StaffManager"
        end
    end
    Deactivate "CatERingAppManager.StaffManager"
    "CatERingAppManager.EventManager: event" --> "CatERingAppManager.EventManager": event
    "CatERingAppManager.EventManager" --> User: event
end
Deactivate "CatERingAppManager.EventManager: event"
Deactivate "CatERingAppManager.EventManager"


```
