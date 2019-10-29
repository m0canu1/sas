```plantuml

title: DSD per "Gestire eventi"
title: 1. createEvent
Actor User
Participant "CatERingAppManager.EventManager:  \neventManager" as EM
Participant "CatERingAppManager.UserManager:  \nuserManager" as UM
Participant "rec: EventEventReciever" as EER
User -> EM : createEvent()
Activate EM

EM -> UM: getCurrentUser()
Activate UM

title: 1. createEvent

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
        "e: Event" -> "e: Event": setPublished(false)
        create "staff: List<StaffMember>"
        "e: Event" -> "staff: List<StaffMember>": createStaffList()
        create "notes: List<String>"
        "e: Event" -> "notes: List<String>": createNotes()
    "e: Event" --> EM : e
    Deactivate "e: Event"
    EM -> EM : setCurrentEvent(e)
    loop for each r in receiver
        EM -> EER: notifyEventCreated(e)
        Activate EER
        Deactivate EER
    end
end
Deactivate EM








```
