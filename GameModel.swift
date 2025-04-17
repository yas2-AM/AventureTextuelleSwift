import Foundation

// MARK: - Objet
struct Objet: Codable {
    let id: String
    let nom: String
    let description: String
    let estCombinable: Bool
}

// MARK: - Enigme
struct Enigme: Codable {
    let id: String
    let question: String
    let reponse: String
    let indice: String?
    var resolue: Bool
}

// MARK: - Personnage
struct Personnage: Codable {
    let id: String
    let nom: String
    let dialogue: String
    let objetsPossedes: [String]
}

// MARK: - Salle
struct Salle: Codable {
    let id: String
    let nom: String
    let description: String
    let directions: [String: String] // ex : ["nord": "salle2"]
    let objets: [String]
    let personnages: [String]
    let enigmes: [String]
}
// MARK: - Monde du jeu
struct MondeDuJeu: Codable {
    let salles: [Salle]
    let objets: [Objet]
    let personnages: [Personnage]
    let enigmes: [Enigme]
}

// Fonction pour charger les données depuis le JSON
func chargerMondeDepuisJSON(chemin: String) -> MondeDuJeu? {
    let url = URL(fileURLWithPath: chemin)

    do {
        let data = try Data(contentsOf: url)
        let monde = try JSONDecoder().decode(MondeDuJeu.self, from: data)
        return monde
    } catch {
        print("Erreur lors du chargement du JSON : \(error)")
        return nil
    }
}


