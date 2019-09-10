```plantuml

Actor User
Participant "CatERingAppManager.EventManager:  \neventManager" as EM
Participant "CatERingAppManager.UserManager:  \nuserManager" as UM

User -> EM : createEvent()
Activate EM

EM -> UM: getCurrentUser()
Activate UM

UM --> EM: user
Deactivate UM

alt [!user.isOrganizzatore()]
    EM --> User : throw UseCaseLogicException
else
    create "e: Evento"
    EM -> "e: Evento": create(user)
    Activate "e: Evento"
    "e: Evento" -> "e: Evento": setOwner(user)
    "e: Evento" -> "e: Evento": setAnnullato(false)
    "e: Evento" -> "e: Evento": setPenale(false)
    create "Note:List<Notes>"
    "e: Evento" -> "Note:List<Notes>": create()
    "e: Evento" --> EM : e
    Deactivate "e: Evento"
    EM -> EM : setCurrentEvent(e)
    EM --> User: e
Deactivate EM
end








```
