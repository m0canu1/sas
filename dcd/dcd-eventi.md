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
    notes: List<String>
    form: Form
    chef: Chef
    staff: list<StaffMember>
    setChef(chef: Chef)
    setOwner(manager: Manager)
    setFine(fine: Boolean)
    setCancelled(cancelled: Boolean)
    createNotes()
    addNote(text: String)
}

Class EventManager {
    createEvent(owner: Manager)
    setCurrentEvent(e: Event)
    createForm()
    setForm(form: Form)
    addChef()
    addStaff()
    writeNote()
}


Class Form {
    date: Data
    location: String
    n_participants: Number
    Form()
    setDate(date: Data)
    setLocation(place: String)
    setParticipants(n_part: Number)
}


Class Chef {
    isAvailable(): boolean
}
    
Class StaffMember {
    isAvailable(): Boolean
}

Class StaffManager {
    selectChef(): Chef
    selectStaffMember(staff_list: list<StaffMember>): StaffMember
}



User "1" -- "0.n" Event
Event "1" -- "0..n" EventManager
User -- "0..n" UserManager
Form "1" -- "1" Event
StaffMember -- "0..n" StaffManager
Chef -- "0..n" StaffManager
Chef "1" -- "0..n" Event
StaffMember "0..n" -- "1..n" Event



```
