---
title:
- Contratti per "gestire ricette"
---

##Pre-condizione generale
+ L'utente deve essere registrato con una istanza c di cuoco o chef

## 1. creaRicetta(titolo?: testo)
**Pre-condizioni:**

**Post-condizioni:**

+ è stata creata una istanza r di ricetta
+ [se è specificato un titolo] r.titolo = titolo
+ c è proprietario di r
+ r.pubblicata = no
+ r.alternativa = no

## 2. scriviPassoRicetta()

**Pre-condizioni:** 	

+ è in corso la creazione di una ricetta r

**Post-condizioni:**

+ è stato aggiunto un passo p alla ricetta
+ r contiene p

## 2a. modificaPasso(passo: Passo)

**Pre-condizioni:**

+ è in corso la creazione di una ricetta r
+ il passo p esiste

**Post-condizioni:**

+ un passo p della ricetta è stato modificato
+ r contiene p

## 2b. eliminaPasso(passo: Passo)

**Pre-condizioni:**

+ è in corso la creazione di una ricetta r
+ il passo p esiste

**Post-condizioni:**

+ un passo p è rimosso dalla lista di passi della ricetta

## 2c. selezionaPassiDaRaggruppare() // TODO: una lista di passi

**Pre-condizioni:**

+ è in corso la creazione di una ricetta r

**Post-condizioni:**

+ i passi p selezionati della ricetta r sono stati raggruppati in p1
+ r contiene p1

## 2d. aggiungiVariante(passo: Passo)

**Pre-condizioni:**

+ è in corso la creazione di una ricetta r

**Post-condizioni:**

+ un passo p1 variante del passo p è stato aggiunto alla ricetta r

## 3. segnaIndicazioni(ingredienti?: testo, dosi?: numero)

**Pre-condizioni:**

+ è in corso la creazione di una ricetta r

**Post-condizioni:**

+ sono aggiunti gli ingredienti i e le dosi d
+ r.ingredienti = i
+ r.dosi = d

## 3a. segnalaPreparazioneEsistente(preparazione: Preparazione)

**Pre-condizioni:**

+ è in corso la creazione di una ricetta r

**Post-condizioni:**

+ la preparazione p è aggiunta agli ingredienti della ricetta r
+ r.ingredienti = p

## 3b. modificaDose(ingrediente: testo, dose: numero)

**Pre-condizioni:**

+ è in corso la creazione di una ricetta r

**Post-condizioni:**

+ r.dose = d

## 4. dettagliaPasso(passo: Passo)

**Pre-condizioni:**

+ è in corso la creazione di una ricetta r

**Post-condizioni:**

+ sono stati aggiunti i dettagli al passo p

## 5. classificaRicetta(nome: testo)

**Pre-condizioni:**

+ è in corso la creazione di una ricetta r

**Post-condizioni:**

+ La ricetta r è stata associata ad una classe class
+ class.nome = nome

## 6. segnaAlternativa(ricetta: Ricetta)

**Pre-condizioni:**

+ è in corso la creazione di una ricetta r

**Post-condizioni:**

+ La ricetta r è stata segnalata come alternativa della Ricetta ricetta
+ r.originale = ricetta

## (2-6)a. inserisciTitolo(titolo: testo)

**Pre-condizioni:**

+ è in corso la creazione di una ricetta r

**Post-condizioni:**

+ r.titolo = titolo

## (2-6)b. interrompiCompilazione()

**Pre-condizioni:**

+ è in corso la creazione di una ricetta r

**Post-condizioni:**

+ la ricetta r viene salvata
+ la compilazione è interrotta
+ r.pubblicato = no

## 7. pubblicaRicetta(ricetta: Ricetta)

**Pre-condizioni:**

+ è in corso la creazione di una ricetta r

**Post-condizioni:**

+ r.pubblicato = si


