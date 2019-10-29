```plantuml

actor Cuoco
participant Sistema

alt 
Cuoco -> Sistema : 1. creaRicetta(titolo?)
	Sistema --> Cuoco : ricetta
else eccezione 1.1a
	Sistema --> Cuoco : errore titolo già presente
	destroy Sistema
end
note right: inizialmente una ricetta può essere creata senza titolo\nche può essere inserito successivamente.
 loop fino a soddisfacimento 
   		alt 
		Cuoco -> Sistema : 2. scriviPassoRicetta(ricetta, dettagli)
		Sistema --> Cuoco : passo registrato
    		else Estensione 2a
    			Cuoco -> Sistema: 2a.1 modificaDettagliPasso(passo, dettagli)
    			Sistema --> Cuoco: passo registrato 
    		else Estensione 2b
    			Cuoco -> Sistema: 2b.1 eliminaPasso(passo)
    			Sistema --> Cuoco: passo eliminato
    			destroy Sistema 
            else Estensione 2c
                Cuoco -> Sistema: 2c.1 selezionaPassiDaRaggruppare(lista_di_passi)
                Sistema --> Cuoco: passi raggruppati
            else Estensione 2d
                Cuoco -> Sistema : 2d.1 aggiungiVariante(passo_originale, dettagli_variante)
                Sistema --> Cuoco: nuovo passo Variante associato a passo_originale
            else Estensione 2e
                Cuoco -> Sistema : 2e.1 aggiungiRipetizione(passo_originale)
                Sistema --> Cuoco: ripetizione di passo_originale aggiunta
            end
    end
    
    loop
    	opt	
    			Cuoco -> Sistema : 3. segnaIndicazioni(ingredienti, dosi?)
    			Sistema --> Cuoco : indicazioni su ingredienti e opzionalmente dosi aggiunte
    			alt estensione 3a 
                    Cuoco -> Sistema : 3a.1 segnalaPreparazioneEsistente(preparazione)
    				Sistema --> Cuoco : preparazione registrata tra gli ingredienti della ricetta
    			else Estensione 3b
    				Cuoco -> Sistema : 3b.1 modificaDose(ingrediente, dose)
    				Sistema --> Cuoco: dose per l'ingrediente aggiornata
    			end
    	end
    	note right: Segnare note su ingredienti/dosi e segnalare una\npreparazione come base di una ricetta è opzionale\ne può essere ripetuto n volte.
    
    end
    Cuoco -> Sistema : 4. inserisciTagRicetta(tag)
    Sistema --> Cuoco : tag associato alla ricetta

alt Estensione (2-4)a
    Cuoco -> Sistema : (2-4)a.1 segnaAlternativa(ricetta_originale)
    Sistema --> Cuoco : ricetta corrente impostata come alternativa di ricetta_originale

else Estensione (2-4)b
		Cuoco -> Sistema : (2-4)b.1 inserisciTitolo(titolo)
		Sistema --> Cuoco: titolo salvato
	else Eccezione (2-4)b.1a
		Sistema -> Cuoco : errore titolo già esistente
		destroy Sistema
end

Cuoco -> Sistema : 5. pubblicaRicetta(ricetta)
Sistema --> Cuoco : ricetta pubblicata

alt Estensione (2-5)a
	Cuoco -> Sistema :(2-5)a.1 interrompiCompilazione(ricetta)
	Sistema --> Cuoco : modifiche salvate e interruzione
    destroy Sistema
end
note right: Si può interrompere la compilazione e salvare\nle modifiche in qualunque momento.



```
