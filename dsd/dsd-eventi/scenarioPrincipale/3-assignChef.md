```plantuml
Actor User
Participant "CatERingAppManager.EventManager: \nEventManager" as EM
Participant "CatERingAppManager.EventManager: \nevent" as E
Participant "CatERingAppManager.ChefManager" as CM

User -> EM: addChef(event) 
Activate EM
alt [currentEvent==null]
    EM --> User: throw UseCaseLogicException
else
    EM -> E: addChef(event)
    Activate E
    loop ["while chef.available != true"]
        E -> CM: selectChef(chef)
        Activate CM

        CM --> E: c
        Deactivate CM
    end
    E -> E: setChef(c)

    E --> EM: event
    Deactivate E
    EM --> User: event
end
Deactivate EM

```
