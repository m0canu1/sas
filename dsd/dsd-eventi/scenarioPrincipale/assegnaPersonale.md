```plantuml
Actor User
Participant eM
Participant currentE
Participant sM

User -> eM: addStaff(event)
Activate eM
alt [currentevent!=null]
    eM --> User: throw UseCaseLogicException
else
    eM -> currentE: addStaff(event, "staff:List<StaffMember>")
    Activate currentE
    
    loop forever
        currentE -> sM: selectStaffMember(staffMember)
        Activate sM
        
        sM -> sM: checkAvailability()
        alt "staffmember.availability == true"
            sM -> sM: add(staffmember, "staff:List<StaffMember>")
        else
        
        end
        sM --> currentE: "staff:List<StaffMember>"
        Deactivate sM
    end
    currentE -> currentE: addStaff(event, "staff:List<StaffMember>")
    
    currentE --> eM: event
    eM --> User: event
end
Deactivate eM
Deactivate currentE



```
