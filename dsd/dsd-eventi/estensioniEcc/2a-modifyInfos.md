```plantuml
Actor User
Participant "CatERingAppManager.EventManager"
Participant "CatERingAppManager.EventManager: event"
Participant "CatERingAppManager.FormManager"

User -> "CatERingAppManager.EventManager": modifyInfo(event)
Activate "CatERingAppManager.EventManager"

alt [currentEvent==null]
    "CatERingAppManager.EventManager" --> User: throw UseCaseLogicException
else
    "CatERingAppManager.EventManager" -> "CatERingAppManager.EventManager: event": modifyInfo(event)
    Activate "CatERingAppManager.EventManager: event"
    
    "CatERingAppManager.EventManager: event" -> "CatERingAppManager.FormManager": modifyForm()
    Activate "CatERingAppManager.FormManager"
    opt
        "CatERingAppManager.FormManager" -> "CatERingAppManager.FormManager": setDate(date)
    end
    opt
        "CatERingAppManager.FormManager" -> "CatERingAppManager.FormManager": setLocation(String)
    end
    opt
        "CatERingAppManager.FormManager" -> "CatERingAppManager.FormManager": setNumberOfParticipants(Int) 
    end
    "CatERingAppManager.FormManager" --> "CatERingAppManager.EventManager: event": form
    Deactivate "CatERingAppManager.FormManager"
    
    "CatERingAppManager.EventManager: event" -> "CatERingAppManager.EventManager: event": setForm(form)

    "CatERingAppManager.EventManager: event" --> "CatERingAppManager.EventManager": event
    Deactivate "CatERingAppManager.EventManager: event"
end
"CatERingAppManager.EventManager" --> User: event
Deactivate "CatERingAppManager.EventManager"


```
