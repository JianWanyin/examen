import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageGridScreen(),
    );
  }
}

class ImageGridScreen extends StatelessWidget {
  // Lista de URLs de imágenes (reemplaza con tus URLs reales).
  final List<String> imageUrls = [
    'https://img.freepik.com/foto-gratis/banner-halloween-mano-espeluznante_23-2149595967.jpg?ga=GA1.1.1363326330.1710356592&semt=ais_hybrids',
    'https://img.freepik.com/foto-gratis/varios-espeluznantes-tallados-calabazas-halloween_23-2149495155.jpg?ga=GA1.1.1363326330.1710356592&semt=ais_hybrid',
    'https://img.freepik.com/foto-gratis/paisaje-halloween-calabaza-estilo-oscuro_23-2151827615.jpg?ga=GA1.1.1363326330.1710356592&semt=ais_hybrid',
    'https://img.freepik.com/foto-gratis/paisaje-halloween-calabaza-estilo-oscuro_23-2151827522.jpg?ga=GA1.1.1363326330.1710356592&semt=ais_hybrid',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZdtXk92QMLzkgsJ_c_M8kV6ZjAz4-PCaEew&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_8fT4ZVgPzjpxTgE_gDD9zaR_h7TfLQxPQA&s',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 221, 214, 214), 
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 208, 177, 198), 
        title: Text('Galería de Imágenes de Halloween'),
      ),
      body: Container(
        color: const Color.fromARGB(255, 95, 7, 36), 
        child: OrientationBuilder(
          builder: (context, orientation) {
            return GridView.count(
              crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
              mainAxisSpacing: 12.0, // Espacio vertical entre las imágenes
              crossAxisSpacing: 12.0, // Espacio horizontal entre las imágenes
              children: List.generate(imageUrls.length, (index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FullScreenImageScreen(
                          imageUrl: imageUrls[index],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(8.0),
                    child: Image.network(
                      imageUrls[index],
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: const Color.fromARGB(255, 249, 241, 241),
                          child: Center(
                            child: Icon(Icons.error, color: Colors.red),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}

class FullScreenImageScreen extends StatelessWidget {
  final String imageUrl;

  FullScreenImageScreen({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Center(
          child: Image.network(
            imageUrl,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey,
                child: Center(
                  child: Icon(Icons.error, color: Colors.red, size: 50),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
