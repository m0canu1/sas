
```plantuml

actor Cuoco
participant Sistema

Cuoco -> Sistema : 1. creaRicetta(titolo?)
alt 
	Sistema --> Cuoco : ricetta con titolo	
else 
	Sistema --> Cuoco : ricetta senza titolo
else eccezione 1.1a
	Sistema --> Cuoco : titolo già presente
end
note right: inizialmente una ricetta può essere creata senza titolo\nche può essere inserito successivamente.
loop fino a soddisfacimento
    loop fino a soddisfacimento 
    	alt successo 
            Cuoco -> Sistema : 2. scriviPassoRicetta(ricetta)
    	    Sistema --> Cuoco : passo registrato
        else Estensione 2.a
            Cuoco -> Sistema: modificaPasso(ricetta)
            Sistema --> Cuoco: modifica registrata
        else Estensione 2.b
            Cuoco -> Sistema: eliminaPasso(ricetta)
            Sistema --> Cuoco: passo eliminato
        end
    end
    
    opt
    	loop
    		Cuoco -> Sistema : 3. scriviAlternativa(ricetta)
    	 	Sistema --> Cuoco : salva alternativa
    	end
    end
    note right: per alternativa si intende un'alternativa\nagli ingredienti/alle dosi.
    
    opt
    		
    		Cuoco -> Sistema : 4. segnaIndicazioni(ingredienti?, dosi?)
    		alt successo
    			Sistema --> Cuoco : nota registrata
    		else estensione 4a
    			loop
    				Cuoco -> Sistema : segnalaPreparazioneEsistente(preparazione)
    				Sistema --> Cuoco : preparazione registrata tra gli ingredienti della ricetta
    
    			end	
            else Estensione 4b
                Cuoco -> Sistema: modificaDosiIngredienti(dosi?, ingredienti?)
                Sistema --> Cuoco: modifiche registrate
            end
    
    	Sistema --> Cuoco : indicazioni salvate
    end
    note right: Segnare note su ingredienti/dosi e segnalare una\npreparazione come base di una ricetta è opzionale\ne può essere ripetuto n volte.
end
loop
	Cuoco -> Sistema : 5. dettagliaPasso(passo)
	Sistema --> Cuoco : salva dettagli
end

Cuoco -> Sistema : 6. classificaRicetta(ricetta)
Sistema --> Cuoco : salva la ricetta nella sezione corretta del ricettario

opt Estensione (2-6)a
		Cuoco -> Sistema : inserisciTitolo(ricetta)
	alt successo
		Sistema --> Cuoco : titolo salvato	
	else Eccezione (2-6)a
		Sistema -> Cuoco : titolo già esistente
	end
end
note right: dare un titolo alla ricetta non è obbligatorio\ne può essere dato in qualunque momento.

opt Estensione (2-6)b
	Cuoco -> Sistema : interrompiCompilazione(ricetta)
	Sistema --> Cuoco : modifiche salvate e interruzione
end
note right: Si può interrompere la compilazione e salvare\nle modifiche in qualunque momento.

Cuoco -> Sistema : 7. pubblicaRicetta(ricetta)
Sistema --> Cuoco : ricetta aggiunta al ricettario


```
