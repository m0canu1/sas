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
		else Eccezione 1a.1
			'Organizzatore -> Sistema : 1a.1 scegliEvento(evento)
			Sistema --> Organizzatore : 1a.1a errore evento terminato
			destroy Sistema
			Sistema --> Organizzatore : 1a.1b errore evento non di proprietà
			destroy Sistema
	end
	else Estensione 1b 
		Organizzatore -> Sistema : 1b.1 eliminaEvento(evento)
		Sistema --> Organizzatore: evento
		destroy Sistema
	else Eccezione 1b.1a
		Sistema --> Organizzatore : 1b.1a errore evento non di proprietà
		destroy Sistema

end
note right: Le estensioni del passo 1 possono\nessere delle alternative al passo.
loop n volte
	Organizzatore -> Sistema : 2. compilaScheda(scheda)
		Sistema --> Organizzatore : scheda salvata
	loop n volte
		alt Estensione 2a
			Organizzatore -> Sistema : 2a. modificaScheda(scheda)
			Sistema --> Organizzatore : scheda aggiornata
		end
	end
		note right: La scheda può essere modificata n\nvolte (n potrebbe essere anche 0)

	loop n volte
		Organizzatore -> Sistema : 3. assegnaChef(chef)
			Sistema --> Organizzatore : chef aggiunto	
		alt Estensione 3a
			Organizzatore -> Sistema: 3a.1 modificaChef(chef)
			Sistema --> Organizzatore: chef modificato
		end
		else Eccezione 3a.1a 
			Sistema --> Organizzatore : chef non disponibile
			destroy Sistema
	end
	note right: Il loop riesegue se uno chef\nnon è disponibile
	loop n volte
		Organizzatore -> Sistema : 4. assegnaPersonale(personale)
		Sistema --> Organizzatore : personale aggiornato
		alt Estensione 4a
			Organizzatore -> Sistema : 4a.1 aggiungiPersonale(personale)
			Sistema --> Organizzatore : personale aggiornato
		else Eccezione 4a.1a
			Sistema --> Organizzatore : personale non disponibile
			destroy Sistema
		else Estensione 4b.1
			Organizzatore -> Sistema : eliminaPersonale(personale)
			Sistema --> Organizzatore : personale aggiornato
		end
	end
	note right: Il loop riesegue se il membro\ndel personale non è disponibile
end
note right: Il loop esterno rappresenta la possibilità di ripetere i passi\n2, 3 e 4 come indicato dopo il passo 4 nello UC: "Se\ndesidera torna al passo 2, altrimenti prosegue"
opt
	Organizzatore -> Sistema : 5. scriviNota(nota)
	Sistema --> Organizzatore : nota evento salvata
end
note right: Il passo 5 non è obbligatorio\n quindi è stato reso opzionale

opt Estensione (2-5)a
	Organizzatore -> Sistema : (2-5)a.1 eliminaEvento(evento)
	Sistema --> Organizzatore : evento
	destroy Sistema
end
	note right: Non prevede l'errore di proprietà\nperché, se arrivato a questo punto,\nl'utente è il proprietario.
```
