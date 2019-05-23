
```plantuml

actor Cuoco
participant Sistema

Cuoco -> Sistema : creaRicetta(titolo?)
alt 
	Sistema --> Cuoco : ricetta con titolo	
else 
	Sistema --> Cuoco : ricetta senza titolo
else eccezione 1.1a
	Sistema --> Cuoco : titolo già presente
end

loop fino a soddisfacimento 
	Cuoco -> Sistema : scriviPassoRicetta(ricetta)
	Sistema --> Cuoco : passo registrato
end

opt
	loop
		Cuoco -> Sistema : scriviAlternativa(ricetta)
	 	Sistema --> Cuoco : salva alternativa

	end
end

opt
	loop fino a soddisfacimento
		
		Cuoco -> Sistema : segnaIndicazioni(ingredienti?, dosi?)
		alt successo
			Sistema --> Cuoco : nota registrata
		else estensione 4a
			loop
				Cuoco -> Sistema : segnalaPreparazioneEsistente(preparazione)
				Sistema --> Cuoco : preparazione registrata tra gli ingredienti della ricetta

			end	
		end

	Sistema --> Cuoco : indicazioni salvate
	end
end

opt
	
	Cuoco -> Sistema : modificaRicetta(ricetta)
	loop
		alt  estensione 5a
			Cuoco -> Sistema : aggiungiPasso(ricetta)
		else estensione 5b
			Cuoco -> Sistema : eliminaPasso(ricetta, passo)
		else estensione 5c
			Cuoco -> Sistema : modificaDosiIngredienti(dosi?, ingredienti?) 
		end
		Sistema --> Cuoco : modifica registrata
	end
end

opt Estensione (2-5)a
		Cuoco -> Sistema : inserisciTitolo(ricetta)
	alt successo
		Sistema --> Cuoco : titolo salvato	
	else Eccezione (2-5)a
		Sistema -> Cuoco : titolo già esistente
	end
end

loop
	Cuoco -> Sistema : dettagliaPasso(passo)
	Sistema --> Cuoco : salva dettagli
end

Cuoco -> Sistema : classificaRicetta(ricetta)
Sistema --> Cuoco : salva la ricetta nella sezione corretta del ricettario

opt Estensione (2-7)a
	Cuoco -> Sistema : interrompiCompilazione(ricetta)
	Sistema --> Cuoco : modifiche salvate e interruzione
end

Cuoco -> Sistema : pubblicaRicetta(ricetta)
Sistema --> Cuoco : ricetta aggiunta al ricettario


```
