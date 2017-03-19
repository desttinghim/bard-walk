import luxe.Component;
import phoenix.Texture;

class SelectIcon extends Component {

  var icon : Texture;

  public function new( i : Texture, ?opt=null ) {
    super(cast opt);
    icon = i;
  }

}
