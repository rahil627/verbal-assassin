package objects {
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import objects.SoundWave;
	
	/**
	 * NPC in the first level
	 * @author Rahil Patel
	 */
	public class Friend extends Entity {
		private var timer:int;
		
		public function Friend(x:Number, y:Number) {
			super(x, y, new Image(Global.GRAPHIC_PLAYER));
			this.centerOrigin();
			
		}
		
		private var saidImagineDialog:Boolean = false;
		
		override public function update():void {
			super.update();
			
			timer++;
			
			if (timer == FP.assignedFrameRate * 5) {
				this.world.add(new DialogText(this.x, this.y + 50, "Hey Verbal, come here."));
				this.world.add(new SoundWave(this.x, this.y));
			}
			
			if (timer == FP.assignedFrameRate * 10) {
				this.world.add(new DialogText(this.x, this.y + 50, "I've got a crazy hypothetical scenario."));
				this.world.add(new SoundWave(this.x, this.y));
			}
			
			if (timer % (FP.assignedFrameRate * 15) == 0 && !saidImagineDialog) {
				this.world.add(new DialogText(this.x, this.y + 50, "Come on man, just MOVE UP a few times"));
				this.world.add(new SoundWave(this.x, this.y));
			}
			
			
			if (Global.player.y <= 240 && !saidImagineDialog) {
				this.world.add(new DialogText(this.x, this.y + 50, "Can you imagine\nyourself as an assassin?"));
				this.world.add(new SoundWave(this.x, this.y));
				saidImagineDialog = true;
				timer = FP.assignedFrameRate * 1000;
			}
			
			if (timer == FP.assignedFrameRate * 1005) {
				FP.world = new TitleScreen();
			}
		}
	}
}