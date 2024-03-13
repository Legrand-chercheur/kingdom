import 'dart:math';
import 'Joueur.dart';
import 'Objets.dart';

class Inventaire {
  List<Map<String, dynamic>> objets = [];

  void ajouterObjet(Objet objet, {int quantite = 1}) {
    // Vérifiez si l'objet est déjà dans la liste
    int indexObjetExistant = objets.indexWhere((element) => element["nom"] == objet.nom);

    if (indexObjetExistant != -1) {
      // L'objet existe déjà dans la liste, augmentez simplement la quantité
      objets[indexObjetExistant]["quantite"] += quantite;
    } else {
      // L'objet n'existe pas dans la liste, ajoutez-le avec une quantité de 1
      objets.add({"nom": objet.nom, "description": objet.description, "quantite": quantite});
    }
  }


  void utiliserObjet(Objet objet, Role joueurRole) {
    int index = objets.indexWhere((element) => element['objet'] == objet);

    if (index != -1 && objets[index]['quantite'] > 0) {
      // Si l'objet est présent et la quantité est supérieure à zéro
      objet.utiliser(joueurRole); // Appliquer l'action de l'objet sur le joueur

      // Décrémenter la quantité
      objets[index]['quantite']--;

      print('Objet utilisé : ${objet.nom} (Quantité restante : ${objets[index]['quantite']})');
    } else {
      print('L\'objet n\'est pas présent dans l\'inventaire ou la quantité est insuffisante.');
    }
  }

  // Modifier votre méthode obtenirObjetAleatoire pour accepter la liste d'objets en paramètre
  Objet obtenirObjetAleatoire(List<Objet> listeObjets) {
    Random random = Random();
    int index = random.nextInt(listeObjets.length);
    Objet objetObtenu = listeObjets[index];

    print('Vous avez obtenu : ${objetObtenu.nom}');

    return objetObtenu;
  }

}


