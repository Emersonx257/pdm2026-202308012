import 'package:flutter/material.dart';

void main() {
  runApp(const Marcador());
}

class Marcador extends StatelessWidget {
  const Marcador({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marcador',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const MarcadorHomePage(),
    );
  }
}

class MarcadorHomePage extends StatefulWidget {
  const MarcadorHomePage({super.key});

  @override
  State<MarcadorHomePage> createState() => _MarcadorHomePageState();
}

class _MarcadorHomePageState extends State<MarcadorHomePage> {
  int _puntosLocal = 0;
  int _puntosVisitante = 0;

  String get _estadoPartido {
    if (_puntosLocal > _puntosVisitante) {
      return 'Local va ganando';
    } else if (_puntosVisitante > _puntosLocal) {
      return 'Visitante va ganando';
    } else {
      return 'Empate';
    }
  }

  void _modificarLocal(int valor) {
    setState(() {
      final nuevo = _puntosLocal + valor;
      _puntosLocal = nuevo < 0 ? 0 : nuevo;
    });
  }

  void _modificarVisitante(int valor) {
    setState(() {
      final nuevo = _puntosVisitante + valor;
      _puntosVisitante = nuevo < 0 ? 0 : nuevo;
    });
  }

  @override
  Widget build(BuildContext context) {
    final localGana = _puntosLocal > _puntosVisitante;
    final visitanteGana = _puntosVisitante > _puntosLocal;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Marcador'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    _estadoPartido,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: _buildPanelEquipo(
                        nombre: 'Local',
                        puntos: _puntosLocal,
                        esGanador: localGana,
                        onRestar: () => _modificarLocal(-1),
                        onSumar: () => _modificarLocal(1),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildPanelEquipo(
                        nombre: 'Visitante',
                        puntos: _puntosVisitante,
                        esGanador: visitanteGana,
                        onRestar: () => _modificarVisitante(-1),
                        onSumar: () => _modificarVisitante(1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPanelEquipo({
    required String nombre,
    required int puntos,
    required bool esGanador,
    required VoidCallback onRestar,
    required VoidCallback onSumar,
  }) {
    return Card(
      color: esGanador ? const Color.fromARGB(255, 82, 237, 87) : null,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              nombre,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              '$puntos',
              style: const TextStyle(fontSize: 56, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(
                  onPressed: onRestar,
                  child: const Text(
                    '-',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 12),
                FilledButton(
                  onPressed: onSumar,
                  child: const Text(
                    '+',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
