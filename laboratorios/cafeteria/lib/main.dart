import 'package:flutter/material.dart';

void main() {
  final double totalPedido = 0.0;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: Scaffold(
        appBar: AppBar(title: const Text('Pedido de Productos')),
        body: ListView(
          children: [
            ProductoPedido(producto: 'Cafe', precio: 10.0),
            ProductoPedido(producto: 'Sandwicht', precio: 25.0),
            ProductoPedido(producto: 'Jugo', precio: 12.0),

            Text('Total Pedido: Q. '),
          ],
        ),
      ),
    );
  }
}

class ProductoPedido extends StatefulWidget {
  const ProductoPedido({
    super.key,
    required this.producto,
    this.cantidad = 0,
    required this.precio,
    this.onCambio,
  });
  final String producto;
  final int cantidad;
  final double precio;
  final void Function(int cantidad, double subtotal)? onCambio;

  @override
  State<ProductoPedido> createState() => _ProductoPedidoState();
}

class _ProductoPedidoState extends State<ProductoPedido> {
  late int _cantidad;
  @override
  void initState() {
    super.initState();
    _cantidad = widget.cantidad;
  }

  double get subtotal => _cantidad * widget.precio;

  void sumar() {
    setState(() {
      _cantidad++;
    });
    widget.onCambio?.call(_cantidad, subtotal);
  }

  void restar() {
    setState(() {
      if (_cantidad > 0) {
        _cantidad--;
      }
    });
    widget.onCambio?.call(_cantidad, subtotal);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.producto),
      subtitle: Text(
        'Cantidad: $_cantidad, Subtotal:Q. ${subtotal.toStringAsFixed(2)}',
      ),

      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(icon: const Icon(Icons.remove), onPressed: restar),
          IconButton(icon: const Icon(Icons.add), onPressed: sumar),
        ],
      ),
    );
  }
}
