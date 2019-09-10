```plantuml
Actor User
Participant "CatERingAppManager.EventManager: \nEventManager" as EM 
Participant "CatERingAppManager.EventManager: \nevent" as E
Participant "CatERingAppManager.StaffManager" as SM

opt
    User -> "CatERingAppManager.EventManager": removeStaffMember(event)
    Activate "CatERingAppManager.EventManager"
    
    alt currentevent!=null
        EM--> User: UseCaseLogicException
    else
        EM-> E: removeStaffMember(event)
        Activate E
        loop            
            E -> SM: removeMember(staffmember, "staff:List<staffMembers>")
             Activate SM

            SM --> E: "staff:List<staffMembers>"
        Deactivate SM
       end
       
        
    end
    Deactivate SM
    E --> "CatERingAppManager.EventManager": event
    Deactivate E
    EM--> User: event
    Deactivate "CatERingAppManager.EventManager"
end




```
