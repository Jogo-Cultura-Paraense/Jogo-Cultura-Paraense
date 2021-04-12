class Ingredient {
  final String id;
  final String imagePath;

  const Ingredient(this.id, {this.imagePath});
}

abstract class Ingredients {
  static Pato get pato => Pato();
  static Tucupi get tucupi => Tucupi();
  static Jambu get jambu => Jambu();
  static Arroz get arroz => Arroz();
  static Carangueijo get carangueijo => Carangueijo();
  static LeiteDeCoco get leiteDeCoco => LeiteDeCoco();
  static Farofa get farofa => Farofa();
  static Camarao get camarao => Camarao();
  static GomaDeTapica get gomaDeTapica => GomaDeTapica();
}

class Pato extends Ingredient {
  const Pato() : super("pato", imagePath: "0xFF998100");
}

class Tucupi extends Ingredient {
  const Tucupi() : super("tucupi", imagePath: "0xFF00007F");
}

class Jambu extends Ingredient {
  const Jambu() : super("jambu", imagePath: "0xFFBADA55");
}

class Arroz extends Ingredient {
  const Arroz() : super("arroz", imagePath: "0xFFA936EE");
}

class Carangueijo extends Ingredient {
  const Carangueijo() : super("carangueijo", imagePath: "0xFF631717");
}

class LeiteDeCoco extends Ingredient {
  const LeiteDeCoco() : super("leite_coco", imagePath: "0xFFFF8142");
}

class Farofa extends Ingredient {
  const Farofa() : super("farofa", imagePath: "0xFFFFC5BE");
}

class Camarao extends Ingredient {
  const Camarao() : super("camarao", imagePath: "0xFF2EB9B5");
}

class GomaDeTapica extends Ingredient {
  const GomaDeTapica() : super("goma_tapioca", imagePath: "0xFFCCFF00");
}
