import Foundation

struct Sauvegarde: Codable {
    let nomJoueur: String
    let position: String
    let inventaire: [String]
    let enigmesResolues: Int
    let enigmesDejaResolues: [String]?
}

func sauvegarderPartie(nom: String, position: String, inventaire: [String], enigmesResolues: Int, enigmesDejaResolues: Set<String>) {
    let sauvegarde = Sauvegarde(nomJoueur: nom, position: position, inventaire: inventaire, enigmesResolues: enigmesResolues, enigmesDejaResolues: Array(enigmesDejaResolues))
    let chemin = "/app/sauvegarde.json"
    do {
        let data = try JSONEncoder().encode(sauvegarde)
        try data.write(to: URL(fileURLWithPath: chemin))
    } catch {
        print("❌ Erreur de sauvegarde : \(error)")
    }
}

func chargerSauvegarde() -> Sauvegarde? {
    let chemin = "/app/sauvegarde.json"
    if FileManager.default.fileExists(atPath: chemin) {
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: chemin))
            return try JSONDecoder().decode(Sauvegarde.self, from: data)
        } catch {
            print("❌ Erreur de chargement de la sauvegarde : \(error)")
        }
    }
    return nil
}

let carte: [String: [String: String]] = [
    "Entrée": ["nord": "Couloir obscur", "ouest": "Bibliothèque"],
    "Couloir obscur": ["sud": "Entrée", "est": "Salle des énigmes"],
    "Salle des énigmes": ["ouest": "Couloir obscur", "nord": "Salle du trésor"],
    "Salle du trésor": ["sud": "Salle des énigmes", "est": "Cave secrète"],
    "Bibliothèque": ["est": "Entrée", "nord": "Laboratoire"],
    "Cave secrète": ["ouest": "Salle du trésor"],
    "Laboratoire": ["sud": "Bibliothèque", "nord": "Hall magique"],
    "Hall magique": ["sud": "Laboratoire", "est": "Jardin mystique"],
    "Jardin mystique": ["ouest": "Hall magique"]
]

var objetsDansSalles: [String: [String]] = [
    "Entrée": ["lampe torche"],
    "Couloir obscur": ["clé en or"],
    "Salle des énigmes": ["carte ancienne"],
    "Salle du trésor": ["potion magique"],
    "Bibliothèque": ["livre magique"],
    "Cave secrète": ["amulette d’ombre"],
    "Laboratoire": ["clé d’argent"],
    "Hall magique": ["orbe mystique"],
    "Jardin mystique": ["graines de vie"]
]

let enigmesDansSalles: [String: String] = [
    "Entrée": "Je commence la nuit et termine le matin. Qui suis-je ?",
    "Couloir obscur": "Plus je suis noir, plus je suis propre. Qui suis-je ?",
    "Salle des énigmes": "Je marche à quatre pattes le matin, deux le midi, trois le soir. Qui suis-je ?",
    "Salle du trésor": "Je suis précieux mais ne peux être volé. Qui suis-je ?",
    "Bibliothèque": "J’ai des pages mais ne suis pas un oiseau. Qui suis-je ?",
    "Cave secrète": "Je suis devant vous mais inatteignable. Qui suis-je ?",
    "Laboratoire": "Je bouille ou je congèle, invisible mais ressenti. Qui suis-je ?",
    "Hall magique": "Je parle quand on me frappe. Qui suis-je ?",
    "Jardin mystique": "Je pousse sans racines et bois sans bouche. Qui suis-je ?"
]

let descriptionsSalles: [String: String] = [
    "Entrée": "Tu es à l'entrée du donjon. Un vent glacial souffle derrière toi.",
    "Couloir obscur": "Un couloir sombre. Tu entends tes pas résonner.",
    "Salle des énigmes": "Des symboles brillent faiblement sur les murs.",
    "Salle du trésor": "Une grande salle pleine de coffres mystérieux.",
    "Bibliothèque": "Des livres anciens recouvrent chaque mur.",
    "Cave secrète": "L’endroit est humide et silencieux. Tu frissonnes.",
    "Laboratoire": "Un laboratoire abandonné rempli d’étranges substances.",
    "Hall magique": "Des lumières dansent dans ce vaste hall.",
    "Jardin mystique": "Des plantes brillantes et des fleurs inconnues t’entourent."
]

let personnagesDansSalles: [String: String] = [
    "Bibliothèque": "Vieil érudit",
    "Salle des énigmes": "Gardien des secrets",
    "Hall magique": "Maître des portails",
    "Jardin mystique": "Esprit de la forêt"
]

let dialoguesPersonnages: [String: String] = [
    "Vieil érudit": "Connais-tu la légende du livre qui prédit l’avenir ?",
    "Gardien des secrets": "Résous mon énigme, et je te livrerai un indice précieux.",
    "Maître des portails": "Les portails ne s’ouvrent qu’à ceux qui ont l’orbe mystique.",
    "Esprit de la forêt": "Les graines de vie ne poussent que dans un cœur pur."
]

// État du joueur
var nomJoueur = ""
var positionActuelle = "Entrée"
var inventaire: [String] = []
var enigmesResolues = 0
var enigmesDejaResolues: Set<String> = []

// Chargement de la sauvegarde
if let sauvegarde = chargerSauvegarde() {
    print("💾 Reprendre la dernière partie ? (o/n)")
    if let reponse = readLine(), reponse.lowercased() == "o" {
        nomJoueur = sauvegarde.nomJoueur
        positionActuelle = sauvegarde.position
        inventaire = sauvegarde.inventaire
        enigmesResolues = sauvegarde.enigmesResolues
        enigmesDejaResolues = Set(sauvegarde.enigmesDejaResolues ?? [])
        print("🔁 Partie chargée pour \(nomJoueur).")
    }
}

if nomJoueur.isEmpty {
    print("🎮 Quel est ton nom, aventurier ?")
    guard let nom = readLine(), !nom.isEmpty else {
        print("Nom invalide. Fin.")
        exit(0)
    }
    nomJoueur = nom
    print("👋 Bienvenue, \(nomJoueur) !")
}

func afficherCarte() {
    print("\n🗺️ Carte du monde :\n")
    let lignes = [
        ["Hall magique", "Jardin mystique"],
        ["Laboratoire"],
        ["Bibliothèque", "Entrée", "Couloir obscur", "Salle des énigmes", "Salle du trésor", "Cave secrète"]
    ]
    for ligne in lignes {
        var affichage = ""
        for salle in ligne {
            affichage += (salle == positionActuelle) ? "[🎯 \(salle)] " : "[   \(salle)] "
        }
        print(affichage)
    }
    print("")
}

func afficherScoreFinal() {
    print("\n🏆 Fin de l'aventure, \(nomJoueur) !")
    print("🎒 Objets collectés : \(inventaire.count)")
    print("🧠 Énigmes résolues : \(enigmesResolues)")
    let scoreTotal = (inventaire.count * 10) + (enigmesResolues * 20)
    print("🔢 Score final : \(scoreTotal) points")
    exit(0)
}

func verifierVictoire() {
    if positionActuelle == "Salle du trésor" &&
        inventaire.contains("clé en or") &&
        inventaire.contains("carte ancienne") {
        afficherScoreFinal()
    }
}

// Boucle principale
while true {
    print("\u{001B}[2J\u{001B}[H")

    let titre = "🌌 " + positionActuelle.uppercased()
    let ligne = String(repeating: "═", count: titre.count + 4)
    print("╔\(ligne)╗\n║  \(titre)  ║\n╚\(ligne)╝\n")

    print("✨ \(descriptionsSalles[positionActuelle] ?? "Un lieu mystérieux.")")
    let objets = objetsDansSalles[positionActuelle] ?? []
    print("📦 Objets : \(objets.isEmpty ? "Aucun" : objets.joined(separator: ", "))")
    if let enigme = enigmesDansSalles[positionActuelle], !enigmesDejaResolues.contains(positionActuelle) {
        print("🧩 Énigme : \(enigme)")
    } else {
        print("🧩 Énigme : Aucune")
    }
    if let perso = personnagesDansSalles[positionActuelle] {
        print("👤 Personnage : \(perso)")
    }

    print("\n🧭 Directions : [1] Nord   [2] Sud   [3] Est   [4] Ouest")
    print("🎮 Actions :")
    print("  5 - Ramasser l’objet       6 - Voir l’inventaire")
    print("  7 - Résoudre l’énigme      8 - Quitter l’aventure")
    print("  9 - Afficher la carte     10 - Parler au personnage")
    print("      aide / ? - Aide")
    print("➤ Ton choix : ", terminator: "")  // ✅ LIGNE CORRIGÉE

    guard let saisie = readLine()?.lowercased() else {
        print("❌ Entrée invalide.")
        continue
    }

    if saisie == "aide" || saisie == "?" {
        print("""
📖 Commandes disponibles :
1 - Aller au nord       2 - Aller au sud       3 - Aller à l’est       4 - Aller à l’ouest
5 - Ramasser l’objet    6 - Voir l’inventaire   7 - Résoudre énigme     8 - Quitter
9 - Afficher la carte   10 - Parler au personnage   aide / ? - Aide
""")
        _ = readLine()
        continue
    }

    guard let action = Int(saisie) else {
        print("❌ Choix invalide.")
        continue
    }

    switch action {
    case 1...4:
        let directions = ["nord", "sud", "est", "ouest"]
        if let prochaine = carte[positionActuelle]?[directions[action - 1]] {
            positionActuelle = prochaine
        } else {
            print("🚫 Impossible d’y aller.")
        }

    case 5:
        if let objets = objetsDansSalles[positionActuelle], !objets.isEmpty {
            for objet in objets where !inventaire.contains(objet) {
                inventaire.append(objet)
                print("👜 Objet ramassé : \(objet)")
            }
            objetsDansSalles[positionActuelle] = []
        } else {
            print("📭 Aucun objet à ramasser.")
        }

    case 6:
        print("🎒 Inventaire : \(inventaire.isEmpty ? "Vide" : inventaire.joined(separator: ", "))")

    case 7:
        if let enigme = enigmesDansSalles[positionActuelle], !enigmesDejaResolues.contains(positionActuelle) {
            print("🧠 \(enigme)")
            print("Votre réponse : ", terminator: "")
            if let rep = readLine()?.lowercased(), !rep.isEmpty {
                let bonnesReponses = ["humain", "avenir", "livre", "air", "gaz", "tambour", "plante", "fleur", "sommeil", "rêve", "nuit", "ardoise", "tableau", "victoire", "récompense", "vapeur"]
                if bonnesReponses.contains(where: { rep.contains($0) }) {
                    print("✅ Bonne réponse !")
                    enigmesResolues += 1
                    enigmesDejaResolues.insert(positionActuelle)
                } else {
                    print("❌ Mauvaise réponse.")
                }
            }
        } else {
            print("📭 Pas d’énigme ici ou déjà résolue.")
        }

    case 8:
        afficherScoreFinal()

    case 9:
        afficherCarte()
        _ = readLine()

    case 10:
        if let perso = personnagesDansSalles[positionActuelle],
           let message = dialoguesPersonnages[perso] {
            print("👤 \(perso) : “\(message)”")
        } else {
            print("📭 Il n'y a personne à qui parler ici.")
        }
        _ = readLine()

    default:
        print("❌ Option non reconnue.")
    }

    sauvegarderPartie(nom: nomJoueur, position: positionActuelle, inventaire: inventaire, enigmesResolues: enigmesResolues, enigmesDejaResolues: enigmesDejaResolues)
    verifierVictoire()
}
