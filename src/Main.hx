
import luxe.GameConfig;
import luxe.Input;
import luxe.Sprite;
import luxe.Color;
import luxe.Vector;

class Main extends luxe.Game {

    override function config(config:GameConfig) {

        config.window.title = 'luxe game';
        config.window.width = 480;
        config.window.height = 640;
        config.window.fullscreen = false;

        return config;

    } //config

    var block : Sprite;
    var selected : Sprite;

    override function ready() {

      block = new Sprite({
        name: 'block sprite',
        pos: Luxe.screen.mid,
        color: new Color().rgb(0xf94b04),
        size: new Vector(128, 128)
      });
      selected = null;

    } //ready

    override function onkeyup(event:KeyEvent) {

        if(event.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

    function topLeftCorner(s:Sprite) {
      return new Vector(s.pos.x - s.size.x / 2, s.pos.y - s.size.y / 2);
    }

    function botRightCorner(s:Sprite) {
      return new Vector(s.pos.x + s.size.x / 2, s.pos.y + s.size.y / 2);
    }

    function pointInBox( p:Vector, a1:Vector, a2:Vector ) {
      return (p.x > a1.x && p.x < a2.x && p.y > a1.y && p.y < a2.y);
    }

    override function update(delta:Float) {

    } //update

} //Main
