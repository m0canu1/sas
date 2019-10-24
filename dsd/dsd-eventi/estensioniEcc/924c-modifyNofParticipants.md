```plantuml

title: 2a. modifyInfos

Actor User
Participant "CatERingAppManager.EventManager: \nEventManager" as EM
Participant "f: Form" as FM

User -> EM: modifyInfo()
Activate EM

alt [currentEvent==null]
    EM --> User: throw UseCaseLogicException
else
    EM -> FM: modifyForm()
    Activate FM
    opt
        FM -> FM: setDate(Date)
    end
    opt
        FM -> FM: setLocation(String)
    end
    opt
        FM -> FM: setParticipants(Number) 
    end
    FM --> EM: form
    Deactivate FM
    EM -> EM: setForm(form)
end
Deactivate EM


```