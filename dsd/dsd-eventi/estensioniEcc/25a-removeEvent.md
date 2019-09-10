```plantuml
Actor User
Participant "CatERingAppManager.EventManager: \nEventManager" as EM
Participant "CatERingAppManager.EventManager: \ncurrentEvent" as CE


opt
    User -> EM: removeEvent(event)
    Activate EM
    
    alt ["currentEvent == null"]
        EM --> User: throw UseCaseLogicExeception
    else
        EM -> CE: removeEvent()
        Deactivate EM
        Activate CE
    end
     Deactivate CE
end

```
