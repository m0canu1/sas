```plantuml
Actor User
Participant "CatERingAppManager.EventManager"
Participant "CatERingAppManager.EventManager: event"
Participant "CatERingAppManager.ChefManager"

User -> "CatERingAppManager.EventManager": addChef(event) 
Activate "CatERingAppManager.EventManager"
alt [currentevent!=null]
    "CatERingAppManager.EventManager" --> User: throw UseCaseLogicException
else
    "CatERingAppManager.EventManager" -> "CatERingAppManager.EventManager: event": addChef(event)
    Activate "CatERingAppManager.EventManager: event"
    loop ["until chef.available == true"]
        "CatERingAppManager.EventManager: event" -> "CatERingAppManager.ChefManager": selectChef(chef)
        Activate "CatERingAppManager.ChefManager"

        "CatERingAppManager.ChefManager" --> "CatERingAppManager.EventManager: event": c
        Deactivate "CatERingAppManager.ChefManager"
    end
    "CatERingAppManager.EventManager: event" -> "CatERingAppManager.EventManager: event": setChef(c)

    "CatERingAppManager.EventManager: event" --> "CatERingAppManager.EventManager": event
    "CatERingAppManager.EventManager" --> User: event
end
Deactivate "CatERingAppManager.EventManager"
Deactivate "CatERingAppManager.EventManager: event"
```
