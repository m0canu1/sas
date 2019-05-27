```plantuml
Actor User
Participant "CatERingAppManager.EventManager"
Participant "CatERingAppManager.EventManager: event"

opt
    User -> "CatERingAppManager.EventManager": removeEvento(event)
    alt [currentevent!=null]
        "CatERingAppManager.EventManager" --> User: throw UseCaseLogicException
    else
        "CatERingAppManager.EventManager" -> "CatERingAppManager.EventManager: event": removeEvento(event)
        Activate "CatERingAppManager.EventManager: event"

        "CatERingAppManager.EventManager: event" -> "CatERingAppManager.EventManager: event": setAnnullato(event, true)
        opt 
            "CatERingAppManager.EventManager: event" -> "CatERingAppManager.EventManager: event": setPenale(event, true)
        end
    end
    "CatERingAppManager.EventManager: event" --> "CatERingAppManager.EventManager": event
    Deactivate "CatERingAppManager.EventManager: event"

    "CatERingAppManager.EventManager" --> User: event
end


```

