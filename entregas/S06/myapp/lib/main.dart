import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi APP',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: const Color.fromARGB(206, 10, 165, 212),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.notifications_outlined),
                    onPressed: () {},
                  ),
                  IconButton(icon: const Icon(Icons.home), onPressed: () {}),
                  IconButton(icon: const Icon(Icons.person), onPressed: () {}),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '¡Hola Emerson!',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Favoritos',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),

                  routesFavoriteCard("B1", "Ruta 3", "9:30 PM"),
                  routesFavoriteCard("C2", "Ruta 4", "10:45 AM"),
                  routesFavoriteCard("D3", "Ruta 5", "11:00 AM"),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar Ruta o Estación',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget routesFavoriteCard(String id, String route, String time) {
    return Card(
      child: ListTile(
        leading: Text(id),
        title: Text(route),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(time),
            const SizedBox(width: 8),
            TextButton(onPressed: () {}, child: const Text('Ver')),
          ],
        ),
      ),
    );
  }
}
