```plantuml
Actor  User
Participant eM 
Participant uM

User -> eM: getEvent()
Activate eM

eM -> uM: getCurrentUser()
Activate uM

uM --> eM: user
Deactivate uM

alt [!user.isOrganizzatore()]
    eM --> User: throw UseCaseLogicException
else
    eM -> eM: selectEvent()
    eM --> User: event
    Deactivate eM
end



```
