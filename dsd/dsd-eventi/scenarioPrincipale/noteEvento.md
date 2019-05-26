```plantuml
Actor User
Participant eM
Participant currentE

opt
    User -> eM: writeNote(event)
    
    alt [currentevent!=null]
        eM --> User: throw UseCaseLogicException
    else
        eM -> currentE: writeNote(event)
        Activate currentE

        currentE -> currentE: setNote(text)
        
        currentE --> eM: event

    end
    Deactivate currentE

    eM --> User: event

end

```
