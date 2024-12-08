import 'package:adopted_pet/view/user_profile.dart';
import 'package:adopted_pet/widget/button_category.dart';
import 'package:adopted_pet/widget/cardPet.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> pets = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPets();
  }

  Future<void> fetchPets() async {
    try {
      final response = await http.get(
        Uri.parse('https://pet-adopt-dq32j.ondigitalocean.app/pet/pets'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['pets'] != null && data['pets'] is List) {
          setState(() {
            pets = data['pets'];
            isLoading = false;
          });
        } else {
          throw Exception('Resposta da API não contém o campo "pets".');
        }
      } else {
        throw Exception('Erro ao buscar dados: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao buscar pets: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  String getFirstImage(dynamic images) {
    if (images is List && images.isNotEmpty) {
      return images[0];
    }
    return 'https://via.placeholder.com/150';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orangeAccent,
        title: Text(
          'Welcome to PetHome 🐾',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueAccent,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/bannerContainer.png'),
                  ),
                ),
                child: const Stack(
                  children: [
                    Positioned(
                      bottom: 15,
                      left: 20,
                      child: Text(
                        "Find Your Perfect Pet Companion!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  Spacer(),
                  Text(
                    "View All",
                    style: TextStyle(
                      color: Colors.orangeAccent,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.orangeAccent,
                    size: 18,
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  categoryButton("Cats", color: Colors.pinkAccent),
                  categoryButton("Dogs", color: Colors.orangeAccent),
                  categoryButton("Birds", color: Colors.blueAccent),
                  categoryButton("Fishes", color: Colors.lightBlueAccent),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.orangeAccent,
                      ),
                    )
                  : pets.isEmpty
                      ? Center(
                          child: Text(
                            'No pets available. 🐶',
                            style: TextStyle(fontSize: 18),
                          ),
                        )
                      : GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                          ),
                          itemCount: pets.length,
                          itemBuilder: (context, index) {
                            final pet = pets[index];
                            return PetContainer(
                              petName: pet['name'] ?? 'Unknown',
                              petAge: pet['age'] != null
                                  ? '${pet['age']} months'
                                  : 'Age unknown',
                              imageUrl: getFirstImage(pet['images']),
                              backgroundColor: Colors.orangeAccent.shade100,
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Profile()),
          );
        },
        backgroundColor: Colors.orangeAccent,
        icon: Icon(Icons.person),
        label: Text("Profile"),
      ),
    );
  }
}
