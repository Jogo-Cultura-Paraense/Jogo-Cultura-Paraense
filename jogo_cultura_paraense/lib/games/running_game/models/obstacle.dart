class Obstacle {
  final String id;
  final String imagePath;

  const Obstacle(this.id, [this.imagePath]);
}

abstract class ObstacleFactory {
  static Obstacle get aranha {
    return Obstacle("aranha", "running_game/aranha.png");
  }

  static Obstacle get onca {
    return Obstacle("onca", "running_game/onca.png");
  }

  static Obstacle get pedra {
    return Obstacle("pedra", "running_game/pedra.png");
  }

  static Obstacle get poca {
    return Obstacle("poca", "running_game/poca.png");
  }

  static Obstacle get sapo {
    return Obstacle("sapo", "running_game/sapo.png");
  }

  static Obstacle get tronco {
    return Obstacle("tronco", "running_game/tronco.png");
  }

  static List<Obstacle> get all {
    return [
      ObstacleFactory.aranha,
      ObstacleFactory.onca,
      ObstacleFactory.pedra,
      ObstacleFactory.poca,
      ObstacleFactory.sapo,
      ObstacleFactory.tronco,
    ];
  }
}
