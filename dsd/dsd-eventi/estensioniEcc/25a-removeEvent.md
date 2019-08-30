```plantuml
Actor User
Participant "CatERingAppManager.EventManager"
Participant "CatERingAppManager.EventManager: \ncurrentEvent"


opt
    User -> "CatERingAppManager.EventManager": removeEvent(event)
    Activate "CatERingAppManager.EventManager"
    
    alt ["currentEvent == null"]
        "CatERingAppManager.EventManager" --> User: throw UseCaseLogicExeception
    else
        "CatERingAppManager.EventManager" -> "CatERingAppManager.EventManager: \ncurrentEvent": removeEvent()
        Deactivate "CatERingAppManager.EventManager"
        Activate "CatERingAppManager.EventManager: \ncurrentEvent"
    end
     Deactivate "CatERingAppManager.EventManager: \ncurrentEvent"
end

```
