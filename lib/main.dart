import 'dart:math';
import 'package:flutter/material.dart';
import 'package:kingdom/roleJoueur.dart';
import 'Armes.dart';
import 'Capacite.dart';
import 'CombatMessage.dart';
import 'Inventaire.dart';
import 'Joueur.dart';
import 'ListeObjets.dart';
import 'Magie.dart';
import 'Mechant.dart';
import 'Objets.dart';
import 'Voir_inventaire.dart';
import 'jauge_joueur.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyApps(),
    );
  }
}

class CombatScreen extends StatefulWidget {
  final Role joueur;

  final Inventaire joueurInventaire;

  final List<Mechant> mechants;
  List<Mechant> mechantsAuCombat = [];
  void addCombatMessage(String message, Color couleur) {
      List<CombatMessage> combatMessages = [];
      // Implémentez la logique pour ajouter le message au combat
      combatMessages.add(CombatMessage(text: message, color: couleur));

  }
  CombatScreen({
    required this.joueur,
    required this.mechants,
    required this.joueurInventaire,
  }) {
    // Stockez les valeurs initiales des méchants au début du combat
    for (Mechant mechant in mechants) {
      mechantsAuCombat.add(Mechant(
        nom: mechant.nom,
        capacite: CapaciteMechant(
          pv: mechant.capacite.pv,
          pm: mechant.capacite.pm,
          force: mechant.capacite.force,
          agilite: mechant.capacite.agilite,
          defense: mechant.capacite.defense,
          endurance: mechant.capacite.endurance,
          vitesse: mechant.capacite.vitesse,
        ),
        expDonnee: mechant.expDonnee,
        asset: mechant.asset,
      ));
    }
  }

  @override
  State<CombatScreen> createState() => _CombatScreenState();
}

class _CombatScreenState extends State<CombatScreen> {
  List<CombatMessage> combatMessages = [];
  void addCombatMessage(String message, Color couleur) {
    setState(() {
      combatMessages.add(CombatMessage(text: message, color: couleur));
    });
  }
  void apresVictoire() {
// Dans votre classe MyApps, vous pouvez définir la liste d'objetsDisponibles
    List<Objet> objetsDisponibles = genererObjets();

    Objet objetGagne = widget.joueurInventaire.obtenirObjetAleatoire(objetsDisponibles);
    widget.joueurInventaire.ajouterObjet(objetGagne);
    print(widget.joueurInventaire.objets);
    Navigator.pop(context);
  }

  List<Magie> sortsDisponibles = [
    Magie(
      nom: 'Soin Léger',
      type: 'soins',
      coutMana: 10,
      effetSurJoueur: EffetSurJoueur(soins: 20, defense: 0),
      effetSurMechant: EffetSurMechant(degats: 0, affliction: 0),
    ),
    Magie(
      nom: 'Soin Rapide',
      type: 'soins',
      coutMana: 15,
      effetSurJoueur: EffetSurJoueur(soins: 30, defense: 0),
      effetSurMechant: EffetSurMechant(degats: 0, affliction: 0),
    ),
    Magie(
      nom: 'Barrière Magique',
      type: 'défense',
      coutMana: 20,
      effetSurJoueur: EffetSurJoueur(soins: 0, defense: 15),
      effetSurMechant: EffetSurMechant(degats: 0, affliction: 0),
    ),
    Magie(
      nom: 'Mur de Feu',
      type: 'attaque',
      coutMana: 25,
      effetSurJoueur: EffetSurJoueur(soins: 0, defense: 0),
      effetSurMechant: EffetSurMechant(degats: 40, affliction: 0),
    ),
    Magie(
      nom: 'Projectile Glacial',
      type: 'attaque',
      coutMana: 20,
      effetSurJoueur: EffetSurJoueur(soins: 0, defense: 0),
      effetSurMechant: EffetSurMechant(degats: 35, affliction: 0),
    ),
    Magie(
      nom: 'Protection Céleste',
      type: 'défense',
      coutMana: 18,
      effetSurJoueur: EffetSurJoueur(soins: 0, defense: 12),
      effetSurMechant: EffetSurMechant(degats: 0, affliction: 0),
    ),
    Magie(
      nom: 'Éclair Sismique',
      type: 'attaque',
      coutMana: 30,
      effetSurJoueur: EffetSurJoueur(soins: 0, defense: 0),
      effetSurMechant: EffetSurMechant(degats: 50, affliction: 0),
    ),
    Magie(
      nom: 'Régénération Vitale',
      type: 'soins',
      coutMana: 25,
      effetSurJoueur: EffetSurJoueur(soins: 40, defense: 0),
      effetSurMechant: EffetSurMechant(degats: 0, affliction: 0),
    ),
    Magie(
      nom: 'Armure d\'Ébène',
      type: 'défense',
      coutMana: 22,
      effetSurJoueur: EffetSurJoueur(soins: 0, defense: 18),
      effetSurMechant: EffetSurMechant(degats: 0, affliction: 0),
    ),
    Magie(
      nom: 'Explosion Astrale',
      type: 'attaque',
      coutMana: 35,
      effetSurJoueur: EffetSurJoueur(soins: 0, defense: 0),
      effetSurMechant: EffetSurMechant(degats: 60, affliction: 0),
    ),
    Magie(
      nom: 'Fleur de Vie',
      type: 'soins',
      coutMana: 28,
      effetSurJoueur: EffetSurJoueur(soins: 50, defense: 0),
      effetSurMechant: EffetSurMechant(degats: 0, affliction: 0),
    ),
    Magie(
      nom: 'Muraille de Cristal',
      type: 'défense',
      coutMana: 24,
      effetSurJoueur: EffetSurJoueur(soins: 0, defense: 25),
      effetSurMechant: EffetSurMechant(degats: 0, affliction: 0),
    ),
    Magie(
      nom: 'Tempête de Foudre',
      type: 'attaque',
      coutMana: 40,
      effetSurJoueur: EffetSurJoueur(soins: 0, defense: 0),
      effetSurMechant: EffetSurMechant(degats: 70, affliction: 0),
    ),
    Magie(
      nom: 'Guérison Céleste',
      type: 'soins',
      coutMana: 32,
      effetSurJoueur: EffetSurJoueur(soins: 60, defense: 0),
      effetSurMechant: EffetSurMechant(degats: 0, affliction: 0),
    ),
    Magie(
      nom: 'Éruption Infernale',
      type: 'attaque',
      coutMana: 45,
      effetSurJoueur: EffetSurJoueur(soins: 0, defense: 0),
      effetSurMechant: EffetSurMechant(degats: 80, affliction: 0),
    ),
  ];
  String text_combat = "";

  @override
  Widget build(BuildContext context) {

    int pvInitial = RoleData.roles.first.capacite.pv;
    int pmInitial = 0;
    if (pmInitial > 0) {
      pmInitial = RoleData.roles.first.capacite.pm;
    } else {
      pmInitial = 1;
    }

    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        title: Text('Combat'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width/1.05,
              height: MediaQuery.of(context).size.height/5,
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5,),
                        Text(
                          '${widget.joueur.roleName}',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 8,),
                        JaugePVPM(pv: widget.joueur.capacite.pv, pvInitial: pvInitial, pm: widget.joueur.capacite.pm, pmInitial: pmInitial),
                        SizedBox(height: 8,),
                        Text('Nv: ${widget.joueur.niveau}',style: TextStyle(fontSize: 14),)
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/1.78,
                    height: MediaQuery.of(context).size.height/5.5,
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Logique pour attaquer
                                setState(() {
                                  if (widget.mechantsAuCombat.isNotEmpty) {
                                    widget.joueur.attaquer(widget.mechantsAuCombat[0]); // Attaque le premier méchant

                                    if (widget.mechantsAuCombat[0].capacite.pv <= 0) {
                                      int expGagnee = widget.mechantsAuCombat[0].expDonnee;
                                      widget.addCombatMessage('Le méchant ${widget.mechantsAuCombat[0].nom} est vaincu.', Colors.white);
                                      widget.joueur.exp += expGagnee;
                                      // Réinitialise les points de vie et de mana du méchant vaincu
                                      widget.mechantsAuCombat[0].capacite.pv = mechants[0].capacite.pv;
                                      widget.mechantsAuCombat[0].capacite.pm = mechants[0].capacite.pm;

                                      widget.mechantsAuCombat.removeAt(0); // Retire le méchant vaincu de la liste

                                      if (widget.mechantsAuCombat.isNotEmpty) {
                                        // Attaque le méchant suivant
                                        widget.joueur.attaquer(widget.mechantsAuCombat[0]);
                                      } else {
                                        widget.addCombatMessage('Tous les méchants ont été vaincus.',Colors.white) ;
                                        widget.addCombatMessage('Experience gagné: $expGagnee',Colors.white) ;
                                        // Ajouter un objet dans l'inventaire du joueur après la victoire
                                        apresVictoire();
                                        widget.joueur.levelUp(context);
                                      }
                                    } else if (widget.joueur.capacite.pv <= 0) {
                                      widget.addCombatMessage('Vous êtes mort. Fin du combat.',Colors.white);
                                      // Réinitialisez les points de vie et de mana du joueur
                                      widget.joueur.capacite.pv = widget.joueur.capacite.pv;
                                      widget.joueur.capacite.pm = widget.joueur.capacite.pv;
                                      // Vous pouvez ajouter d'autres logiques de fin de combat ici si nécessaire
                                      Navigator.pop(context, true); // Informez la page précédente que le joueur est mort
                                    }
                                  }
                                });
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5), // Ajustez le rayon selon vos besoins
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                minimumSize: MaterialStateProperty.all<Size>(Size(50, 40)),
                              ),
                              child: Text('Attaquer'),
                            ),
                            SizedBox(width: 5,),
                            ElevatedButton(
                              onPressed: () {
                                widget.joueur.desactiverModeDefense();
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5), // Ajustez le rayon selon vos besoins
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                minimumSize: MaterialStateProperty.all<Size>(Size(50, 40)),
                              ),
                              child: Text('Defendre'),
                            ),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                _afficherListeSortsDisponibles(context);
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                minimumSize: MaterialStateProperty.all<Size>(Size(100, 40)),
                              ),
                              child: Text('Sortilège'),
                            ),
                            SizedBox(width: 5,),
                            ElevatedButton(
                              onPressed: () {
                                // Logique pour attaquer
                                setState(() {
                                  widget.joueur.fuir(context);
                                });
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5), // Ajustez le rayon selon vos besoins
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                minimumSize: MaterialStateProperty.all<Size>(Size(100, 40)),
                              ),
                              child: Text('Fuir'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width/1.05,
              height: MediaQuery.of(context).size.height/3,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/dungeon-door-preview.png'),
                    fit: BoxFit.cover
                )
              ),
              child: ListView.builder(
                itemCount: widget.mechantsAuCombat.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Mechant mechant = widget.mechantsAuCombat[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 110,
                      width: 110,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 30,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius: BorderRadius.circular(3),
                                  border: Border.all(color: Colors.white)
                                ),
                                child: Center(
                                  child: Text(
                                    '${mechant.nom}',
                                    style: TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('images/${mechant.asset}'),
                                        fit: BoxFit.contain
                                    )
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width / 1.05,
              height: MediaQuery.of(context).size.height / 4,
              decoration: BoxDecoration(
                color: Color.fromRGBO(160, 128, 96, 1),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.white,
                  width: 1.5,
                ),
              ),
              child: ListView.builder(
                itemCount: combatMessages.length,
                itemBuilder: (context, index) {
                  CombatMessage message = combatMessages[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      message.text,
                      style: TextStyle(
                        color: message.color,
                        fontSize: 16,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _afficherListeSortsDisponibles(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Liste des Sortilèges Disponibles'),
          content: Container(
            height: 300, // Ajustez la hauteur selon vos besoins
            width: 200, // Ajustez la largeur selon vos besoins
            child: ListView.builder(
              itemCount: sortsDisponibles.length,
              itemBuilder: (context, index) {
                Magie sort = sortsDisponibles[index];
                return ListTile(
                  title: Text(sort.nom),
                  subtitle: Text('Type: ${sort.type}, Coût Mana: ${sort.coutMana}'),
                  onTap: () {
                    setState(() {
                      if (widget.mechantsAuCombat.isNotEmpty) {
                        widget.joueur.utiliserSort(sort, widget.mechantsAuCombat);
                        Navigator.pop(context); // Fermer la boîte de dialogue// Reste de votre logique ici...
                      }
                    });
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }


}


List<Mechant> mechants = [
  Mechant(
    nom: 'Dragon Rouge',
    capacite: CapaciteMechant(
      pv: 50,
      pm: 10,
      force: 20,
      agilite: 10,
      defense: 15,
      endurance: 5,
      vitesse: 8,
    ),
    expDonnee: 100,
    asset: 'Dragon Rouge.png',
  ),
  Mechant(
    nom: 'Sorcier Sombre',
    capacite: CapaciteMechant(
      pv: 35,
      pm: 20,
      force: 15,
      agilite: 12,
      defense: 10,
      endurance: 3,
      vitesse: 6,
    ),
    expDonnee: 80,
    asset: 'Sorcier.png',
  ),
  Mechant(
    nom: 'Gobelin Furtif',
    capacite: CapaciteMechant(
      pv: 20,
      pm: 5,
      force: 8,
      agilite: 15,
      defense: 8,
      endurance: 2,
      vitesse: 10,
    ),
    expDonnee: 40,
    asset: 'Gobelin Furtif.png',
  ),
  Mechant(
    nom: 'Ogre Brutal',
    capacite: CapaciteMechant(
      pv: 60,
      pm: 0,
      force: 25,
      agilite: 5,
      defense: 20,
      endurance: 8,
      vitesse: 4,
    ),
    expDonnee: 120,
    asset: 'Ogre Brutale.png',
  ),
  Mechant(
    nom: 'Liche Sombre',
    capacite: CapaciteMechant(
      pv: 40,
      pm: 25,
      force: 18,
      agilite: 8,
      defense: 12,
      endurance: 5,
      vitesse: 7,
    ),
    expDonnee: 90,
    asset: 'Liche.png',
  ),
  Mechant(
    nom: 'Banshee Maudite',
    capacite: CapaciteMechant(
      pv: 30,
      pm: 15,
      force: 12,
      agilite: 10,
      defense: 10,
      endurance: 3,
      vitesse: 9,
    ),
    expDonnee: 60,
    asset: 'Banshee.png',
  ),
  Mechant(
    nom: 'Chevalier Corrompu',
    capacite: CapaciteMechant(
      pv: 45,
      pm: 5,
      force: 22,
      agilite: 6,
      defense: 18,
      endurance: 4,
      vitesse: 6,
    ),
    expDonnee: 80,
    asset: 'Corrompu.png',
  ),
  Mechant(
    nom: 'Hydre Infernale',
    capacite: CapaciteMechant(
      pv: 70,
      pm: 10,
      force: 28,
      agilite: 7,
      defense: 22,
      endurance: 6,
      vitesse: 5,
    ),
    expDonnee: 150,
    asset: 'Hydre.png',
  ),
  Mechant(
    nom: 'Chimère Malfaisante',
    capacite: CapaciteMechant(
      pv: 55,
      pm: 15,
      force: 25,
      agilite: 9,
      defense: 16,
      endurance: 7,
      vitesse: 8,
    ),
    expDonnee: 110,
    asset: 'Chimere.png',
  ),
  Mechant(
    nom: 'Gardien des Ombres',
    capacite: CapaciteMechant(
      pv: 40,
      pm: 20,
      force: 15,
      agilite: 12,
      defense: 14,
      endurance: 5,
      vitesse: 6,
    ),
    expDonnee: 70,
    asset: 'gardien.png',
  ),
];

class MyApps extends StatefulWidget {
  const MyApps({super.key});

  @override
  State<MyApps> createState() => _MyAppsState();
}

class _MyAppsState extends State<MyApps> {

  Role vagabond = Role(
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
    expNiveauSuivant: 0,
    asset: 'vagabond.png',
    addCombatMessage: (String message, Color couleur) {  },
  );

  late Inventaire joueurIventaire = Inventaire();
  Role joueurRole = RoleData.roles.first;

  @override
  Widget build(BuildContext context) {
    // Récupérer les valeurs initiales de PV et PM à partir de RoleData
    int pvInitial = RoleData.roles.first.capacite.pv;
    int pmInitial = 0;
    if (pmInitial > 0) {
      pmInitial = RoleData.roles.first.capacite.pm;
    } else {
      pmInitial = 1;
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[500],
        appBar: AppBar(
          title: Text('Mini Jeu'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30,),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width/1.04,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        child: Column(
                          children: [
                            Text(
                              '${vagabond.roleName} (Niveau: ${vagabond.niveau})',
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(height: 20),
                            JaugePVPM(pv: vagabond.capacite.pv, pvInitial: pvInitial, pm: vagabond.capacite.pm, pmInitial: pmInitial),
                            SizedBox(height: 10),
                            Text(
                              'Arme: ${vagabond.arme.nomArme}',
                              style: TextStyle(fontSize: 10),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Niveau suivant après: ${vagabond.expNiveauSuivant} exp',
                              style: TextStyle(fontSize: 9),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 160,
                        height: 170,
                        decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: Image.asset("images/${vagabond.asset}"),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 120,),
            Container(
              width: MediaQuery.of(context).size.width/1.2,
              height: MediaQuery.of(context).size.height/2.5,
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width/1.3,
                  height: MediaQuery.of(context).size.height/2.7,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5), // Ajustez le rayon selon vos besoins
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          minimumSize: MaterialStateProperty.all<Size>(Size(200, 50)),
                        ),
                        onPressed: () async{
                          // Générez un nombre aléatoire de méchants (entre 1 et 2)
                          Random random = Random();
                          int nombreDeMechants = random.nextInt(3) + 1;
                          // Sélectionnez le nombre aléatoire de méchants pour le combat
                          List<Mechant> mechantsAuCombat = [];
                          for (int i = 0; i < nombreDeMechants && i < mechants.length; i++) {
                            int choixMechant = random.nextInt(mechants.length);
                            mechantsAuCombat.add(mechants[choixMechant]);
                          }

                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CombatScreen(
                                joueur: vagabond,
                                mechants: mechantsAuCombat,
                                joueurInventaire: joueurIventaire,
                              ),
                            ),
                          );

                          // Ce bloc sera exécuté après le retour de la page de combat
                          // Rafraîchir les données du joueur
                          setState(() {});
                        },
                        child: Text('Commencer le combat'),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Logique pour assigner une arme
                          _afficherListeArmesDisponibles(context);
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5), // Ajustez le rayon selon vos besoins
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          minimumSize: MaterialStateProperty.all<Size>(Size(200, 50)),
                        ),
                        child: Text('Assigner Arme'),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>InventaireScreen(inventaire: joueurIventaire,)));
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5), // Ajustez le rayon selon vos besoins
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          minimumSize: MaterialStateProperty.all<Size>(Size(200, 50)),
                        ),
                        child: Text('Voir l\'inventaire'),
                      ),
                    ],
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }

  List<Arme> armesMedievalesFantastiques = [
    Arme(force: 0, agilite: 0, vitesse: 0, nomArme: 'Main nue'),
    Arme(force: 2, agilite: 1, vitesse: 3, nomArme: 'Dague Émoussée'),
    Arme(force: 4, agilite: 2, vitesse: 2, nomArme: 'Épée de Bois'),
    Arme(force: 6, agilite: 3, vitesse: 4, nomArme: 'Lame de Cristal'),
    Arme(force: 8, agilite: 1, vitesse: 2, nomArme: 'Hache Rouillée'),
    Arme(force: 5, agilite: 4, vitesse: 3, nomArme: 'Lance Brisée'),
    Arme(force: 10, agilite: 5, vitesse: 6, nomArme: 'Glaive d\'Ombre'),
    Arme(force: 7, agilite: 6, vitesse: 4, nomArme: 'Arc Élémentaire'),
    Arme(force: 12, agilite: 3, vitesse: 2, nomArme: 'Marteau de Guerre'),
    Arme(force: 15, agilite: 8, vitesse: 7, nomArme: 'Lame du Dragon'),
    Arme(force: 18, agilite: 10, vitesse: 8, nomArme: 'Épée Excalibur'),
    Arme(force: 20, agilite: 5, vitesse: 5, nomArme: 'Marteau Divin'),
    Arme(force: 25, agilite: 12, vitesse: 10, nomArme: 'Lame d\'Éternité'),
  ];
  void _afficherListeArmesDisponibles(BuildContext context) {
    // Afficher la liste des armes disponibles et logique pour assigner une arme
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Liste des Armes Disponibles'),
          content: Container(
            height: 400, // Spécifiez une hauteur appropriée
            width: 300, // Spécifiez une largeur appropriée
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: armesMedievalesFantastiques.length,
              itemBuilder: (context, index) {
                Arme arme = armesMedievalesFantastiques[index];
                return ListTile(
                  title: Text(arme.nomArme),
                  onTap: () {
                    // Logique pour assigner l'arme sélectionnée au joueur
                    setState(() {
                      vagabond.equiperArme(arme);
                    });
                    Navigator.pop(context); // Fermer la boîte de dialogue
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}

