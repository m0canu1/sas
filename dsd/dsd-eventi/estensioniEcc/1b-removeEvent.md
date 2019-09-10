```plantuml
Actor User
Participant "CatERingAppManager.EventManager: \nEventManager" as EM 
Participant "CatERingAppManager.EventManager: \nevent" as E

User -> EM: removeEvent(event)
Activate EM
alt [currentEvent==null]
    EM --> User: throw UseCaseLogicException
else
    EM -> E: removeEvent(event)
    Activate E

    E -> E: setCancelled(event, true)
    opt 
        E -> E: setFine(event, true)
    end
end
E --> EM: event
Deactivate E

EM --> User: event
Deactivate EM


```

