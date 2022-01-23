package objects {
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.tweens.motion.CircularMotion;
	import net.flashpunk.utils.Draw;
	
	/**
	 * A Sound Wave!!!
	 * @author Rahil Patel
	 */
	public class SoundWave extends Entity {
		private var currentRadius:int;
		private var timer:int;
		private var startX:Number;
		private var startY:Number;
		
		public function SoundWave(x:Number, y:Number) {
			super(0, 0);
			this.startX = x;
			this.startY = y;
			
			this.type = "SoundWave";
		}
		
		override public function update():void {
			super.update();
			
			timer++;
			
			currentRadius++;
			
			if (timer % 3 == 0) {
				var circle:BitmapData = new BitmapData(FP.width, FP.height, true, 0);
				Draw.setTarget(circle);
				Draw.circlePlus(startX, startY, currentRadius, 0x00FF00, 1, false, 1);
				Draw.resetTarget();
				this.graphic = new Image(circle);
					
				this.mask = new Pixelmask(circle); //the mask only covers the circle line, not inside of it
			}
			
			if (currentRadius >= 50)
				this.world.remove(this);
		}
	}
}