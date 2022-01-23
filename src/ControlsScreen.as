package {
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	
	public class ControlsScreen extends World {
		
		public function ControlsScreen():void {
			super();
			
			var title:Text = new Text("Controls");
			title.centerOO();
			this.addGraphic(title, 0, FP.screen.width / 2, FP.screen.height / 4);
			
			var title2:Text = new Text("talk by using the keyboard and pressing enter\nrepeat the last phrase by pressing enter again");
			title2.centerOO();
			this.addGraphic(title2, 0, FP.screen.width / 2, FP.screen.height / 4 + 50);

			
			var start:Text = new Text("press space to begin");
			start.centerOO();
			this.addGraphic(start, 0, FP.screen.width / 2, FP.screen.height * 3 / 4);
		}
		
		private var timer:int = 0;
		override public function update():void {
			super.update();
			timer++;
			if (Input.check(Key.SPACE)/* && timer > FP.assignedFrameRate * 2*/) {
				FP.world = new Game();
			}
		}
	}
}