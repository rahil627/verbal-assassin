package objects {
	import flash.display.BitmapData;
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * The player!
	 * @author Rahil Patel
	 */
	public class Player extends Actor {
		
		private var moveSpeed:int = 1;
		private var timer:int;
		private var direction:Point = new Point(0, -1);
		private var graphicImage:Image;
		private var acceleration:Number = 600;
		
		public function Player(x:Number, y:Number){
			super(x, y);
			this.graphic = new Image(Global.GRAPHIC_PLAYER);
			this.mask = new Pixelmask(FP.getBitmap(Global.GRAPHIC_PLAYER));
			this.centerOrigin();
			
			graphicImage = this.graphic as Image;
			graphicImage.centerOO();
			
			this.type = "Player";
		}
		
		override public function update():void {
			super.update();
			
			timer++;
			
			//TODO: debug code
			/*
			if (Input.check(Key.UP)){
				moveUp();
			}
			if (Input.check(Key.DOWN)){
				moveDown();
			}
			if (Input.check(Key.LEFT)){
				moveLeft();
			}
			if (Input.check(Key.RIGHT)){
				moveRight();
			}
			if (Input.check(Key.RIGHT_SQUARE_BRACKET) && timer >= 60){
				this.world.add(new SoundWave(this.x, this.y)); //TODO: testing
				timer = 0;
			}
			*/
			move();
			
			// friction, maxspeed
			doFriction(!Input.check(Key.LEFT) && !Input.check(Key.RIGHT), !Input.check(Key.DOWN) && !Input.check(Key.UP));
			doMaxSpeed();
			
			//check collisions
			if (this.x < 0) //if off of screen, set to the edge of the screen
				this.x = 0;
			else if (this.x > FP.screen.width)
				this.x = FP.screen.width;
			if (this.y < 0)
				this.y = 0;
			else if (this.y > FP.screen.height)
				this.y = FP.screen.height;
			
			//if (this.collide("Wall", this.x, this.y)) //think about this after I get the text interface down
				//return;
		
			//TODO: should the player move by tile size or should the player move fluidly with acceleration
			//can use the word "stop"
			//move up, move down, move right, move left, stop?
		}
		
		public function moveUp():void {
			//this.y -= moveSpeed;
			speed.y -= acceleration;// * FP.elapsed;
			//graphicImage.angle = 0;
			direction.y = -1;
			direction.x = 0;
		}
		
		public function moveDown():void {
			//this.y += moveSpeed;
			speed.y += acceleration;// * FP.elapsed;
			//graphicImage.angle = 180;
			direction.y = 1;
			direction.x = 0;
		}
		
		public function moveLeft():void {
			//this.x -= moveSpeed;
			speed.x -= acceleration;// * FP.elapsed;
			//graphicImage.angle = 90;
			direction.x = -1;
			direction.y = 0;
		}
		
		public function moveRight():void {
			//this.x += moveSpeed;
			speed.x += acceleration;// * FP.elapsed;
			//graphicImage.angle = 270;
			direction.x = 1;
			direction.y = 0;
		}
		
		override public function moveCollideX(e:Entity):Boolean {
			speed.x = -speed.x / 2;
			return true;
		}
		
		override public function moveCollideY(e:Entity):Boolean {
			speed.y = -speed.y / 2;
			return true;
		}
	}
}