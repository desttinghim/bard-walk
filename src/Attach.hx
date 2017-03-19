import luxe.Component;
import luxe.Sprite;
import luxe.Vector;

class Attach extends Component {

  var leader : Sprite;
  var sprite : Sprite;

  var relpos : Vector;

  override function init() {
    relpos = new Vector( 0, 0 );
  } //init

  public function new( l : Sprite, ?opt=null ) {
    super(cast opt);
    leader = l;
  }

  override function onadded() {

    sprite = cast entity;
    relpos.copy_from(leader.pos.subtract(sprite.pos));

  } //onadded

  override function update(dt:Float) {

    sprite.pos.copy_from(leader.pos.add(relpos));

  } //update

  override function onreset() {

  } //onreset

}
