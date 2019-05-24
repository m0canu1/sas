```plantuml
Actor User
Participant "CatERingAppManager.EventManager:  \neventManager"
Participant "EventManager.currentEvent:  \ne"


User -> "EventManager.currentEvent:  \ne": defineForm(event)

alt [currentEvent==null]
    "CatERingAppManager.EventManager:  \neventManager" --> User: throw UseCaseLogicException
else
    
    create "f: Form"
    "EventManager.currentEvent:  \ne" -> "f: Form": createForm(event)
    Activate "f: Form"

    "f: Form" -> "f: Form": setDate(date)
    "f: Form" -> "f: Form": setLuogo(String)
    "f: Form" -> "f: Form": setPartecipants(Int)

    "f: Form" --> "EventManager.currentEvent:  \ne": f 

    "EventManager.currentEvent:  \ne" --> "CatERingAppManager.EventManager:  \neventManager": setForm(f)
    "CatERingAppManager.EventManager:  \neventManager" --> User: e
end
    deactivate "f: Form"










```
