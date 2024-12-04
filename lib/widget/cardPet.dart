import 'package:flutter/material.dart';
import 'package:adopted_pet/view/pet_info.dart'; // Para a navegação

class PetContainer extends StatelessWidget {
  final String petName;
  final String petAge;
  final String imageUrl;
  final Color backgroundColor;

  const PetContainer({
    super.key,
    required this.petName,
    required this.petAge,
    required this.imageUrl,
    required this.backgroundColor,
  });

  void navigateToPetInfo(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PetInfo(
          petName: petName,
          petAge: petAge,
          imageUrl: imageUrl,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigateToPetInfo(context),
      child: Container(
        width: 180,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(imageUrl), // Usando o URL da imagem
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 10,
              right: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 248, 141, 69)),
                onPressed: () {
                  navigateToPetInfo(context); // Navega para a tela de detalhes
                },
                child: Text(
                  petName, // Exibe o nome do pet no botão
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 20,
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 15,
                  ),
                  Text("Distance (5km)"), // Informação fictícia de distância
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}