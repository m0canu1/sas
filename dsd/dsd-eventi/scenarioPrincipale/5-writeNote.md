```plantuml
Actor User
Participant "CatERingAppManager.EventManager"
Participant "CatERingAppManager.EventManager: event"

opt
    User -> "CatERingAppManager.EventManager": writeNote(event)
    Activate "CatERingAppManager.EventManager"  
    alt [currentEvent==null]
        "CatERingAppManager.EventManager" --> User: throw UseCaseLogicException
    else
        "CatERingAppManager.EventManager" -> "CatERingAppManager.EventManager: event": writeNote(event)
        Activate "CatERingAppManager.EventManager: event"

        "CatERingAppManager.EventManager: event" -> "CatERingAppManager.EventManager: event": setNote(text)
        
        "CatERingAppManager.EventManager: event" --> "CatERingAppManager.EventManager": event

    end
    Deactivate "CatERingAppManager.EventManager: event"

    "CatERingAppManager.EventManager" --> User: event
    Deactivate "CatERingAppManager.EventManager"
end

```
