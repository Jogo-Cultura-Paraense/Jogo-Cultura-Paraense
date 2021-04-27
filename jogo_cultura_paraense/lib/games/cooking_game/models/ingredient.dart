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
  const Pato() : super("pato", imagePath: "cooking_game/pato.png");
}

class Tucupi extends Ingredient {
  const Tucupi() : super("tucupi", imagePath: "cooking_game/tucupi.png");
}

class Jambu extends Ingredient {
  const Jambu() : super("jambu", imagePath: "cooking_game/jambu.png");
}

class Arroz extends Ingredient {
  const Arroz() : super("arroz", imagePath: "cooking_game/arroz.png");
}

class Carangueijo extends Ingredient {
  const Carangueijo()
      : super("carangueijo", imagePath: "cooking_game/carangueijo.png");
}

class LeiteDeCoco extends Ingredient {
  const LeiteDeCoco()
      : super("leite_coco", imagePath: "cooking_game/leite_coco.png");
}

class Farofa extends Ingredient {
  const Farofa() : super("farofa", imagePath: "cooking_game/farofa.png");
}

class Camarao extends Ingredient {
  const Camarao() : super("camarao", imagePath: "cooking_game/camarao.png");
}

class GomaDeTapica extends Ingredient {
  const GomaDeTapica()
      : super("goma_tapioca", imagePath: "cooking_game/goma_tapioca.png");
}

class Maniva extends Ingredient {
  const Maniva() : super("maniva", imagePath: "cooking_game/maniva.png");
}

class CarnePorco extends Ingredient {
  const CarnePorco()
      : super("carne_porco", imagePath: "cooking_game/carne_porco.png");
}

class CarneBoi extends Ingredient {
  const CarneBoi()
      : super("carne_boi", imagePath: "cooking_game/carne_boi.png");
}

class Filhote extends Ingredient {
  const Filhote() : super("filhote", imagePath: "cooking_game/filhote.png");
}

class Acai extends Ingredient {
  const Acai() : super("acai", imagePath: "cooking_game/acai.png");
}

class FarinhaTapioca extends Ingredient {
  const FarinhaTapioca()
      : super("farinha_tapioca", imagePath: "cooking_game/farinha_tapioca.png");
}

class Macaxeira extends Ingredient {
  const Macaxeira()
      : super("macaxeira", imagePath: "cooking_game/macaxeira.png");
}

class Acucar extends Ingredient {
  const Acucar() : super("acucar", imagePath: "cooking_game/acucar.png");
}

class Ovos extends Ingredient {
  const Ovos() : super("ovos", imagePath: "cooking_game/ovos.png");
}

class CocoRalado extends Ingredient {
  const CocoRalado()
      : super("coco_ralado", imagePath: "cooking_game/coco_ralado.png");
}

class Cupuacu extends Ingredient {
  const Cupuacu() : super("cupuacu", imagePath: "cooking_game/cupuacu.png");
}

class LeiteCondensado extends Ingredient {
  const LeiteCondensado()
      : super("leite_condensado",
            imagePath: "cooking_game/leite_condensado.png");
}

class CremeLeite extends Ingredient {
  const CremeLeite()
      : super("creme_leite", imagePath: "cooking_game/creme_leite.png");
}
