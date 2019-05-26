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
        
        currentE -> currentE: checkAvailability(chef)
        currentE -> currentE: checkAvailability("staff:List<staffMember>")

        alt [!movingIsPossible]
            currentE -> currentE: setAnnullato(true)
        else
            currentE -> currentE: setDate(date)
            currentE -> currentE: setLocation(location)
        end
        currentE --> eM: event
    end
    Deactivate currentE

    eM --> User: event
end


```
