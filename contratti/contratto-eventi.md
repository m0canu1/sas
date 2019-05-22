---
title: Contratti per Gestire Eventi
---

##Pre-condizione generale:
+ L'utente dev'essere registrato come Organizzatore

####1. creaEvento()
**Pre-condizione:** --
**Post-condizione:**
+ è stata creata un'istanza **e** di *Evento*
+ *org* **è proprietario** di **e** 
+ **e**.pubblicato = no

####2. compilaScheda(evento: Evento, data: testo, luogo:testo, numero-partecipanti?: numero)
**Pre-condizione:** 
+ è in corso la creazione di un *Evento* **e**
  
**Post-condizione:** 
+ è stata creata un'istanza **s** di *Scheda*
+ **s**.data = data
+ **s**.luogo = luogo
+ **s**.numero-partecipanti = numero-partecipanti
+ **e** contiene **s**

####3. assegnaChef(evento: Evento, chef: Chef)
**Pre-condizione:**
+ è in corso la creazione di un *Evento* **e**

**Post-condizione:**
+ è stata creata un'istanza di  *Chef*


####4. assegnaPersonale()
**Pre-condizione:**


**Post-condizione:**



####5. scriviNote(evento: Evento, nota: testo)
**Pre-condizione:**
+ l'**evento** è terminato

**Post-condizione:**
+ **evento**.note = testo