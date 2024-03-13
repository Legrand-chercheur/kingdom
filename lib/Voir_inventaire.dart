import 'package:flutter/material.dart';
import 'Inventaire.dart';
import 'Objets.dart';

class InventaireScreen extends StatelessWidget {
  final Inventaire inventaire;

  InventaireScreen({required this.inventaire});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventaire'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            inventaire.objets.isEmpty
                ? Text('Aucun objet dans ton inventaire')
                : Expanded(
              child: ListView.builder(
                itemCount: inventaire.objets.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> objet = inventaire.objets[index];
                  return Card(
                    child: ListTile(
                      title: Text('${objet["nom"]}'),
                      subtitle: Text('Quantité: ${objet["quantite"]}'),
                      onTap: () {
                        // Afficher le détail de l'objet
                        _afficherDetailObjet(context, objet);
                      },
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

  void _afficherDetailObjet(BuildContext context, Map<String, dynamic> objet) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text(objet["nom"])),
          content: Container(
            width: 200,
            height: 200,
            child: Column(
              children: [
                Text('Description: ${objet["description"]}'),
                SizedBox(height: 10),
                Text('Quantité: ${objet["quantite"]}'),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                // Logique pour utiliser l'objet
                _utiliserObjet(objet);
                Navigator.pop(context); // Fermer la boîte de dialogue
              },
              child: Text('Utiliser'),
            ),
            ElevatedButton(
              onPressed: () {
                // Logique pour laisser l'objet
                _laisserObjet(objet);
                Navigator.pop(context); // Fermer la boîte de dialogue
              },
              child: Text('Laisser'),
            ),
          ],
        );
      },
    );
  }

  void _utiliserObjet(Map<String, dynamic> objet) {
    // Logique pour utiliser l'objet
    // ...
  }

  void _laisserObjet(Map<String, dynamic> objet) {
    // Logique pour laisser l'objet
    // ...
  }
}

