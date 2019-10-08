```plantuml
actor Organizzatore
participant Sistema

alt
	Organizzatore -> Sistema : 1. creaEvento()
	Sistema --> Organizzatore : evento 
	alt
		else Estensione 1a
			Organizzatore -> Sistema : 1a.1. scegliEvento(evento)
			Sistema --> Organizzatore : evento
		else Eccezione 1a.1a
			'Organizzatore -> Sistema : 1a.1a scegliEvento(evento)
			Sistema --> Organizzatore : 1a.1a.1 errore evento terminato
			destroy Sistema
        else Eccezione 1a.1b
			Sistema --> Organizzatore : 1a.1b.1 errore evento non di proprietà
			destroy Sistema
	end
	else Estensione 1b 
		Organizzatore -> Sistema : 1b.1 eliminaEvento(evento)
		Sistema --> Organizzatore: evento
		destroy Sistema
	else Eccezione 1b.1a
		Sistema --> Organizzatore : 1b.1a.1 errore evento non di proprietà
		destroy Sistema

end
note right: Le estensioni del passo 1 possono\nessere delle alternative al passo.
loop n volte
        alt
	    Organizzatore -> Sistema : 2. compilaScheda(scheda, data, luogo, n_partecipanti, chef, staff)
		Sistema --> Organizzatore : scheda salvata
        else Estensione 2a
			Organizzatore -> Sistema : 2a.1 modificaData(scheda, data)
			Sistema --> Organizzatore : scheda aggiornata
		else Estensione 2b 
            Organizzatore -> Sistema : 2b.1 modificaChef(scheda, chef)
            Sistema --> Organizzatore : scheda aggiornata
		else Eccezione 2b.1a 
			Sistema --> Organizzatore : chef non disponibile
        else Estensione 2c
            Organizzatore -> Sistema : 2c.1 modificaLuogo(scheda, luogo)
            Sistema --> Organizzatore: scheda aggiornata
        else Estensione 2d
            Sistema -> Organizzatore : 2d.1 modificaNPartecipanti(scheda, n_partecipanti)
            Organizzatore -> Sistema : scheda aggiornata
        else Estensione 2e
            Organizzatore -> Sistema : 2e.1 modificaStaff(scheda, staff)
            Sistema --> Organizzatore : scheda aggiornata
	    else Eccezione 2e.1a
			Sistema --> Organizzatore : personale non disponibile
        end
            
		note right: La scheda può essere modificata n\nvolte

end

Organizzatore -> Sistema : 3. salvaEvento(evento)
Sistema --> Organizzatore: evento salvato

opt
Organizzatore -> Sistema : 4. pubblicaEvento(evento)
Sistema --> Organizzatore: evento pubblicato
end

opt
	Organizzatore -> Sistema : 5. scriviNota(nota)
	Sistema --> Organizzatore : nota evento salvata
end
note right: Non è obbligatorio aggiungere una nota all'evento\n

opt Estensione (2-5)a
	Organizzatore -> Sistema : (2-5)a.1 eliminaEvento(evento)
	Sistema --> Organizzatore : evento
	destroy Sistema
end
	note right: Non prevede l'errore di proprietà\nperché, se arrivato a questo punto,\nl'utente è il proprietario.
```
