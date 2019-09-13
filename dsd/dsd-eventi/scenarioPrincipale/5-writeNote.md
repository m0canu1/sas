```plantuml
Actor User
Participant "CatERingAppManager.EventManager: \nEventManager" as EM 

opt
    User -> EM: writeNote()
    Activate EM  
    alt [currentEvent==null]
        EM --> User: throw UseCaseLogicException
    else
    loop ["fino a soddisfacimento"]
        EM -> "Notes: list<String>": addNote(note)
        Activate "Notes: list<String>"
        Deactivate "Notes: list<String>"        
    end
    end
    Deactivate EM
end

```
