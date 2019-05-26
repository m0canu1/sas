```plantuml
Actor User
Participant eM
Participant currentE
Participant chM

User -> eM: addChef(event) 
Activate eM
alt [currentevent!=null]
    eM --> User: throw UseCaseLogicException
else
    eM -> currentE: addChef(event)
    Activate currentE
    loop ["until chef.available == true"]
        currentE -> chM: selectChef(chef)
        Activate chM

        chM --> currentE: c
        Deactivate chM
    end
    currentE -> currentE: setChef(c)

    currentE --> eM: event
    eM --> User: event
end
Deactivate eM
Deactivate currentE
```
