```plantuml
Actor User
Participant eM
Participant currentE
Participant fM

User -> eM: modifyInfo(event)
Activate eM

alt [currentevent!=null]
    eM --> User: throw UseCaseLogicException
else
    eM -> currentE: modifyInfo(event)
    Activate currentE
    
    currentE -> fM: getForm()
    Activate fM
    opt
        fM -> fM: setDate(date)
    end
    opt
        fM -> fM: setLocation(String)
    end
    opt
        fM -> fM: setNumberOfParticipants(Int) 
    end
    fM --> currentE: form
    Deactivate fM
    
    currentE -> currentE: setForm(form)

    currentE --> eM: event
    Deactivate currentE
end
eM --> User: event
Deactivate eM


```
