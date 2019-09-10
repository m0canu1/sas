```plantuml
Actor User
Participant "CatERingAppManager.EventManager: \nEventManager" as EM
Participant "CatERingAppManager.EventManager: \nevent" as E
Participant "CatERingAppManager.StaffManager" as SM

opt
    User -> EM: addStaffMember(event)
    Activate EM
    
    alt currentevent!=null
        EM --> User: UseCaseLogicException
    else
        EM -> E: addStaffMember(event)
        Activate E
        loop            
            E -> SM: addMember(staffmember, "staff:List<staffMembers>")
             Activate SM

            SM -> SM: checkAvailability(staffMember)
            alt ["staffmember.availability==true"]
                 SM -> SM: add(staffmember, "staff:List<staffMembers>")                
            end
            SM --> E: "staff:List<staffMembers>"
            Deactivate SM
        end


    end

    E --> EM: event
    Deactivate E
    EM --> User: event
    Deactivate EM
end




```
