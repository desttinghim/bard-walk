
import luxe.GameConfig;
import luxe.Input;
import luxe.Sprite;
import luxe.Color;
import luxe.Vector;

class Main extends luxe.Game {

    override function config(config:GameConfig) {

        config.window.title = 'luxe game';
        config.window.width = 640;
        config.window.height = 960;
        config.window.fullscreen = false;

        return config;

    } //config

    var block : Sprite;

    override function ready() {

      block = new Sprite({
        name: 'block sprite',
        pos: Luxe.screen.mid,
        color: new Color().rgb(0xf94b04),
        size: new Vector(128, 128)
      });

    } //ready

    override function onkeyup(event:KeyEvent) {

        if(event.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

    override function update(delta:Float) {

    } //update

} //Main
