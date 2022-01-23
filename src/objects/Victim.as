package objects {
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Pixelmask;
	
	/**
	 * ...
	 * @author Rahil Patel
	 */
	public class Victim extends Entity {
		private var saidStabDialog:Boolean = false;;
		private var image:Image;
		private var isDead:Boolean = false;
		private var timer:int;
		
		public function Victim(x:Number, y:Number) {
			image = new Image(Global.GRAPHIC_VICTIM);
			super(x, y, image/*, new Pixelmask(FP.getBitmap(Global.GRAPHIC_VICTIM))*/);
			//this.centerOrigin();
			this.setHitbox(40, 40, 20, 20);
			image.centerOO();


			this.type = "Victim";
			//check collision in textBoxHandler when the command stab (could take multiple stabs to kill?)
		}
		
		override public function update():void {
			super.update();
			
			if (this.collide("Player", this.x, this.y) && !saidStabDialog && !isDead) {
				this.world.add(new DialogText(this.x, this.y - 10, "Ahhhh. Please don't STAB me."))				
				saidStabDialog = true;
			}
		}
		
		public function die():void {
			image.angle -= 90;
			isDead = true;
		}
	}
}