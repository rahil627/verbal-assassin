package objects {
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import objects.SoundWave;
	import objects.TextBox;
	
	/**
	 * ...
	 * @author Rahil Patel
	 */
	public class TextBoxHandler extends TextBox {
		
		private var lastText:String = "";
		
		public function TextBoxHandler(reading:Boolean = true, text:String = "", x:Number = 0, y:Number = 450){
			super(reading, text, x, y);
		}
		
		override public function update():void {
			super.update();
			
			//if press enter, read the current text, if it's a command take action, then clear it
			if (Input.pressed(Key.ENTER)) {
				if (this.text == "")
					this.text = lastText;
				parseCommand();
			}
		}
		
		private function parseCommand():void {
			if ((this.text).toLowerCase() == "move up") {
				Global.player.moveUp();
				this.world.add(new SoundWave(Global.player.x, Global.player.y));
			}
			if ((this.text).toLowerCase() == "move down") {
				Global.player.moveDown();
				this.world.add(new SoundWave(Global.player.x, Global.player.y));
			}
			if ((this.text).toLowerCase() == "move left") {
				Global.player.moveLeft();
				this.world.add(new SoundWave(Global.player.x, Global.player.y));
			}
			if ((this.text).toLowerCase() == "move right") {
				Global.player.moveRight();
				this.world.add(new SoundWave(Global.player.x, Global.player.y));
			}
			if ((this.text).toLowerCase() == "stab" && Global.player.collide("Victim", Global.player.x, Global.player.y)) {
				this.world.add(new SoundWave(Global.player.x, Global.player.y));
				Global.victim.die();
				Global.game.waitAndGenerateNextLevel();
			}
			
			//display the text above the player
			this.world.add(new DialogText(Global.player.x, Global.player.y + Global.player.height, this.text));
			
			lastText = this.text;
			
			Input.keyString = "";
			this.text = "";
		}
	}
}