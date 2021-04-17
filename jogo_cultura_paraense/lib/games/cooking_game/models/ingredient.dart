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
  static Maniva get maniva => Maniva();
  static CarnePorco get carnePorco => CarnePorco();
  static CarneBoi get carneBoi => CarneBoi();
  static Filhote get filhote => Filhote();
  static Acai get acai => Acai();
  static FarinhaTapioca get farinhaTapioca => FarinhaTapioca();
  static Macaxeira get macaxeira => Macaxeira();
  static Acucar get acucar => Acucar();
  static Ovos get ovos => Ovos();
  static CocoRalado get cocoRalado => CocoRalado();
  static Cupuacu get cupuacu => Cupuacu();
  static LeiteCondensado get leiteCondensado => LeiteCondensado();
  static CremeLeite get cremeLeite => CremeLeite();
}

class Pato extends Ingredient {
  const Pato() : super("pato", imagePath: "0xFFADD8E6");
}

class Tucupi extends Ingredient {
  const Tucupi() : super("tucupi", imagePath: "0xFF7B68EE");
}

class Jambu extends Ingredient {
  const Jambu() : super("jambu", imagePath: "0xFF7FFFD4");
}

class Arroz extends Ingredient {
  const Arroz() : super("arroz", imagePath: "0xFF8B008B");
}

class Carangueijo extends Ingredient {
  const Carangueijo() : super("carangueijo", imagePath: "0xFFBA55D3");
}

class LeiteDeCoco extends Ingredient {
  const LeiteDeCoco() : super("leite_coco", imagePath: "0xFF1E90FF");
}

class Farofa extends Ingredient {
  const Farofa() : super("farofa", imagePath: "0xFF5F9EA0");
}

class Camarao extends Ingredient {
  const Camarao() : super("camarao", imagePath: "0xFFDB7093");
}

class GomaDeTapica extends Ingredient {
  const GomaDeTapica() : super("goma_tapioca", imagePath: "0xFFDEB887");
}

class Maniva extends Ingredient {
  const Maniva() : super("maniva", imagePath: "0xFFD8BFD8");
}

class CarnePorco extends Ingredient {
  const CarnePorco() : super("carne_porco", imagePath: "0xFFFAFAD2");
}

class CarneBoi extends Ingredient {
  const CarneBoi() : super("carne_boi", imagePath: "0xFF00008B");
}

class Filhote extends Ingredient {
  const Filhote() : super("filhote", imagePath: "0xFF66CDAA");
}

class Acai extends Ingredient {
  const Acai() : super("acai", imagePath: "0xFFFF1493");
}

class FarinhaTapioca extends Ingredient {
  const FarinhaTapioca() : super("farinha_tapioca", imagePath: "0xFF6495ED");
}

class Macaxeira extends Ingredient {
  const Macaxeira() : super("macaxeira", imagePath: "0xFF000000");
}

class Acucar extends Ingredient {
  const Acucar() : super("acucar", imagePath: "0xFFB82DC7");
}

class Ovos extends Ingredient {
  const Ovos() : super("ovos", imagePath: "0xFF800000");
}

class CocoRalado extends Ingredient {
  const CocoRalado() : super("coco_ralado", imagePath: "0xFFFF6347");
}

class Cupuacu extends Ingredient {
  const Cupuacu() : super("cupuacu", imagePath: "0xFF8B0000");
}

class LeiteCondensado extends Ingredient {
  const LeiteCondensado() : super("leite_condensado", imagePath: "0xFFA9A9A9");
}

class CremeLeite extends Ingredient {
  const CremeLeite() : super("creme_leite", imagePath: "0xFFFEECA0");
}
