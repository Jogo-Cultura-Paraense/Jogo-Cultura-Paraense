class Ingredient {
  final String imagePath;

  const Ingredient({this.imagePath});
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
  const Pato() : super(imagePath: 'P');
}

class Tucupi extends Ingredient {
  const Tucupi() : super(imagePath: 'T');
}

class Jambu extends Ingredient {
  const Jambu() : super(imagePath: 'J');
}

class Arroz extends Ingredient {
  const Arroz() : super(imagePath: 'A');
}

class Carangueijo extends Ingredient {
  const Carangueijo() : super(imagePath: 'Cr');
}

class LeiteDeCoco extends Ingredient {
  const LeiteDeCoco() : super(imagePath: 'L');
}

class Farofa extends Ingredient {
  const Farofa() : super(imagePath: 'F');
}

class Camarao extends Ingredient {
  const Camarao() : super(imagePath: 'Cm');
}

class GomaDeTapica extends Ingredient {
  const GomaDeTapica() : super(imagePath: 'G');
}
