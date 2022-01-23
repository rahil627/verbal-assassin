package {
	import flash.events.Event;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	/**
	 * The Engine.
	 */
	//[SWF(width="960",height="288",frameRate="60")] //didn't do anything for browser embedding!
	public class Main extends Engine {
		
		public function Main():void {
			super(640, 480, 60, true); //TODO: just one large level for now, can have a camera track the player later
			
			//for debugging
			//FP.console.enable();
			//FP.volume = 0;
			
			//FP.screen.scale = 3;
			
			FP.world = new ControlsScreen(); //TODO: controls screen
			
			this.addEventListener(Event.ACTIVATE, onActivate)
			this.addEventListener(Event.DEACTIVATE, onDeactivate)
		}
		
		private function onActivate(e:Event):void {
			if (FP.world is Game)
				Game.isPaused = false;
		}
		
		private function onDeactivate(e:Event):void {
			if (FP.world is Game)
				Game.isPaused = true;
		}
	}
}