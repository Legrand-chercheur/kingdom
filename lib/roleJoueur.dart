import 'dart:ui';

import 'Armes.dart';
import 'Capacite.dart';
import 'Joueur.dart';
import 'main.dart';

class RoleData {

  static CombatScreen? combatScreenInstance;

  static void configureCombatScreen(CombatScreen instance) {
    combatScreenInstance = instance;
  }

  static List<Role> roles = [
    Role(
      roleName: 'Vagabond',
      capacite: Capacite(
        pv: 150,
        pm: 0,
        force: 10,
        agilite: 5,
        defense: 10,
        endurance: 2,
        vitesse: 5,

      ),
      niveau: 1,
      exp: 300,
      arme: Arme(force: 0, agilite: 0, vitesse: 0, nomArme: 'Main nue'),
      pointsDeCapaciteDisponibles: 0,
      expNiveauSuivant: 600,
      asset: 'vagabond.png',
      addCombatMessage: combatScreenInstance?.addCombatMessage ?? (String message, Color couleur) {},
    ),
    Role(
      roleName: 'Aventurier',
      capacite: Capacite(
        pv: 40,
        pm: 5,
        force: 15,
        agilite: 8,
        defense: 15,
        endurance: 3,
        vitesse: 7,
      ),
      niveau: 6,
      exp: 0,
      arme: Arme(force: 5, agilite: 2, vitesse: 3, nomArme: 'Épée courte'),
      pointsDeCapaciteDisponibles: 0,
      expNiveauSuivant: 1200,
      asset: 'aventurier.png',
      addCombatMessage: combatScreenInstance?.addCombatMessage ?? (String message, Color couleur) {},
    ),
    Role(
      roleName: 'Guerrier',
      capacite: Capacite(
        pv: 50,
        pm: 10,
        force: 20,
        agilite: 10,
        defense: 20,
        endurance: 5,
        vitesse: 10
      ),
      niveau: 12,
      exp: 0,
      arme: Arme(force: 10, agilite: 5, vitesse: 5, nomArme: 'Hache de guerre'),
      pointsDeCapaciteDisponibles: 0,
      expNiveauSuivant: 2400,
      asset: 'guerier.png',
      addCombatMessage: combatScreenInstance?.addCombatMessage ?? (String message, Color couleur) {},
    ),
    Role(
      roleName: 'Héros',
      capacite: Capacite(
        pv: 60,
        pm: 15,
        force: 25,
        agilite: 12,
        defense: 25,
        endurance: 7,
        vitesse: 12,
      ),
      niveau: 18,
      exp: 0,
      arme: Arme(force: 15, agilite: 8, vitesse: 7, nomArme: 'Épée légendaire'),
      pointsDeCapaciteDisponibles: 0,
      expNiveauSuivant: 4800,
      asset: 'hero.png',
      addCombatMessage: combatScreenInstance?.addCombatMessage ?? (String message, Color couleur) {},
    ),
    Role(
      roleName: 'Légende',
      capacite: Capacite(
        pv: 70,
        pm: 20,
        force: 30,
        agilite: 15,
        defense: 30,
        endurance: 10,
        vitesse: 15,
      ),
      niveau: 24,
      exp: 0,
      arme: Arme(force: 20, agilite: 10, vitesse: 10, nomArme: 'Marteau divin'),
      pointsDeCapaciteDisponibles: 0,
      expNiveauSuivant: 9600,
      asset: 'aventurieur.png',
      addCombatMessage: combatScreenInstance?.addCombatMessage ?? (String message, Color couleur) {},
    ),
    Role(
      roleName: 'Maître',
      capacite: Capacite(
        pv: 80,
        pm: 25,
        force: 35,
        agilite: 18,
        defense: 35,
        endurance: 12,
        vitesse: 18,
      ),
      niveau: 30,
      exp: 0,
      arme: Arme(force: 25, agilite: 12, vitesse: 12, nomArme: 'Lame des ombres'),
      pointsDeCapaciteDisponibles: 0,
      expNiveauSuivant: 0,
      asset: 'aventurieur.png',
      addCombatMessage: combatScreenInstance?.addCombatMessage ?? (String message, Color couleur) {},
    ),
  ];
}

