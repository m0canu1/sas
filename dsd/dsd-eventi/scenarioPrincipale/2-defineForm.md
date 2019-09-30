```plantuml

title: 2. defineForm

Actor User
Participant "CatERingAppManager.EventManager:  \neventManager" as EM

User -> EM: createForm()
Activate EM
alt ["currentEvent == null"]
    EM --> User: throw UseCaseLogicException
else
    create "f: Form"
    EM -> "f: Form": Form()
    Activate "f: Form"

    "f: Form" -> "f: Form": setDate(Date)
    "f: Form" -> "f: Form": setLocation(String)
    "f: Form" -> "f: Form": setParticipants(Number)

    "f: Form" --> EM: f
    Deactivate "f: Form"
    EM -> EM: setForm(f)
end
Deactivate EM










```
