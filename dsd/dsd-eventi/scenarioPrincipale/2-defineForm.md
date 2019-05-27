```plantuml
Actor User
Participant "CatERingAppManager.EventManager:  \neventManager"
Participant "EventManager.currentEvent:  \ne"


User -> "CatERingAppManager.EventManager:  \neventManager": defineForm(event)
Activate "CatERingAppManager.EventManager:  \neventManager"
alt [!currentEvent==null]
    "CatERingAppManager.EventManager:  \neventManager" --> User: throw UseCaseLogicException
else
"CatERingAppManager.EventManager:  \neventManager" -> "EventManager.currentEvent:  \ne": defineForm(event)
    Activate "EventManager.currentEvent:  \ne"   
    create "f: Form"
    "EventManager.currentEvent:  \ne" -> "f: Form": createForm(event)
    Activate "f: Form"

    "f: Form" -> "f: Form": setDate(date)
    "f: Form" -> "f: Form": setLuogo(String)
    "f: Form" -> "f: Form": setPartecipants(Int)

    "f: Form" --> "EventManager.currentEvent:  \ne": f
    Deactivate
     "EventManager.currentEvent:  \ne" ->  "EventManager.currentEvent:  \ne": setForm(f)

    "EventManager.currentEvent:  \ne" --> "CatERingAppManager.EventManager:  \neventManager": e
    Deactivate "EventManager.currentEvent:  \ne"   
    
    "CatERingAppManager.EventManager:  \neventManager" --> User: e
    Deactivate "CatERingAppManager.EventManager:  \neventManager"
end
    deactivate "f: Form"










```
