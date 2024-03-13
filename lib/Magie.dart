import 'Joueur.dart';
import 'Mechant.dart';

class Magie {
  late String nom;
  late String type; // Peut être "soins", "défense" ou "attaque"
  late int coutMana;
  late EffetSurJoueur effetSurJoueur;
  late EffetSurMechant effetSurMechant;

  Magie({
    required this.nom,
    required this.type,
    required this.coutMana,
    required this.effetSurJoueur,
    required this.effetSurMechant,
  });

  void appliquerEffetSurJoueur(Role joueur) {
    joueur.capacite.pv += effetSurJoueur.soins;
    joueur.capacite.defense += effetSurJoueur.defense;
  }

  void appliquerEffetSurMechant(Mechant mechant) {
    mechant.capacite.pv -= effetSurMechant.degats;
    // Appliquer les afflictions sur le méchant
    mechant.appliquerAfflictions();
  }
}

class EffetSurJoueur {
  int soins; // Points de vie restaurés en cas de sort de soins
  int defense; // Points de défense ajoutés en cas de sort de défense

  EffetSurJoueur({
    required this.soins,
    required this.defense
  });

}

class EffetSurMechant {
  int degats; // Points de dégâts infligés en cas de sort d'attaque
  int affliction; // Effets néfastes (par exemple, empoisonnement) en cas de sort d'attaque

  EffetSurMechant({
    required this.degats,
    required this.affliction
  });
}
