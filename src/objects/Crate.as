package objects {
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	/**
	 * A WALL!!!! OMG
	 * @author Rahil Patel
	 */
	public class Crate extends Entity {
		
		public function Crate(x:int, y:int) {
			super (x * 32, y * 32, new Image(Global.GRAPHIC_CRATE));
			this.setHitbox(32, 32);
			this.type = "Wall";
		}
	}
}
