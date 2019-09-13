```plantuml
Actor  User
Participant "CatERingAppManager.EventManager: \nEventManager"  as EM
Participant "CatERingAppManager.UserManager" as UM

opt
    User -> EM: selectEvent()
    Activate EM

    EM -> UM: getCurrentUser()
    Activate UM
        
    UM --> EM: user
    Deactivate UM

    EM -> "e: Event": getEvent()
    Activate "e: Event"
    "e: Event" -> EM: e

    alt [!user.isManager()]
        EM --> User: throw UseCaseLogicException
    else
        EM -> "e: Event": cancelEvent()
        "e: Event" -> "e: Event": setCancelled(true)
        opt 
            "e: Event" -> "e: Event": setFine(true)
        end
        Deactivate "e: Event"
    end
    Deactivate EM
end
```

