```plantuml
Actor User
Participant "CatERingAppManager.EventManager"
Participant "CatERingAppManager.EventManager: event"

opt
    User -> "CatERingAppManager.EventManager": moveEvent(event)

    alt [currentevent!=null]
        "CatERingAppManager.EventManager" --> User: throw UseCaseLogicException
    else
        "CatERingAppManager.EventManager" -> "CatERingAppManager.EventManager: event": moveEvent(event)
        Activate "CatERingAppManager.EventManager: event"
        
        "CatERingAppManager.EventManager: event" -> "CatERingAppManager.EventManager: event": checkAvailability(chef)
        "CatERingAppManager.EventManager: event" -> "CatERingAppManager.EventManager: event": checkAvailability("staff:List<staffMember>")

        alt [!movingIsPossible]
            "CatERingAppManager.EventManager: event" -> "CatERingAppManager.EventManager: event": setAnnullato(true)
        else
            "CatERingAppManager.EventManager: event" -> "CatERingAppManager.EventManager: event": setDate(date)
            "CatERingAppManager.EventManager: event" -> "CatERingAppManager.EventManager: event": setLocation(location)
        end
        "CatERingAppManager.EventManager: event" --> "CatERingAppManager.EventManager": event
    end
    Deactivate "CatERingAppManager.EventManager: event"

    "CatERingAppManager.EventManager" --> User: event
end


```
