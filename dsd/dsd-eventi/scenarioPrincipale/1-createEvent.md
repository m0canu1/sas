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

alt [!user.isManager()]
    EM --> User : throw UseCaseLogicException
else
    create "e: Event"
    EM -> "e: Event": createEvent(user)
    Activate "e: Event"
        "e: Event" -> "e: Event": setOwner(user)
        "e: Event" -> "e: Event": setCancelled(false)
        "e: Event" -> "e: Event": setFine(false)
        create "Notes: list<String>"
        "e: Event" -> "Notes: list<String>": createNotes()
    "e: Event" --> EM : e
    Deactivate "e: Event"
    EM -> EM : setCurrentEvent(e)
end
Deactivate EM








```
