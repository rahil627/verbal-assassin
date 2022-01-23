package {
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	/**
	 * A WALL!!!! OMG
	 * @author Rahil Patel
	 */
	public class Wall extends Entity {
		
		public function Wall(x:int, y:int) {
			var image:Image = new Image(Global.GRAPHIC_WALL);
			image.alpha = .70;
			super (x * 32, y * 32, image);
			this.setHitbox(32, 32);
			this.type = "Wall";
		}
	}
}
