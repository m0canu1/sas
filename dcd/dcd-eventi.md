```plantuml

Class User {
    isManager(): boolean
}

Class UserManager {
    getCurrentUser(): User
}

Class Event {
    owner: Manager
    fine: boolean
    cancelled: boolean
    note: String
    form: Form
    
    setOwner(manager: Manager)
    setFine(fine: Boolean)
    setCancelled(cancelled: Boolean)
    setNote(note: String)
}

Class EventManager {

}

Class Form {
    data: Date
    place: String
    n_participants: Number
}


Class Chef {

}

Class StaffMember {

}

Class StaffManager {

}



User "1" -- "0.n" Event
Event "1" -- "0..n" EventManager
User -- "0..n" UserManager
Form "1" -- "1" Event
StaffMember -- "0..n" StaffManager
Chef -- "0..n" StaffManager
Chef "0..n" -- "1..n" Event
StaffMember "0..n" -- "1..n" Event



```
