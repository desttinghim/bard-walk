
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
    var paper : Sprite;
    var selected : Sprite;

    var offscreen : Vector;

    override function ready() {

      offscreen = Luxe.screen.mid.multiply_xyz(1,3,1).clone();

      paper = new Sprite({
        name: 'paper sprite',
        pos: offscreen,
        color: new Color().rgb(0xffffff),
        size: new Vector(Luxe.screen.size.x - 20, Luxe.screen.size.y / 2 - 20)
      });

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

    override function onmousedown(event:MouseEvent) {
      if (selected != null) {selected.destroy(); selected = null;}
      if (block.point_inside_AABB(event.pos)) {
        selected = new Sprite({
          color: block.color
        });
        selected.size.copy_from(block.size.divideScalar(2));
      }
    } //onmousedown

    override function onmouseup(event:MouseEvent) {
      if (paper.point_inside_AABB(selected.pos)) {selected.add(new Attach(paper));}
      else {selected.destroy();}
      selected = null;
      paper.pos.copy_from(offscreen);
    } //onmouseup

    override function onmousemove(event:MouseEvent) {
        if (selected != null) {
          selected.pos.lerp(event.pos, 0.5);
          paper.pos.copy_from(Luxe.screen.mid);
        }
    } //onmousemove

    override function update(delta:Float) {

    } //update

} //Main
