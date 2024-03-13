class Mechant {
  String nom;
  String asset;
  CapaciteMechant capacite;
  int expDonnee;
  List<Affliction> afflictions;

  Mechant({
    required this.nom,
    required this.capacite,
    required this.expDonnee,
    required this.asset,
    this.afflictions = const [],
  });

  // Ajoute une affliction au méchant
  void ajouterAffliction(Affliction affliction) {
    afflictions.add(affliction);
  }

  // Logique pour gérer les effets des afflictions
  void appliquerAfflictions() {
    for (Affliction affliction in afflictions) {
      switch (affliction.type) {
        case AfflictionType.Poison:
        // Logique pour gérer l'affliction de poison
          capacite.pv -= affliction.puissance;
          break;
        case AfflictionType.Paralyse:
        // Logique pour gérer l'affliction de paralysie
        // Par exemple, réduire la vitesse du méchant
          capacite.vitesse -= affliction.puissance;
          break;
      // Ajoutez d'autres cas selon les types d'affliction que vous avez définis
      }
    }
  }

}

class CapaciteMechant {
  int pv;
  int pm;
  int force;
  int agilite;
  int defense;
  int endurance;
  int vitesse;

  CapaciteMechant({
    required this.pv,
    required this.pm,
    required this.force,
    required this.agilite,
    required this.defense,
    required this.endurance,
    required this.vitesse,
  });
}

enum AfflictionType {
  Poison,
  Paralyse,
  // Ajoutez d'autres types d'affliction au besoin
}

class Affliction {
  AfflictionType type;
  int puissance;

  Affliction({
    required this.type,
    required this.puissance,
  });
}