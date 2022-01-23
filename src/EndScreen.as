package {
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	import objects.Player;
	import objects.TextBoxHandler;
	
	public class EndScreen extends World {
		
		public function EndScreen():void {
			super();
			
			var title:Text = new Text("The End");
			title.centerOO();
			this.addGraphic(title, 0, FP.screen.width / 2, FP.screen.height / 2); //shortcut World.addGraphic creates a new Entity and calls entity.addGraphic
			
			this.add(Global.player = new Player(FP.screen.width / 2, FP.screen.height * 3 / 4));
			this.add(new TextBoxHandler());
		}
	}
}