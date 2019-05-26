```plantuml
Actor User
Participant eM
Participant currentE

opt
    User -> eM: moveEvent(event)

    alt [currentevent!=null]
        eM --> User: throw UseCaseLogicException
    else
        eM -> currentE: moveEvent(event)
        Activate currentE
        
        currentE -> currentE: checkAvailability(event, chef)
        currentE -> currentE: checkAvailability(event, "staff:List<staffMember>")

        alt [!movingIsPossible]
            currentE -> currentE: setAnnullato(event, true)
        else
            currentE -> currentE: setDate(event, date)
            currentE -> currentE: setLocation(event, location)
        end
        currentE --> eM: event
    end
    Deactivate currentE

    eM --> User: event
end


```
