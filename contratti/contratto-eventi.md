---
title: Contratti per Gestire Eventi
---

##Pre-condizione generale:

+ L'utente dev'essere registrato come una istanza org di Organizzatore

####1. creaEvento()
**Pre-condizione:** --

**Post-condizione:**

+ è stata creata un'istanza **e** di *Evento*
+ *org* **è proprietario** di **e** 


####1a. scegliEventoPreesistente()

**Pre-condizione:**

**Post-condizione:**

+ viene restituita una istanza **e** di un *Evento* preesistente
+ *org* **è proprietario** di **e**

####2. compilaScheda(evento: Evento, data: data, luogo:testo, numero-partecipanti?: numero)

**Pre-condizione:** 

+ è in corso la creazione di un *Evento* **e**
  
**Post-condizione:** 

+ è stata creata un'istanza **s** di *Scheda*
+ **s**.data = data
+ **s**.luogo = luogo
+ **s**.numero-partecipanti = numero-partecipanti
+ **e** contiene **s**

####2a. modificaScheda(scheda: Scheda, data?: data, luogo: testo, numero-partecipanti?: numero)

**Pre-condizione:** 

+ è in corso la creazione di un *Evento* **e**
  
**Post-condizione:** 

+ una istanza s di Scheda è modificata
+ [se presente] s.data = data
+ [se presente] s.luogo = luogo
+ [se presente] s.numero-partecipanti = numero-partecipanti

####3. assegnaChef(evento: Evento, chef: Chef)

**Pre-condizione:**

+ è in corso la creazione di un *Evento* **e**

**Post-condizione:**

+ è stata creata un'istanza ch di  *Chef*


####4. assegnaPersonale()

**Pre-condizione:**

+ è in corso la creazione di un *Evento* **e**

**Post-condizione:**

+ è stata creata una istanza **m** di *Membro_del_Personale*

####5. modificaPersonale(personale: Membro_del_Personale, evento: Evento)

**Pre-condizione:**

+ è in corso la creazione di un *Evento* **e**

**Post-condizione:**

+ la nuova istanza **m** di Membro_del_Personale è associata a **e**


####6. rimuoviEvento(evento: Evento, penale: si/no)

**Pre-condizione:**

+ è in corso la creazione di un *Evento* **e**

**Post-condizione:**

+ e.annullato = sì
+ e.penale = penale
+ la compilazione è interrotta

####7. spostaEvento(evento: Evento)

**Pre-condizione:**

+ è in corso la creazione di un *Evento* **e**

**Post-condizione:**

+ viene ricominciata la compilazione
+ e.annullato = sì
+ l'evento **e** è consultabile come evento preesistente


####8. scriviNote(evento: Evento, nota: testo)

**Pre-condizione:**

+ l'**evento** è terminato

**Post-condizione:**

+ **evento**.note = testo
+ e.annullato = no
+ e.penale = no


