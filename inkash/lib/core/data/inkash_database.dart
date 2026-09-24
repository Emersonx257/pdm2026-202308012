import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

/// Singleton que administra la conexión a la base de datos SQLite.
/// Se usa desde cualquier DataSource que necesite acceso local.
class InkashDatabase {
  InkashDatabase._();
  static final InkashDatabase instance = InkashDatabase._();

  static Database? _database;

  /// Devuelve la instancia de la base de datos, creándola si no existe.
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'inkash.db');

    return openDatabase(path, version: 1, onCreate: _crearTablas);
  }

  /// Crea todas las tablas de la app en la primera ejecución.
  Future<void> _crearTablas(Database db, int version) async {
    await db.execute('''
      CREATE TABLE movimientos (
        id         TEXT    PRIMARY KEY,
        titulo     TEXT    NOT NULL,
        subtitulo  TEXT    NOT NULL,
        icono      TEXT    NOT NULL,
        monto_centavos INTEGER NOT NULL,
        fecha      TEXT    NOT NULL,
        es_ingreso INTEGER NOT NULL DEFAULT 0
      )

      CREATE TABLE categorias (
        id         TEXT    PRIMARY KEY,
        nombre     TEXT    NOT NULL,
        icono      TEXT    NOT NULL
      )
    ''');
  }

  /// Cierra la conexión (útil para tests o limpieza).
  Future<void> close() async {
    final db = await database;
    await db.close();
    _database = null;
  }
}
