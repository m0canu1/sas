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
		Sistema --> Organizzatore : 1b.1a.1 errore evento non di proprietà dell'utente
		destroy Sistema

end
note right: Le estensioni del passo 1 possono\nessere delle alternative al passo. 
   	Organizzatore -> Sistema : 2. compilaScheda( data, luogo, n_partecipanti)
 	Sistema --> Organizzatore : scheda salvata
    alt
        Organizzatore -> Sistema : 3. assegnaChef(chef)
        Sistema --> Organizzatore: chef assegnato
    else Eccezione 3.1a
        Sistema --> Organizzatore: chef non disponibile, ripeti passo 3
    end
loop Fino a soddisfacimento
    opt
        alt
            Organizzatore -> Sistema : 4. assegnaMembroDelPersonale(membro_del_personale)
            Sistema --> Organizzatore: membro del personale assegnato
        else Estensione 4a
            Organizzatore -> Sistema : 4a. aggiungiRuolo(ruolo, membro_del_personale)
            Sistema --> Organizzatore: ruolo assegnato al membro del personale
        else Estensione 4b 
            Organizzatore -> Sistema : 4b. rimuoviMembro(membro_del_personale)
            Sistema --> Organizzatore: membro rimosso
        else Estensione 4c
            Organizzatore -> Sistema : 4c. rimuoviRuolo(ruolo, membro_del_personale)
            Sistema --> Organizzatore: assegnamento rimosso
        else Eccezione 4.1a
            Sistema --> Organizzatore: membro del personale non disponibile
        end
    end
end

alt Estensione (2-4)a
    Organizzatore -> Sistema: (2-4)a.1 modificaDataEvento(scheda, data)
    Sistema --> Organizzatore: data nella scheda cambiata
else Estensione (2-4)b
    Organizzatore -> Sistema: (2-4)b.1 modificaLuogoEvento(schedda, luogo)
    Sistema --> Organizzatore: luogo nella scheda cambiato
else Estensione (2-4)c
    Organizzatore -> Sistema: (2-5)c.1 modificaNPartecipanti(scheda, n_partecipanti)
    Sistema --> Organizzatore: numero partecipanti nella scheda cambiato
end
alt Estensione (3-4)a
    Organizzatore -> Sistema: (3-4)a.1 modificaChef(chef)
    Sistema --> Organizzatore: chef modificato
else Eccezione (3-4)a.1
    Sistema --> Organizzatore: chef non disponibile, errore
end    
opt
    Organizzatore -> Sistema: 5. pubblicaEvento(evento)
    Sistema --> Organizzatore: evento pubblicato
end
alt Estensione (2-5)a
    	Organizzatore -> Sistema : (2-5)a.1 eliminaEvento(evento)
    	Sistema --> Organizzatore : evento
    	destroy Sistema
else  Estensione (2-5)b
    	Organizzatore -> Sistema : (2-5)b.1 annullaEvento(evento)
    	Sistema --> Organizzatore : evento annullato
        opt
            Organizzatore -> Sistema : (2-5)b.2 impostaPenale(penale)
            Sistema --> Organizzatore : penale impostata
        end
else  Estensione (2-5)c
        Organizzatore -> Sistema : (2-5)c.1 scriviNote(testo)
        Sistema --> Organizzatore : note salvate
end

note right: Non prevede l'errore di proprietà\nperché, se arrivato a questo punto,\nl'utente è il proprietario.
```
