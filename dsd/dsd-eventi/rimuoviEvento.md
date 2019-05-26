```plantuml
Actor User
Participant eM
Participant currentE

opt
    User -> eM: rimuoviEvento(event)
    alt [currentevent!=null]
        eM --> User: throw UseCaseLogicException
    else
        eM -> currentE: rimuoviEvento(event)
        Activate currentE

        currentE -> currentE: setAnnullato(event, true)
        opt 
            currentE -> currentE: setPenale(event, true)
        end
    end
    currentE --> eM: event
    Deactivate currentE

    eM --> User: event
end


```

