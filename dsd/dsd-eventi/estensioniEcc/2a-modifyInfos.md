```plantuml
Actor User
Participant "CatERingAppManager.EventManager: \nEventManager" as EM
Participant "CatERingAppManager.EventManager: \nevent" as E
Participant "CatERingAppManager.FormManager" as FM

User -> EM: modifyInfo(event)
Activate EM

alt [currentEvent==null]
    EM --> User: throw UseCaseLogicException
else
    EM -> E: modifyInfo(event)
    Activate E
    
    E -> FM: modifyForm()
    Activate FM
    opt
        FM -> FM: setDate(date)
    end
    opt
        FM -> FM: setLocation(String)
    end
    opt
        FM -> FM: setNumberOfParticipants(Int) 
    end
    FM --> E: form
    Deactivate FM
    
    E -> E: setForm(form)

    E --> EM: event
    Deactivate E
end
EM --> User: event
Deactivate EM


```
