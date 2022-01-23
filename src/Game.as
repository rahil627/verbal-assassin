package {
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	import objects.Crate;
	import objects.Enemy;
	import objects.Friend;
	import objects.Friend2;
	import objects.Player;
	import objects.TextBoxHandler;
	import objects.Victim;
	
	/**
	 * The Game World!
	 * @author Rahil Patel
	 */
	public class Game extends World {
		
		public static var isPaused:Boolean = false;
		private var currentLevel:int = 0;
		private var timer:int = 0;
		
		public function Game() {
			super();
			Global.game = this;
			generateLevel();
		}
		
		override public function update():void {
			//if (Input.pressed(Key.P))
			//isPaused = !isPaused;
			
			if (isPaused)
				return;
			
			super.update();
			
			timer++;
			
			if (timer == -1)
				generateNextLevel();
		}
		
		private function generateLevel():void {
			switch (currentLevel) {
				case 0:
					this.add(new TextBoxHandler(true, "type here to talk!"));
					this.add(Global.player = new Player(FP.width / 2, FP.height / 2 + 100));
					this.add(new Friend(FP.width / 2, FP.height / 2 - 50));
					
					var i:int;
					for (i = 0; i < FP.screen.width / 32; i++) {
					   add(new Wall(i, 0));
					   add(new Wall(i, 1));
					   add(new Wall(i, 2));
					   //add(new Wall(i, 3));
					   //add(new Wall(i, 12));
					   add(new Wall(i, 13));
					   //add(new Wall(i, 14));
					}
					
					for (i = 0; i < FP.screen.height / 32 - 1; i++) {
						add(new Wall(0, i));
						add(new Wall(1, i));
						add(new Wall(2, i));
						add(new Wall(3, i));
						//add(new Wall(4, i));
						//add(new Wall(5, i));
						//add(new Wall(15, i));
						//add(new Wall(16, i));
						add(new Wall(17, i));
						add(new Wall(18, i));
						add(new Wall(19, i));
					}
					
					break;

				case 1:
					this.add(new TextBoxHandler());
					this.add(Global.player = new Player(FP.width / 2, FP.height - 100));
					this.add(Global.victim = new Victim(FP.width / 2, 100));
					//this.add(new Enemy(200, 200, 200, 300, true));
					this.add(new Enemy(175, 200, 450, 200, false));
					
					var i:int;
					for (i = 0; i < FP.screen.width / 32; i++) {
					   add(new Wall(i, 0));
					   add(new Wall(i, 1));
					   //add(new Wall(i, 2));
					   //add(new Wall(i, 3));
					   //add(new Wall(i, 12));
					   add(new Wall(i, 13));
					   //add(new Wall(i, 14));
					}
					
					for (i = 0; i < FP.screen.height / 32 - 1; i++) {
						add(new Wall(0, i));
						add(new Wall(1, i));
						add(new Wall(2, i));
						add(new Wall(3, i));
						add(new Wall(4, i));
						add(new Wall(5, i));
						
						add(new Wall(15, i));
						add(new Wall(16, i));
						add(new Wall(17, i));
						add(new Wall(18, i));
						add(new Wall(19, i));
					}
					
					break;
				/*
				case 2:
					this.add(new TextBoxHandler());
					this.add(Global.player = new Player(FP.width / 2, FP.height - 100));
					this.add(Global.victim = new Victim(FP.width / 2, 100));
					//this.add(new Enemy(200, 200, 200, 300, true));
					this.add(new Enemy(240, 100, 450, 400, true)); //different speeds, must wait to time it right to pass by
					this.add(new Enemy(360, 100, 450, 400, true, .60));
					
					var i:int;
					for (i = 0; i < FP.screen.width / 32; i++) {
					   add(new Wall(i, 0));
					   add(new Wall(i, 1));
					   //add(new Wall(i, 2));
					   //add(new Wall(i, 3));
					   //add(new Wall(i, 12));
					   add(new Wall(i, 13));
					   //add(new Wall(i, 14));
					}
					
					for (i = 0; i < FP.screen.height / 32 - 1; i++) {
						add(new Wall(0, i));
						add(new Wall(1, i));
						add(new Wall(2, i));
						add(new Wall(3, i));
						add(new Wall(4, i));
						add(new Wall(5, i));
						
						add(new Wall(14, i));
						add(new Wall(15, i));
						add(new Wall(16, i));
						add(new Wall(17, i));
						add(new Wall(18, i));
						add(new Wall(19, i));
					}
				   break;
				  */
				case 2:
					this.add(new TextBoxHandler());
					this.add(Global.player = new Player(FP.width / 2, FP.height / 2 + 100));
					this.add(new Friend2(FP.width / 2, FP.height / 2 - 50));
					
					var i:int;
					for (i = 0; i < FP.screen.width / 32; i++) {
					   add(new Wall(i, 0));
					   add(new Wall(i, 1));
					   add(new Wall(i, 2));
					   //add(new Wall(i, 3));
					   //add(new Wall(i, 12));
					   add(new Wall(i, 13));
					   //add(new Wall(i, 14));
					}
					
					for (i = 0; i < FP.screen.height / 32 - 1; i++) {
						add(new Wall(0, i));
						add(new Wall(1, i));
						add(new Wall(2, i));
						add(new Wall(3, i));
						//add(new Wall(4, i));
						//add(new Wall(5, i));
						//add(new Wall(15, i));
						//add(new Wall(16, i));
						add(new Wall(17, i));
						add(new Wall(18, i));
						add(new Wall(19, i));
					}
					
					break;
			}
		}
		
		public function generateNextLevel():void {
			this.removeAll();
			currentLevel++;
			generateLevel();
		}
		
		public function waitAndGenerateNextLevel():void {
			timer = -1 * FP.assignedFrameRate * 3;
		}
		
		public function restartLevel():void {
			this.removeAll();
			generateLevel();
		}
	}
}