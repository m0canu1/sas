```plantuml
Actor User
Participant "CatERingAppManager.EventManager: \nEventManager" as EM
Participant "CatERingAppManager.StaffManager" as SM
Participant "e: Event" as E

User -> EM: addChef() 
Activate EM
alt [currentEvent==null]
    EM --> User: throw UseCaseLogicException
else
    loop ["while chef.isAvailable() != true"]
        EM -> SM: selectChef()
        Activate SM
        SM --> EM: chef
        Deactivate SM
    end
    EM -> E: setChef(chef)
    Activate E
    Deactivate E
end
Deactivate EM

```