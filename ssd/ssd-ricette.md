
```plantuml

actor Cuoco
participant Sistema

alt 
Cuoco -> Sistema : 1. creaRicetta(titolo?)
	Sistema --> Cuoco : ricetta
else eccezione 1.1a
Cuoco -> Sistema : 1. creaRicetta(titolo?)
	
	Sistema --> Cuoco : errore titolo già presente
	destroy Sistema
end
note right: inizialmente una ricetta può essere creata senza titolo\nche può essere inserito successivamente.
loop
	loop fino a soddisfacimento 
		alt 
		Cuoco -> Sistema : 2. scriviPassoRicetta(ricetta)
		Sistema --> Cuoco : passo registrato
		else Estensione 2a
			Cuoco -> Sistema: 2a.1 modificaPasso(passo)
			Sistema --> Cuoco: passo registrato 
		else Estensione 2b
			Cuoco -> Sistema: 2b.1 eliminaPasso(passo)
			Sistema --> Cuoco: passo
			destroy Sistema 
		end
		note right: Le estensioni del passo due possono\nessere delle alternative al passo.
	end

	opt
		loop
			Cuoco -> Sistema : 3. scriviAlternativa(ricetta)
			Sistema --> Cuoco : alternativa salvata
		end
	end
	note right: per alternativa si intende un'alternativa\nagli ingredienti/alle dosi.

	opt	
			Cuoco -> Sistema : 4. segnaIndicazioni(ingredienti?, dosi?)
			Sistema --> Cuoco : indicazioni salvate
			alt estensione 4a
				Cuoco -> Sistema : segnalaPreparazioneEsistente(preparazione)
				Sistema --> Cuoco : preparazione registrata tra gli ingredienti della ricetta
			else Estensione 4b
				Cuoco -> Sistema : modificaDose(ingrediente, ricetta)
				Sistema --> Cuoco: modifica salvata
			end
	end
	note right: Segnare note su ingredienti/dosi e segnalare una\npreparazione come base di una ricetta è opzionale\ne può essere ripetuto n volte.
end

loop
	Cuoco -> Sistema : 5. dettagliaPasso(passo)
	Sistema --> Cuoco : salva dettagli
end

Cuoco -> Sistema : 6. classificaRicetta(ricetta)
Sistema --> Cuoco : classificazione salvata

opt Estensione (2-6)a
		Cuoco -> Sistema : (2-6)a.1 inserisciTitolo(ricetta, titolo)
		Sistema --> Cuoco: titolo salvato
	else Eccezione (2-6)a.1a
		Sistema -> Cuoco : errore titolo già esistente
		destroy Sistema
end
note right: dare un titolo alla ricetta non è obbligatorio\ne può essere dato in qualunque momento.

opt Estensione (2-6)b
	Cuoco -> Sistema :(2-6)b.1 interrompiCompilazione(ricetta)
	Sistema --> Cuoco : modifiche salvate e interruzione
end
note right: Si può interrompere la compilazione e salvare\nle modifiche in qualunque momento.

Cuoco -> Sistema : 7. pubblicaRicetta(ricetta)
Sistema --> Cuoco : ricetta pubblicata


```
