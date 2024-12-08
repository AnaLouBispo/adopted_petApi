import 'package:adopted_pet/widget/infoContainer.dart';
import 'package:adopted_pet/widget/cardPet.dart';
import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> favoritePets = [
      {
        'name': 'Amber',
        'age': '3 anos',
        'imageUrl': 'https://via.placeholder.com/150',
      },
      {
        'name': 'Buddy',
        'age': '2 anos',
        'imageUrl': 'https://via.placeholder.com/150',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 183, 74),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Infocontainer(text: 'Cats', borderColor: Colors.blueAccent),
                Infocontainer(text: 'Dogs', borderColor: Colors.blueAccent),
                Infocontainer(text: 'Birds', borderColor: Colors.blueAccent),
                Infocontainer(text: 'Fishes', borderColor: Colors.blueAccent),
                Infocontainer(text: 'More..', borderColor: Colors.blueAccent),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: favoritePets.length,
                itemBuilder: (context, index) {
                  final pet = favoritePets[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: PetContainer(
                      petName: pet['name']!,
                      petAge: pet['age']!,
                      imageUrl: pet['imageUrl']!,
                      backgroundColor: Colors.orangeAccent.shade100,
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
}
