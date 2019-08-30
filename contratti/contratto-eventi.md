---
title: Contratti per Gestire Eventi
---

## Pre-condizione generale:

+ L'utente dev'essere registrato come una istanza org di Organizzatore

#### 1. creaEvento()

**Pre-condizione:** 

+ Pre-condizione generale.

**Post-condizione:**

+ è stata creata un'istanza **e** di *Evento*
+ *org* **è proprietario** di **e** 


#### 1a. scegliEventoPreesistente()

**Pre-condizione:**

+ Pre-condizione generale.

**Post-condizione:**

+ viene restituita una istanza **e** di un *Evento* preesistente
+ *org* **è proprietario** di **e**

#### 1b. eliminaEvento(evento: e)

**Pre-condizione:**

+ L'evento e esiste

**Post-condizione:**

+ L'evento e è annullato

#### 2. compilaScheda(evento: Evento, data: data, luogo:testo, numero-partecipanti?: numero)

**Pre-condizione:** 

+ è in corso la creazione di un *Evento* **e**

**Post-condizione:** 

+ è stata creata un'istanza **s** di *Scheda*
+ **s**.data = data
+ **s**.luogo = luogo
+ **s**.numero-partecipanti = numero-partecipanti
+ **e** contiene **s**

#### 2a. modificaScheda(scheda: Scheda, data?: data, luogo: testo, numero-partecipanti?: numero)

**Pre-condizione:** 

+ è in corso la creazione di un *Evento* **e**

**Post-condizione:** 

+ una istanza s di Scheda è modificata
+ [se presente] s.data = data
+ [se presente] s.luogo = luogo
+ [se presente] s.numero-partecipanti = numero-partecipanti

#### 3. assegnaChef(evento: Evento, chef: Chef)

**Pre-condizione:**

+ è in corso la creazione di un *Evento* **e**

**Post-condizione:**

+ è stata creata un'istanza ch di  *Chef*

#### 3a. modificaChef(chef: Chef, chef_new: Chef)

**Pre-condizione:**

+ lo chef c esiste
+ è in corso la creazione di un *Evento* **e**

**Post-condizione:**

+ lo chef chef_new è associato all'evento

#### 4. assegnaPersonale()

**Pre-condizione:**

+ è in corso la creazione di un *Evento* **e**

**Post-condizione:**

+ è stata creata una istanza **m** di *Membro_del_Personale*
+ m è associato all'evento

#### 4a. aggiungiPersonale(membro: Membro_del_Personale)

**Pre-condizione:**

+ è in corso la creazione di un *Evento* **e**
+ esiste una istanza **m** di *Membro_del_Personale*

**Post-condizione:**

+ il membro del personale è aggiunto all'evento

#### 4b. eliminaPersonale(membro: Membro_del_Personale)

**Pre-condizione:**

+ è in corso la creazione di un *Evento* **e**
+ membro è parte del personale dell'evento

**Post-condizione:**

+ membro è eliminato dal personale dell'evento

#### 5. scriviNote(evento: Evento, nota: testo)

**Pre-condizione:**

+ l'**evento** è terminato

**Post-condizione:**

+ **evento**.note = testo

#### (2-5)a. eliminaEvento(evento: Evento, penale: si/no)

**Pre-condizione:**

+ è in corso la creazione di un *Evento* **e**

**Post-condizione:**

+ e.annullato = sì
+ e.penale = penale
+ la compilazione è interrotta



