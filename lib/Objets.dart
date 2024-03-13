import 'Joueur.dart';
import 'Mechant.dart';


class Objet {
  String nom;
  String description;
  Function(Role, List<Mechant>) action;

  Objet({
    required this.nom,
    required this.description,
    required this.action,
  });

  void utiliser(Role role, {List<Mechant>? mechants}) {
    action(role, mechants ?? []);
  }

  @override
  String toString() {
    return nom; // Vous pouvez ajuster le format de la représentation en chaîne selon vos besoins
  }
}