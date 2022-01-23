package objects 
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	/**
	 * ...
	 * @author Noel Berry
	 */
	public class Actor extends Entity
	{
		
		public var speed:Point = new Point(0, 0);
		public var maxSpeedX:Number = 140;
		public var maxSpeedY:Number = 140;
		public var friction:Number = 1200;
		
		public function Actor(x:int, y:int, graphic:Graphic = null, mask:Mask = null) 
		{
			super(x, y, graphic, mask);
		}
		
		public function move(x:Boolean = true, y:Boolean = true):void
		{
			if(x)
				moveBy(speed.x * FP.elapsed, 0, "Wall", true);
			if(y)
				moveBy(0, speed.y * FP.elapsed, "Wall", true);
		}
		
		public function doFriction(x:Boolean = true, y:Boolean = true):void
		{
			var s:int;
			
			if (x)
			{
				s = FP.sign(speed.x);
				speed.x -= s * friction * FP.elapsed;
				
				if (FP.sign(speed.x) != s)
					speed.x = 0;
			}
			
			if (y)
			{
				s = FP.sign(speed.y);
				speed.y -= s * friction * FP.elapsed;
				
				if (FP.sign(speed.y) != s)
					speed.y = 0;
			}
		}
		
		public function doMaxSpeed(x:Boolean = true, y:Boolean = true):void
		{
			var s:int;
			
			if (x)
				speed.x = FP.sign(speed.x) * Math.min(Math.abs(speed.x), maxSpeedX);
			
			if (y)
				speed.y = FP.sign(speed.y) * Math.min(Math.abs(speed.y), maxSpeedY);
		}
		
		public function inScreen():Boolean
		{
			if (x > FP.camera.x - 32 && y > FP.camera.y - 32 && x < FP.camera.x + FP.width + 32 && y < FP.camera.y + FP.height + 32)
				return true;
			return false;
		}
		
	}

}