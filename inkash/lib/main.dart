import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inkash',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 0, 0)),
        scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      home: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: const [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Hola Emerson', style: TextStyle(color: Colors.white)), Text('Julio 2026', style: TextStyle(color: Colors.white))],
              ),
              SizedBox(height: 22),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text('TE QUEDAN DISPONIBLES', style: TextStyle(fontSize: 11, color: Colors.white)),
                  SizedBox(height: 6),
                  Text('Q2,796.50', style: TextStyle(fontSize: 52, color: Colors.white)),
                  SizedBox(height: 16),
                  LinearProgressIndicator(value: 0.57),
                  SizedBox(height: 7),
                  Text(
                    'Has usado Q3,703.50 de Q6,500.00',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 22),
              Row(
                children:[
                  Expanded(child: Card1()),
                  SizedBox(width: 16),
                  Expanded(child: Card2())
                ]
              ),
              SizedBox(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Text('Últimos movimientos', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                  Text('Ver todos', style: TextStyle(fontSize: 14, color: Color.fromARGB(255, 65, 219, 14)))

                ]
              )

            ],
          ),
        ),
      ),
    );
  }
}


class Card1 extends StatelessWidget {
  const Card1({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
            
              title: Text('Cuentas'),
              subtitle: Text('Q7,810.00'),
            ),
           
          ],
        ),
      ),
    );
  }
}

class Card2 extends StatelessWidget {
  const Card2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
            
              title: Text('Metas de ahorro'),
              subtitle: Text('3 activas'),
            ),
           
          ],
        ),
      ),
    );
  }
}