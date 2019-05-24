```plantuml
actor Organizzatore
participant Sistema

loop

	Organizzatore -> Sistema : 1. creaEvento 
    alt successo
		Sistema --> Organizzatore : evento 
	else Estensione 1a
		Organizzatore -> Sistema : 1a. scegliEventoPreesistente
		Sistema --> Organizzatore : eventoPreesistente
	end
	
	Organizzatore -> Sistema : 2. compilaScheda
	alt successo
		Sistema --> Organizzatore : scheda salvata
	else Estensione 2a
		loop n volte
			Organizzatore -> Sistema : 2a. modificaScheda
			Sistema --> Organizzatore : scheda aggiornata
		end
        note right: La scheda può essere modificata\n n volte (n potrebbe essere anche 0)
	end
	
	loop Fin quando uno chef non è disponibile
		Organizzatore -> Sistema : 3. assegnaChef
		alt successo
			Sistema --> Organizzatore : aggiunto chef	
		else Eccezione 3a 
			Sistema --> Organizzatore : chef non disponibile
		end
	end
	
	loop Fin quando del personale non è disponibile
		Organizzatore -> Sistema : 4. assegnaPersonale
		alt successo
			Sistema --> Organizzatore : personale aggiunto
		else Eccezione 4a
			Sistema --> Organizzatore : personale non disponibile
		end
	end
    note right: I loop ai passi 3-4\n vanno ripetuti fin quando\n uno chef/membro del personale\n non è disponibile
	
	opt
		Organizzatore -> Sistema : 5. modificaPersonale(personale)
		Sistema --> Organizzatore : personale modificato
	end
	
	opt
		Organizzatore -> Sistema : 6. rimuoviEvento(evento)
		alt Estensione 6a
			Organizzatore -> Sistema : 6a.1 fare pagare una penale
		else Estensione 6b
			Organizzatore -> Sistema : 6b.1 non fare pagare penale
		end
		Sistema --> Organizzatore : evento rimosso
	end
	
	opt
		Organizzatore -> Sistema : 7. spostaEvento(evento)
		alt successo
			Sistema --> Organizzatore : ricomincia la compilazione
        else Eccezione 7a
			Organizzatore -> Sistema : 7b eliminaEvento(evento)
			Sistema --> Organizzatore : evento rimosso
		end
	end
end
note right: Il loop esegue se un evento è spostato e bisogna ricrearlo

opt
	Organizzatore -> Sistema : 8. scriviNote(evento)
	Sistema --> Organizzatore : note evento inserite
end


```
