import 'dart:math';
import 'package:flutter/material.dart';
import 'package:kingdom/roleJoueur.dart';
import 'Armes.dart';
import 'Capacite.dart';
import 'Magie.dart';
import 'Mechant.dart';

class Role {
  String roleName;
  String asset;
  Capacite capacite;
  int niveau;
  int exp;
  Arme arme;
  int pointsDeCapaciteDisponibles;
  bool modeDefense = false;

  final Function(String message, Color couleur) addCombatMessage;

  Role({
    required this.roleName,
    required this.asset,
    required this.capacite,
    required this.niveau,
    required this.exp,
    required this.arme,
    required this.pointsDeCapaciteDisponibles,
    required this.expNiveauSuivant,
    required this.addCombatMessage
  }) {
    expNiveauSuivant = exp * 2;
  }

  int expNiveauSuivant;

  // Fonction pour ajouter un message au déroulement du combat
  void ajouterMessage(String message, Color couleur) {
    addCombatMessage(message, couleur);
  }

  void activerModeDefense() {
    modeDefense = true;
    print('Vous êtes en mode défense. Votre défense est augmentée.');
  }

  void desactiverModeDefense() {
    modeDefense = false;
    print('Vous n\'êtes plus en mode défense.');
  }

  void levelUp(context) {
    if (exp >= expNiveauSuivant) {
      niveau++;

      // Trouver le rôle correspondant au niveau actuel
      Role nouveauRole = RoleData.roles.firstWhere((role) => role.niveau >= niveau, orElse: () => RoleData.roles.last);

      // Mise à jour des données du joueur avec les caractéristiques du nouveau rôle
      roleName = nouveauRole.roleName;
      asset = nouveauRole.asset;
      capacite = Capacite(
        pv: capacite.pv + nouveauRole.capacite.pv,
        pm: capacite.pm + nouveauRole.capacite.pm,
        force: capacite.force + nouveauRole.capacite.force,
        agilite: capacite.agilite + nouveauRole.capacite.agilite,
        defense: capacite.defense + nouveauRole.capacite.defense,
        endurance: capacite.endurance + nouveauRole.capacite.endurance,
        vitesse: capacite.vitesse + nouveauRole.capacite.vitesse,
      );
      expNiveauSuivant = exp * 2;
      pointsDeCapaciteDisponibles += 5;

      attribuerPointsCapaciteDialog(context);

      int expNiveauSuivantNouveau = expNiveauSuivant - exp;
      print('Expérience nécessaire pour le prochain niveau : $expNiveauSuivantNouveau');
      print('Nouveau niveau atteint : $niveau');
    }
  }

  void verifierLevelUp(context) {
    if (exp >= expNiveauSuivant) {
      levelUp(context);
    }else{
      Navigator.pop(context, true);
    }
  }

  void equiperArme(Arme nouvelleArme) {
    capacite.force += nouvelleArme.force;
    capacite.agilite += nouvelleArme.agilite;
    capacite.vitesse += nouvelleArme.vitesse;
    arme = nouvelleArme;
  }

  void attribuerPointsCapaciteDialog(BuildContext context) {
    int pointsForce = 0;
    int pointsAgilite = 0;
    int pointsVitesse = 0;
    int pointsDefense = 0;
    int pointsEndurance = 0;
    int pointActuel = 0;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Level up ! Vous êtes maintenant devenu un $roleName. '
                  'Vous avez reçu des points de capacité à améliorer.'),
              content: Column(
                children: [
                  Text('Points disponibles : $pointsDeCapaciteDisponibles'),
                  SizedBox(height: 16),
                  buildAttributeRow('Force', pointsForce, (value) {
                    pointsForce = value;
                  }, setState, pointActuel),
                  buildAttributeRow('Agilité', pointsAgilite, (value) {
                    pointsAgilite = value;
                  }, setState, pointActuel),
                  buildAttributeRow('Vitesse', pointsVitesse, (value) {
                    pointsVitesse = value;
                  }, setState, pointActuel),
                  buildAttributeRow('Défense', pointsDefense, (value) {
                    pointsDefense = value;
                  }, setState, pointActuel),
                  buildAttributeRow('Endurance', pointsEndurance, (value) {
                    pointsEndurance = value;
                  }, setState, pointActuel),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Fermer la boîte de dialogue
                  },
                  child: Text('Annuler'),
                ),
                TextButton(
                  onPressed: () {
                    // Appliquer les points attribués
                    if (pointsDeCapaciteDisponibles <=
                        (pointsForce + pointsAgilite + pointsVitesse + pointsDefense + pointsEndurance)) {
                      attribuerPointsCapacite(
                        pointsForce: pointsForce,
                        pointsAgilite: pointsAgilite,
                        pointsVitesse: pointsVitesse,
                        pointsDefense: pointsDefense,
                        pointsEndurance: pointsEndurance,
                      );
                    } else {
                      print('Points de capacité insuffisants pour attribuer.');
                    }

                    Navigator.of(context).pop(); // Fermer la boîte de dialogue
                  },
                  child: Text('Attribuer'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget buildAttributeRow(String attributeName, int value, Function(int) onChanged, Function setState, pointActuel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('$attributeName:'),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                if (value > 0) {
                  setState(() {
                    onChanged(value - 1);
                    pointActuel --;
                    pointsDeCapaciteDisponibles ++;
                  });
                }
              },
            ),
            Text('$value'),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                if (pointsDeCapaciteDisponibles > 0) {
                  setState(() {
                    onChanged(value + 1);
                    pointsDeCapaciteDisponibles --;
                    pointActuel ++;
                  });
                }
              },
            ),
          ],
        ),
      ],
    );
  }

  void attribuerPointsCapacite({
    int pointsForce = 0,
    int pointsAgilite = 0,
    int pointsVitesse = 0,
    int pointsDefense = 0,
    int pointsEndurance = 0,
  }) {
    capacite.force += pointsForce;
    capacite.agilite += pointsAgilite;
    capacite.vitesse += pointsVitesse;
    capacite.defense += pointsDefense;
    capacite.endurance += pointsEndurance;

    pointsDeCapaciteDisponibles -=
    (pointsForce + pointsAgilite + pointsVitesse + pointsDefense + pointsEndurance);
  }


  int calculerPointsAttaque() {
    // Calculer les points d'attaque en fonction du niveau du joueur
    double pourcentageBonus = niveau * 0.02;
    double resultatDouble = (capacite.force + capacite.agilite + capacite.vitesse) * (1 + pourcentageBonus);

    // Conversion vers un entier
    int resultatEntier = resultatDouble.toInt();

    return resultatEntier;
  }

  void attaquer(Mechant mechant) {
    if (mechant.capacite.pv > 0) {
      int defenseJoueur = capacite.defense;

      if (modeDefense) {
        defenseJoueur *= 2;
      }

      if (!modeDefense) {
        int pointsAttaqueJoueur = calculerPointsAttaque();
        int pointsAttaqueMechant =
            (mechant.capacite.force * 2) + (mechant.capacite.agilite * 3) + (mechant.capacite.vitesse * 1);

        int degatsJoueur = max(0, pointsAttaqueJoueur - mechant.capacite.defense);
        int degatsMechant = max(0, pointsAttaqueMechant - defenseJoueur);

        mechant.capacite.pv -= degatsJoueur;
        attaquerMechant(mechant.capacite.pv, degatsMechant);
        ajouterMessage('Vous infligez $degatsJoueur points de dégâts au méchant ${mechant.nom}.', Colors.white);
        ajouterMessage('Le méchant inflige $degatsMechant points de dégâts.', Colors.red);
        ajouterMessage('Points de vie restants du méchant ${mechant.nom}: ${mechant.capacite.pv}', Colors.white);
        ajouterMessage('Vos points de vie restants : ${capacite.pv}', Colors.white);
      } else {
        ajouterMessage('Vous êtes en mode défense. Vous ne pouvez pas attaquer ce tour.',Colors.red);
      }

      ajouterMessage('Points de vie restants du méchant ${mechant.nom}: ${mechant.capacite.pv}', Colors.white);
      ajouterMessage('Vos points de vie restants : ${capacite.pv}', Colors.white);
    } else {
      ajouterMessage('Le méchant ${mechant.nom} est déjà vaincu. Pas d\'attaque.', Colors.white);
    }
  }

  void attaquerMechant(int pvMechant, int pointDegat) {
    if (pvMechant > 0) {
      capacite.pv -= pointDegat;
    }
  }

  void fuir(BuildContext context) {
    Random random = Random();
    int randomNumber = random.nextInt(3) + 1;

    if (randomNumber == 1) {
      ajouterMessage('Vous avez réussi à fuir le combat.', Colors.white);
      Navigator.pop(context); // Retourner à la page précédente
    } else {
      ajouterMessage('Vous ne pouvez pas fuir. Les méchants bloquent votre chemin.', Colors.red);
    }
  }

  void utiliserSort(Magie sort, List<Mechant> mechantsAuCombat) {
    // Vérifier si le joueur a suffisamment de mana pour lancer le sort
    if (capacite.pm >= sort.coutMana) {
      capacite.pm -= sort.coutMana; // Déduire le coût en mana

      // Appliquer les effets du sort sur le joueur
      sort.appliquerEffetSurJoueur(this);

      // Appliquer les effets du sort sur les méchants au combat
      for (Mechant mechant in mechantsAuCombat) {
        sort.appliquerEffetSurMechant(mechant);
      }
    } else {
      ajouterMessage('Mana insuffisant pour lancer ce sort.', Colors.red);
      // Gérer le cas où le joueur n'a pas assez de mana pour lancer le sort
    }
  }

}