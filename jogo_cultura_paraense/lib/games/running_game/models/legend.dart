class Legend {
  final String id;
  final String imagePath;

  const Legend(this.id, [this.imagePath]);
}

abstract class LegendFactory {
  static Legend get boto {
    return Legend("boto", "running_game/boto.png");
  }

  static Legend get cobraGrande {
    return Legend("cobra_grande", "running_game/cobra_grande.png");
  }

  static Legend get curupira {
    return Legend("curupira", "running_game/curupira.png");
  }

  static Legend get iara {
    return Legend("iara", "running_game/iara.png");
  }

  static Legend get mapinguari {
    return Legend("mapinguari", "running_game/mapinguari.png");
  }

  static Legend get matinta {
    return Legend("matinta", "running_game/matinta.png");
  }

  static Legend get muiraquita {
    return Legend("muiraquita", "running_game/muiraquita.png");
  }

  static Legend get vitoriaRegia {
    return Legend("vitoria_regia", "running_game/vitoria_regia.png");
  }
}
