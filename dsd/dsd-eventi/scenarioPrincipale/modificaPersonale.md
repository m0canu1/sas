```plantuml
Actor User
Participant eM
Participant currentE
Participant sM

opt
    User -> eM: modifyStaff(event)
    Activate eM
    
    alt currentevent!=null
        eM --> User: UseCaseLogicException
    else
        eM -> currentE: modifyStaff(event)
        Activate currentE
        loop forever
            currentE -> sM:  getStaff(event)
            Activate sM
    
            sM --> currentE: "staff:List<staffMembers>"

            alt remove
                currentE -> sM: removeMember(staffmember, "staff:List<staffMembers>")
                Activate sM
                sM -> sM: remove(staffmember, "staff:List<staffMembers>")
            else add
                currentE -> sM: addMember(staffmember, "staff:List<staffMembers>")

                sM -> sM: checkAvailability(staffMember)
                alt ["staffmember.availability==true"]
                    sM -> sM: add(staffmember, "staff:List<staffMembers>")
                end
                sM --> currentE: "staff:List<staffMembers>"
            end
            Deactivate sM
        end
    end
    Deactivate sM
    currentE --> eM: event
    eM --> User: event
end
Deactivate currentE
Deactivate eM


```
