class GameMap {
  final String region;
  final String city;
  const GameMap({this.region, this.city});
}

abstract class Maps {
  static const GameMap sudoeste = GameMap(
    region: 'Sudoeste',
    city: 'Altamira',
  );
  static const GameMap baixoAmazonas = GameMap(
    region: 'Baixo Amazonas',
    city: 'Santarém',
  );

  static const GameMap sudeste = GameMap(
    region: 'Sudeste',
    city: 'Marabá',
  );
  static const GameMap nordeste = GameMap(
    region: 'Nordeste',
    city: 'Abaetetuba',
  );
  static const GameMap marajo = GameMap(
    region: 'Marajó',
    city: 'Breves',
  );
  static const GameMap metropolitana = GameMap(
    region: 'Metropolitana',
    city: 'Belém',
  );
}
