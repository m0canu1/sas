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

## 2. scriviPassoRicetta(r: Ricetta)

**Pre-condizioni:** 	

+ è in corso la creazione di una ricetta r

**Post-condizioni:**

+ è stato aggiunto un passo p alla ricetta
+ r contiene p

## 3. scriviAlternativa(ricetta: Ricetta)

**Pre-condizioni:**

+ è in corso la creazione di una ricetta r

**Post-condizioni:**

+ è stata salvata una alternativa alla ricetta corrente

## 4. segnaIndicazioni(ingredienti?: testo, dosi?: numero)

**Pre-condizioni:**

+ è in corso la creazione di una ricetta r

**Post-condizioni:**

+ sono aggiunti gli ingredienti i e le dosi d
+ r.ingredienti = i
+ r.dosi = d

## 5. dettagliaPasso(passo: passo)

**Pre-condizioni:**

+ è in corso la creazione di una ricetta r

**Post-condizioni:**

+ sono stati aggiunti i dettagli ad alcuni passi p

## 6. classificaRicetta(ricetta: Ricetta, Nome: testo)

**Pre-condizioni:**

+ è in corso la creazione di una ricetta r

**Post-condizioni:**

+ La ricetta r è stata associata ad una classe class
+ class.nome = nome

## 7. pubblicaRicetta(ricetta: Ricetta)

**Pre-condizioni:**

+ è in corso la creazione di una ricetta r

**Post-condizioni:**
+ la ricetta è pubblicata nel ricettario
