```plantuml
Actor  User
Participant "CatERingAppManager.EventManager" 
Participant "CatERingAppManager.UserManager"

User -> "CatERingAppManager.EventManager": getEvent()
Activate "CatERingAppManager.EventManager"

"CatERingAppManager.EventManager" -> "CatERingAppManager.UserManager": getCurrentUser()
Activate "CatERingAppManager.UserManager"

"CatERingAppManager.UserManager" --> "CatERingAppManager.EventManager": user
Deactivate "CatERingAppManager.UserManager"

alt [!user.isOrganizzatore()]
    "CatERingAppManager.EventManager" --> User: throw UseCaseLogicException
else
    "CatERingAppManager.EventManager" -> "CatERingAppManager.EventManager": selectEvent()
    "CatERingAppManager.EventManager" --> User: event
    Deactivate "CatERingAppManager.EventManager"
end



```
