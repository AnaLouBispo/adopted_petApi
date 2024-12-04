import 'package:adopted_pet/view/add_pet.dart';
import 'package:adopted_pet/view/favorite.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 183, 74),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
         Center(
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/profile.png',
                    fit: BoxFit.cover,
                    width: 120,
                    height: 120,
                  ),
                ),        
              ),
            ),
            
            SizedBox(height: 16),
            Text(
              'AnaBeaGameplays',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'lover cat.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                   Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPet()),
          );
                  },
                  child: Text('Add Pet'),
                ),
                ElevatedButton(
                  onPressed: () {
                   Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Favorite()),
          );
                  },
                  child: Text('Favorites'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
