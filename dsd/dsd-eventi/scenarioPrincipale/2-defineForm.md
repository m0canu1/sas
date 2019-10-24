```plantuml

title: 2. defineForm

Actor User
Participant "CatERingAppManager.EventManager:  \neventManager" as EM

Participant "EventManager.currentEvent:  \nEvent" as CE
Participant "rec: EventEventReceiver" as EER

User -> EM: createForm(data, location, n_part)
Activate EM
alt ["currentEvent == null"]
    EM --> User: throw UseCaseLogicException
else
    EM -> CE: createForm(data, lcoation, n_part)
    Activate CE
    create "f: Form"
    CE -> "f: Form": create(data, location, n_part)
    Activate "f: Form"

    "f: Form" -> "f: Form": setDate(data)
    "f: Form" -> "f: Form": setLocation(location)
    "f: Form" -> "f: Form": setParticipants(n_part)
    CE --> EM: f
    Deactivate "f: Form"
    CE -> CE: setForm(f)
    
    loop for each rec in receiver
        Deactivate CE
        EM -> EER: notifyFormCreated(currentEvent, f)
        activate EER
        deactivate EER
    end
end
Deactivate EM










```
