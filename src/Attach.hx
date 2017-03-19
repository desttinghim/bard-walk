import luxe.Component;
import luxe.Sprite;
import luxe.Vector;

class Attach extends Component {

  var leader : Sprite = null;
  var sprite : Sprite = null;

  var relpos : Vector = null;

  public function new( l : Sprite, ?opt=null ) {
    super(cast opt);
    leader = l;
  }

  override function onadded() {

    sprite = cast entity;
    relpos = new Vector().copy_from(leader.pos).subtract(sprite.pos);

  } //onadded

  override function update(dt:Float) {

    sprite.pos.copy_from(leader.pos).subtract(relpos);

  } //update

  override function onreset() {

  } //onreset

}
