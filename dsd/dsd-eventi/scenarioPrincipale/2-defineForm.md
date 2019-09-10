```plantuml
Actor User
Participant "CatERingAppManager.EventManager:  \neventManager" as EM
Participant "EventManager.currentEvent:  \ne" as CE


User -> EM: defineForm(event)
Activate EM
alt [currentEvent==null]
    EM --> User: throw UseCaseLogicException
else
EM -> CE: defineForm(event)
    Activate CE   
    create "f: Form"
    CE -> "f: Form": createForm(event)
    Activate "f: Form"

    "f: Form" -> "f: Form": setDate(date)
    "f: Form" -> "f: Form": setLuogo(String)
    "f: Form" -> "f: Form": setPartecipants(Int)

    "f: Form" --> CE: f
    Deactivate
     CE ->  CE: setForm(f)

    CE --> EM: e
    Deactivate CE   
    
    EM --> User: e
    Deactivate EM
end
    deactivate "f: Form"










```
