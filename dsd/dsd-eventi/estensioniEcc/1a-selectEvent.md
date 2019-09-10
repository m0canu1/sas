```plantuml
Actor  User
Participant "CatERingAppManager.EventManager: \nEventManager"  as EM
Participant "CatERingAppManager.UserManager" as UM

User -> EM: getEvent()
Activate EM

EM -> UM: getCurrentUser()
Activate UM
    
UM --> EM: user
Deactivate UM

alt [!user.isOrganizzatore()]
    EM --> User: throw UseCaseLogicException
else
    EM -> EM: selectEvent()
    EM --> User: event
    Deactivate EM
end
```
