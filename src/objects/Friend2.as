package objects {
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import objects.SoundWave;
	
	/**
	 * NPC in the first level
	 * @author Rahil Patel
	 */
	public class Friend2 extends Entity {
		private var timer:int;
		
		public function Friend2(x:Number, y:Number) {
			super(x, y, new Image(Global.GRAPHIC_PLAYER));
			this.centerOrigin();
			
		}
		
		private var saidImagineDialog:Boolean = false;
		
		override public function update():void {
			super.update();
			
			timer++;
			if (timer == 1) {
				this.world.add(new DialogText(this.x, this.y + 50, "Can you imagine\nyourself as an assassin?"));
				this.world.add(new SoundWave(this.x, this.y));
			}
			
			if (timer == FP.assignedFrameRate * 5) {
				this.world.add(new DialogText(Global.player.x, Global.player.y + 50, "Yes, and I would be..."));
				this.world.add(new SoundWave(Global.player.x, Global.player.y));
			}
			
			if (timer == FP.assignedFrameRate * 9) {
				this.world.add(new DialogText(Global.player.x, Global.player.y + 50, "AWEEEEEEEESOMEEEEEEEEE"));
				this.world.add(new SoundWave(Global.player.x, Global.player.y));
			}
			
			if (timer == FP.assignedFrameRate * 14) {
				this.world.add(new DialogText(this.x, this.y + 50, "Uh...what?."));
				this.world.add(new SoundWave(this.x, this.y));
			}
			
			if (timer == FP.assignedFrameRate * 19) {
				FP.world = new EndScreen();
			}
		}
	}
}