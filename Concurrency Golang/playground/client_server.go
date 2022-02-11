package main

import (
	"fmt"
	"strings"
	"time"
)

type Reply struct {
	nombre int
}

type Request struct {
	Mot     string
	Lettre  string
	Reponse chan *Reply
}

// fonction service pour chaque requête
func lettreCompteur(r *Request) {

	// effectuer la tâche demandée
	n := strings.Count(r.Mot, r.Lettre)

	// construire la réponse
	rep := &Reply{n}
	// insertion de la réponse
	// possiblement plusieurs
	r.Reponse <- rep
}

// serveur de requêtes
func server(service chan *Request) {

	for {
		// arrivée d'une requête
		req := <-service
		// lancement d'une routine de service
		go lettreCompteur(req)
	}
}

// Démarrage du server
func startServer() chan *Request {

	r := make(chan *Request)
	go server(r)
	return r
}

// simulateur de client
func client(nom string, lettre string, vitesse time.Duration, accept chan *Request) {

	bidon := "test"
	var req *Request
	var rep *Reply

	for i := 0; i < 10; i++ {
		// Création d'une requête
		req = &Request{bidon, lettre, make(chan *Reply)}
		time.Sleep(vitesse * time.Millisecond)
		// Envoie de la requête
		accept <- req
		// Attente de la réponse
		rep = <-req.Reponse
		fmt.Printf("%s: %d\n", nom, rep.nombre)
		close(req.Reponse)
		// Modification de la chaine (test)
		bidon += bidon
	}
}
func main() {

	accept := startServer()

	go client("User ABC", "t", 200, accept)
	go client("User XYZ", "e", 300, accept)
	go client("User WOW", "s", 100, accept)
	go client("User NON", "x", 700, accept)

	// devrait inclure un signal de terminaison...
	time.Sleep(5 * time.Second)

}
