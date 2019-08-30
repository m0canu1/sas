```plantuml
Class menu {
    Titolo: testo
    Pubblicato: si/no
    
    Consigliato cuoco: si/no
    Piatti caldi: si/no
    Richiede cucina: si/no
    Buffet: si/no
    Finger food: si/no
}

Class Sezione {
    Nome: testo
}

Class Voce {
    Descrizione: testo
}

Class Compito {
    Porzioni/Quantita: numero
    Tempo Stimato: numero
}

Class Procedura_in_Cucina<estende Ricetta, Preparazione> {

}

Class Ricetta {
	Titolo: testo
	Pubblicato: si/no
	Ingredienti: testo
	Dosi: numero
    Originale: ricetta
}

Class Passo {
	Dettaglio: testo
}

Class Classe {
	Nome: testo
}

Class Scheda{
	Data: data
	Luogo: testo
	Numero partecipanti: numero
}
Class Evento {
	Note: testo
	Penale: sì/no
	Annullato: sì/no
}

Class Preparazione{
    Nome: testo
}

Chef "1" -- "0..n" menu: è proprietario di >
Evento "0..n" -- "1" Chef
Chef "1" -- "0..n" Ricetta: Scrive >
Cuoco "1" -- "0..n" Ricetta: Scrive >
Evento "0..n" -- "1..n" Membro_del_Personale
Scheda "1" -- "1" Evento
Organizzatore "1" -- "0..n" Scheda: Compila >
Ricetta "0..n" -- "1" Classe
Classe "1..n" -- "1" Ricettario
Passo "1..n" -- "1" Ricetta
menu "1" -- "0...n" Voce: appartiene >
menu "1" -- "0...n" Sezione: contiene >
menu "0...1" -- "0...n" Evento: in uso in >
Evento "0..n" -- "1" Organizzatore : Organizza <
Voce "0...n" -- "0-1" Sezione: si trova in >
Voce "0...n" -- "1" Ricetta: fa riferimento a >
Foglio_Riepilogativo "1" -- "0...n" Compito: richiede >
Foglio_Riepilogativo "0...1" -- "1" Evento: riferito a >
Compito "0...n" -- "0...1" Turno: svolto in >
Tabellone_dei_Turni "1" -- "0...n" Turno: prevede >
Cuoco "0...n" -- "0...n" Turno: lavora in >
Compito "0...n" -- "0...1" Cuoco: eseguito da >
Compito "0...n" -- "1" Procedura_in_Cucina: consiste in >
Ricettario "1" -- "0...n" Procedura_in_Cucina: si trova in >
Preparazione "0...n" -- "0...n" Procedura_in_Cucina: e ingrediente in >
Ricetta "0..n" -- "0..n" Preparazione: e ingrediente in <
Ricetta --> Procedura_in_Cucina


```
