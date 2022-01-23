package {
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	
	/**
	 * Text that appears around an entity and disappears
	 * @author Rahil Patel
	 */
	public class DialogText extends Entity {
		
		private var timer:int = 0;
		
		public function DialogText(x:Number, y:Number, textString:String) {
			//TODO: add \n within the text
			var text:Text = new Text(textString);
			text.color = 0x63F4FF;
			text.centerOO();
			
			super(x, y, text);
		}
		
		override public function update():void {
			super.update();
			
			timer++;
			
			if (timer >= FP.assignedFrameRate * 3)
				this.world.remove(this);
		}
	}
}