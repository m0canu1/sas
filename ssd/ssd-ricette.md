```plantuml

actor Cuoco
participant Sistema

alt 
Cuoco -> Sistema : 1. creaRicetta(titolo?)
	Sistema --> Cuoco : ricetta
else eccezione 1.1a
Cuoco -> Sistema : 1.1a.1 creaRicetta(titolo?)
	
	Sistema --> Cuoco : errore titolo già presente
	destroy Sistema
end
note right: inizialmente una ricetta può essere creata senza titolo\nche può essere inserito successivamente.
loop fino a soddisfacimento 
		alt 
		Cuoco -> Sistema : 2. scriviPassoRicetta(ricetta)
		Sistema --> Cuoco : passo registrato
		else Estensione 2a
			Cuoco -> Sistema: 2a.1 modificaDettagliPasso(passo)
			Sistema --> Cuoco: passo registrato 
		else Estensione 2b
			Cuoco -> Sistema: 2b.1 eliminaPasso(passo)
			Sistema --> Cuoco: passo eliminato
			destroy Sistema 
        else Estensione 2c
            Cuoco -> Sistema: 2c.1 selezionaPassiDaRaggruppare()
            Sistema --> Cuoco: passi raggruppati
        else Estensione 2d
            Cuoco -> Sistema : 2d.1 aggiungiVariante(passo)
            Sistema --> Cuoco: passo (variante) registrato
        else Estensione 2e
            Cuoco -> Sistema : 2e.1 aggiungiNRipetizioni(n_ripetizioni)
            Sistema --> Cuoco: numero varianti registrato
        end
		note right: Le estensioni del passo due possono\nessere delle alternative al passo.
end

loop
	opt	
			Cuoco -> Sistema : 3. segnaIndicazioni(ingredienti?, dosi?)
			Sistema --> Cuoco : indicazioni salvate
			alt estensione 3a
				Cuoco -> Sistema : 3a.1 segnalaPreparazioneEsistente(preparazione)
				Sistema --> Cuoco : preparazione registrata tra gli ingredienti della ricetta
			else Estensione 3b
				Cuoco -> Sistema : 3b.1 modificaDose(ingrediente, dose)
				Sistema --> Cuoco: modifica salvata
			end
	end
	note right: Segnare note su ingredienti/dosi e segnalare una\npreparazione come base di una ricetta è opzionale\ne può essere ripetuto n volte.

end
Cuoco -> Sistema : 4. classificaRicetta()
Sistema --> Cuoco : classificazione salvata

opt
    Cuoco -> Sistema : 5. segnaAlternativa(ricetta)
    Sistema --> Cuoco : registrazione salvata
end

opt Estensione (2-5)a
		Cuoco -> Sistema : (2-5)a.1 inserisciTitolo(titolo)
		Sistema --> Cuoco: titolo salvato
	else Eccezione (2-5)a.1a
		Sistema -> Cuoco : errore titolo già esistente
		destroy Sistema
end
note right: dare un titolo alla ricetta non è obbligatorio\ne può essere dato in qualunque momento.

opt Estensione (2-5)b
	Cuoco -> Sistema :(2-5)b.1 interrompiCompilazione(ricetta)
	Sistema --> Cuoco : modifiche salvate e interruzione
end
note right: Si può interrompere la compilazione e salvare\nle modifiche in qualunque momento.

Cuoco -> Sistema : 6. pubblicaRicetta(ricetta)
Sistema --> Cuoco : ricetta pubblicata


```
