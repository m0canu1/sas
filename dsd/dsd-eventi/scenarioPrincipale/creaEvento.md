```plantuml

Actor User
Participant "CatERingAppManager.EventManager:  \neventManager" 
Participant "CatERingAppManager.UserManager:  \nuserManager"

User -> "CatERingAppManager.EventManager:  \neventManager" : createEvent()
Activate "CatERingAppManager.EventManager:  \neventManager"

"CatERingAppManager.EventManager:  \neventManager" -> "CatERingAppManager.UserManager:  \nuserManager": getCurrentUser()
Activate "CatERingAppManager.UserManager:  \nuserManager"

"CatERingAppManager.UserManager:  \nuserManager" --> "CatERingAppManager.EventManager:  \neventManager": user
Deactivate "CatERingAppManager.UserManager:  \nuserManager"

alt [!user.isOrganizzatore()]
    "CatERingAppManager.EventManager:  \neventManager" --> User : throw UseCaseLogicException
else
    create "e: Evento"
    "CatERingAppManager.EventManager:  \neventManager" -> "e: Evento": create(user)
    Activate "e: Evento"
    "e: Evento" -> "e: Evento": setOwner(user)
    "e: Evento" -> "e: Evento": setAnnullato(false)
    "e: Evento" -> "e: Evento": setPenale(false)
    create "Note:List<Notes>"
    "e: Evento" -> "Note:List<Notes>": create()
    "e: Evento" --> "CatERingAppManager.EventManager:  \neventManager" : e
    Deactivate "e: Evento"
    "CatERingAppManager.EventManager:  \neventManager" -> "CatERingAppManager.EventManager:  \neventManager" : setCurrentEvent(e)
    "CatERingAppManager.EventManager:  \neventManager" --> User: e
end
Deactivate "CatERingAppManager.EventManager:  \neventManager"







```
