```plantuml
Actor User
Participant "CatERingAppManager.EventManager: \nEventManager" as EM 
Participant "CatERingAppManager.EventManager: \nevent" as E

opt
    User -> EM: writeNote(event)
    Activate EM  
    alt [currentEvent==null]
        EM --> User: throw UseCaseLogicException
    else
        EM -> E: writeNote(event)
        Activate E

        E -> E: setNote(text)
        
        E --> EM: event

    end
    Deactivate E

    EM --> User: event
    Deactivate EM
end

```
