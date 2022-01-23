package objects {
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Pixelmask;
	
	/**
	 * The basic Metal Gear like enemy
	 * @author Rahil Patel
	 */
	public class Enemy extends Entity {
		
		private var endX:Number;
		private var endY:Number;
		private var startX:Number;
		private var startY:Number;
		private var moveDirectionIsVertical:Boolean;
		
		private var moveSpeed:Number;;

		//make sure start < end when creating an Enemy
		public function Enemy(startX:Number, startY:Number, endX:Number, endY:Number, moveDirectionIsVertical:Boolean, moveSpeed:Number = .5) {
			super(startX, startY);
			this.startX = startX;
			this.startY = startY;
			this.endY = endY;
			this.endX = endX;
			this.moveDirectionIsVertical = moveDirectionIsVertical;
			this.moveSpeed = moveSpeed;
			//if (moveDirectionIsVertical) {
				//if (startY > endY)
					//moveSpeed *= -1;
			//}
			
			//has a circle hitbox
			FP.sprite.graphics.clear();
			FP.sprite.graphics.beginFill(0, 0);
			FP.sprite.graphics.lineStyle(1, 0xFF0000, 1);
			FP.sprite.graphics.drawCircle(25, 25, 25);//(this.x, this.y, 25);
			FP.sprite.graphics.endFill();
			
			//FP.buffer.draw(FP.sprite); //test, draw to screen
			
			this.x -= 25; //TODO: jesus christ this is ugly
			this.y -= 25;
			
			var bitmapData:BitmapData = new BitmapData(FP.width, FP.height, true, 0); //TODO: this won't work
			//FP.buffer.draw(bitmapData); //did not work
			bitmapData.draw(FP.sprite);
			this.mask = new Pixelmask(bitmapData);
			
			this.addGraphic(new Image(bitmapData));
			

			
			var image:Image;
			this.addGraphic(image = new Image(Global.GRAPHIC_COP));
			image.centerOO();
			image.x += 25;
			image.y += 25;
			
			this.x += 25;
			this.y += 25;

			this.centerOrigin();
		}
		
		override public function update():void {
			super.update();
			
			if (moveDirectionIsVertical) {
				this.y += moveSpeed;
				
				if (this.y > endY || this.y < startY)
					moveSpeed *= -1;
			}
			else {
				this.x += moveSpeed;
				
				if (this.x > endX || this.x < startX)
					moveSpeed *= -1;
			}
			
			if (this.collideTypes(["Player", "SoundWave"], this.x, this.y))
				Game(this.world).restartLevel();
		}
	}
}