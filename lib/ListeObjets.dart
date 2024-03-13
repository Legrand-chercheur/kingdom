import 'Joueur.dart';
import 'Mechant.dart';
import 'Objets.dart';

List<Objet> genererObjets() {
  return [
    Objet(
      nom: 'Éclat de Givre',
      description: 'Inflige 10 points de dégâts à l\'ennemi.',
      action: (Role role, List<Mechant> mechants) {
        if (mechants.isNotEmpty) {
          mechants[0].capacite.pv -= 10;
          print('Vous avez utilisé un Éclat de Givre. Ennemi touché. Dégâts infligés : 10.');
        } else {
          print('Pas d\'ennemi à cibler.');
        }
      },
    ),
    Objet(
      nom: 'Plume Légère',
      description: 'Augmente la vitesse du joueur de 3 points.',
      action: (Role role, List<Mechant> mechants) {
        role.capacite.vitesse += 3;
        print('Vous avez utilisé une Plume Légère. Vitesse augmentée de 3.');
      },
    ),
    Objet(
      nom: 'Potion de Guérison',
      description: 'Rend 20 points de vie au joueur.',
      action: (Role role, List<Mechant> mechants) {
        role.capacite.pv += 20;
        print('Vous avez utilisé une Potion de Guérison. Points de vie rendus : 20.');
      },
    ),
    Objet(
      nom: 'Épée du Dragon',
      description: 'Augmente la force du joueur de 5 points.',
      action: (Role role, List<Mechant> mechants) {
        role.capacite.force += 5;
        print('Vous avez utilisé une Épée du Dragon. Force augmentée de 5.');
      },
    ),
    Objet(
      nom: 'Bouclier de Protection',
      description: 'Augmente la défense du joueur de 5 points.',
      action: (Role role, List<Mechant> mechants) {
        role.capacite.defense += 5;
        print('Vous avez utilisé un Bouclier de Protection. Défense augmentée de 5.');
      },
    ),
    Objet(
      nom: 'Flèche Empoisonnée',
      description: 'Empoisonne l\'ennemi, inflige 5 points de dégâts par tour pendant 3 tours.',
      action: (Role role, List<Mechant> mechants) {
        if (mechants.isNotEmpty) {
          mechants[0].capacite.pv -= 5;
          print('Vous avez utilisé une Flèche Empoisonnée. Ennemi empoisonné. Dégâts infligés : 5 par tour (3 tours).');
        } else {
          print('Pas d\'ennemi à cibler.');
        }
      },
    ),
    Objet(
      nom: 'Éclat Solaire',
      description: 'Restaure 15 points de vie au joueur.',
      action: (Role role, List<Mechant> mechants) {
        role.capacite.pv += 15;
        print('Vous avez utilisé un Éclat Solaire. Points de vie restaurés : 15.');
      },
    ),
    Objet(
      nom: 'Amulette de Puissance',
      description: 'Augmente la force du joueur de 8 points.',
      action: (Role role, List<Mechant> mechants) {
        role.capacite.force += 8;
        print('Vous avez utilisé une Amulette de Puissance. Force augmentée de 8.');
      },
    ),
    Objet(
      nom: 'Poussière d\'Évasion',
      description: 'Augmente l\'agilité du joueur de 4 points.',
      action: (Role role, List<Mechant> mechants) {
        role.capacite.agilite += 4;
        print('Vous avez utilisé de la Poussière d\'Évasion. Agilité augmentée de 4.');
      },
    ),
    Objet(
      nom: 'Potion d\'Endurance',
      description: 'Augmente l\'endurance du joueur de 5 points.',
      action: (Role role, List<Mechant> mechants) {
        role.capacite.endurance += 5;
        print('Vous avez utilisé une Potion d\'Endurance. Endurance augmentée de 5.');
      },
    ),
    Objet(
      nom: 'Livre des Ombres',
      description: 'Augmente la puissance magique du joueur de 7 points.',
      action: (Role role, List<Mechant> mechants) {
        role.capacite.pm += 7;
        print('Vous avez utilisé un Livre des Ombres. Puissance magique augmentée de 7.');
      },
    ),
    Objet(
      nom: 'Gantelet de Fer',
      description: 'Augmente la défense du joueur de 7 points.',
      action: (Role role, List<Mechant> mechants) {
        role.capacite.defense += 7;
        print('Vous avez utilisé un Gantelet de Fer. Défense augmentée de 7.');
      },
    ),
    Objet(
      nom: 'Fleur de Vie',
      description: 'Restaure 25 points de vie au joueur.',
      action: (Role role, List<Mechant> mechants) {
        role.capacite.pv += 25;
        print('Vous avez utilisé une Fleur de Vie. Points de vie restaurés : 25.');
      },
    ),
    Objet(
      nom: 'Arc Céleste',
      description: 'Augmente la vitesse du joueur de 6 points.',
      action: (Role role, List<Mechant> mechants) {
        role.capacite.vitesse += 6;
        print('Vous avez utilisé un Arc Céleste. Vitesse augmentée de 6.');
      },
    ),
    Objet(
      nom: 'Élixir de Force',
      description: 'Augmente la force du joueur de 10 points.',
      action: (Role role, List<Mechant> mechants) {
        role.capacite.force += 10;
        print('Vous avez utilisé un Élixir de Force. Force augmentée de 10.');
      },
    ),
    Objet(
      nom: 'Cape d\'Invisibilité',
      description: 'Rend le joueur invisible aux ennemis pendant 1 tour.',
      action: (Role role, List<Mechant> mechants) {
        print('Vous avez utilisé une Cape d\'Invisibilité. Vous êtes invisible pendant 1 tour.');
      },
    ),
    Objet(
      nom: 'Dague Vénéneuse',
      description: 'Empoisonne l\'ennemi, inflige 8 points de dégâts par tour pendant 3 tours.',
      action: (Role role, List<Mechant> mechants) {
        if (mechants.isNotEmpty) {
          mechants[0].capacite.pv -= 8;
          print('Vous avez utilisé une Dague Vénéneuse. Ennemi empoisonné. Dégâts infligés : 8 par tour (3 tours).');
        } else {
          print('Pas d\'ennemi à cibler.');
        }
      },
    ),
    Objet(
      nom: 'Éclat de Lumière',
      description: 'Restaure 20 points de vie au joueur.',
      action: (Role role, List<Mechant> mechants) {
        role.capacite.pv += 20;
        print('Vous avez utilisé un Éclat de Lumière. Points de vie restaurés : 20.');
      },
    ),
    Objet(
      nom: 'Lame de Feu',
      description: 'Augmente la puissance magique du joueur de 12 points.',
      action: (Role role, List<Mechant> mechants) {
        role.capacite.pm += 12;
        print('Vous avez utilisé une Lame de Feu. Puissance magique augmentée de 12.');
      },
    ),
    Objet(
      nom: 'Élixir de Défense',
      description: 'Augmente la défense du joueur de 12 points.',
      action: (Role role, List<Mechant> mechants) {
        role.capacite.defense += 12;
        print('Vous avez utilisé un Élixir de Défense. Défense augmentée de 12.');
      },
    ),
    Objet(
      nom: 'Livre des Sortilèges',
      description: 'Augmente la puissance magique du joueur de 8 points.',
      action: (Role role, List<Mechant> mechants) {
        role.capacite.pm += 8;
        print('Vous avez utilisé un Livre des Sortilèges. Puissance magique augmentée de 8.');
      },
    ),
    Objet(
      nom: 'Arc de Cristal',
      description: 'Augmente la vitesse du joueur de 4 points.',
      action: (Role role, List<Mechant> mechants) {
        role.capacite.vitesse += 4;
        print('Vous avez utilisé un Arc de Cristal. Vitesse augmentée de 4.');
      },
    ),
    Objet(
      nom: 'Éclat de Foudre',
      description: 'Inflige 15 points de dégâts à l\'ennemi.',
      action: (Role role, List<Mechant> mechants) {
        if (mechants.isNotEmpty) {
          mechants[0].capacite.pv -= 15;
          print('Vous avez utilisé un Éclat de Foudre. Ennemi touché. Dégâts infligés : 15.');
        } else {
          print('Pas d\'ennemi à cibler.');
        }
      },
    ),
    Objet(
      nom: 'Talisman de Protection',
      description: 'Augmente la défense du joueur de 10 points.',
      action: (Role role, List<Mechant> mechants) {
        role.capacite.defense += 10;
        print('Vous avez utilisé un Talisman de Protection. Défense augmentée de 10.');
      },
    ),
    Objet(
      nom: 'Potion de Mana',
      description: 'Rend 15 points de mana au joueur.',
      action: (Role role, List<Mechant> mechants) {
        role.capacite.pm += 15;
        print('Vous avez utilisé une Potion de Mana. Points de mana rendus : 15.');
      },
    ),
    Objet(
      nom: 'Épée des Vents',
      description: 'Augmente la vitesse du joueur de 8 points.',
      action: (Role role, List<Mechant> mechants) {
        role.capacite.vitesse += 8;
        print('Vous avez utilisé une Épée des Vents. Vitesse augmentée de 8.');
      },
    ),
    Objet(
      nom: 'Orbe de Glace',
      description: 'Inflige 12 points de dégâts à l\'ennemi.',
      action: (Role role, List<Mechant> mechants) {
        if (mechants.isNotEmpty) {
          mechants[0].capacite.pv -= 12;
          print('Vous avez utilisé un Orbe de Glace. Ennemi touché. Dégâts infligés : 12.');
        } else {
          print('Pas d\'ennemi à cibler.');
        }
      },
    ),
    Objet(
      nom: 'Livre de Sagesse',
      description: 'Augmente l\'endurance du joueur de 8 points.',
      action: (Role role, List<Mechant> mechants) {
        role.capacite.endurance += 8;
        print('Vous avez utilisé un Livre de Sagesse. Endurance augmentée de 8.');
      },
    ),
    Objet(
      nom: 'Grimoire des Ombres',
      description: 'Augmente la puissance magique du joueur de 10 points.',
      action: (Role role, List<Mechant> mechants) {
        role.capacite.pm += 10;
        print('Vous avez utilisé un Grimoire des Ombres. Puissance magique augmentée de 10.');
      },
    ),
    Objet(
      nom: 'Fiole d\'Énergie',
      description: 'Rend 10 points de vie et 10 points de mana au joueur.',
      action: (Role role, List<Mechant> mechants) {
        role.capacite.pv += 10;
        role.capacite.pm += 10;
        print('Vous avez utilisé une Fiole d\'Énergie. Points de vie rendus : 10. Points de mana rendus : 10.');
      },
    ),
    Objet(
      nom: 'Lame Solaire',
      description: 'Augmente la force du joueur de 15 points.',
      action: (Role role, List<Mechant> mechants) {
        role.capacite.force += 15;
        print('Vous avez utilisé une Lame Solaire. Force augmentée de 15.');
      },
    ),
    Objet(
      nom: 'Anneau de Rapidité',
      description: 'Augmente la vitesse du joueur de 5 points.',
      action: (Role role, List<Mechant> mechants) {
        role.capacite.vitesse += 5;
        print('Vous avez utilisé un Anneau de Rapidité. Vitesse augmentée de 5.');
      },
    ),
    Objet(
      nom: 'Pierre de Résistance',
      description: 'Augmente la résistance du joueur de 10 points.',
      action: (Role role, List<Mechant> mechants) {
        role.capacite.defense += 10;
        print('Vous avez utilisé une Pierre de Résistance. Résistance augmentée de 10.');
      },
    ),
    Objet(
      nom: 'Glaive des Abysses',
      description: 'Augmente la puissance magique du joueur de 15 points.',
      action: (Role role, List<Mechant> mechants) {
        role.capacite.pm += 15;
        print('Vous avez utilisé un Glaive des Abysses. Puissance magique augmentée de 15.');
      },
    ),
    Objet(
      nom: 'Éclat de Terre',
      description: 'Inflige 18 points de dégâts à l\'ennemi.',
      action: (Role role, List<Mechant> mechants) {
        if (mechants.isNotEmpty) {
          mechants[0].capacite.pv -= 18;
          print('Vous avez utilisé un Éclat de Terre. Ennemi touché. Dégâts infligés : 18.');
        } else {
          print('Pas d\'ennemi à cibler.');
        }
      },
    ),
    Objet(
      nom: 'Collier de Vitalité',
      description: 'Augmente les points de vie maximum du joueur de 30.',
      action: (Role role, List<Mechant> mechants) {
        role.capacite.pv += 30;
        print('Vous avez utilisé un Collier de Vitalité. Points de vie maximum augmentés de 30.');
      },
    ),
    Objet(
      nom: 'Fiole de Guérison',
      description: 'Rend 30 points de vie au joueur.',
      action: (Role role, List<Mechant> mechants) {
        role.capacite.pv += 30;
        print('Vous avez utilisé une Fiole de Guérison. Points de vie rendus : 30.');
      },
    ),
    Objet(
      nom: 'Orbe Céleste',
      description: 'Augmente la puissance magique du joueur de 20 points.',
      action: (Role role, List<Mechant> mechants) {
        role.capacite.pm += 20;
        print('Vous avez utilisé un Orbe Céleste. Puissance magique augmentée de 20.');
      },
    ),
    Objet(
      nom: 'Bague de Protection',
      description: 'Augmente la défense du joueur de 15 points.',
      action: (Role role, List<Mechant> mechants) {
        role.capacite.defense += 15;
        print('Vous avez utilisé une Bague de Protection. Défense augmentée de 15.');
      },
    ),
    Objet(
      nom: 'Flèche Explosive',
      description: 'Inflige 25 points de dégâts à l\'ennemi.',
      action: (Role role, List<Mechant> mechants) {
        if (mechants.isNotEmpty) {
          mechants[0].capacite.pv -= 25;
          print('Vous avez utilisé une Flèche Explosive. Ennemi touché. Dégâts infligés : 25.');
        } else {
          print('Pas d\'ennemi à cibler.');
        }
      },
    ),
  ];
}

