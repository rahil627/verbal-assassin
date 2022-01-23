package {
	import objects.Player;
	import objects.Victim;
	
	/**
	 * Game specific constants.
	 */
	public class Global {
		
		//classes
		public static var game:Game, player:Player, victim:Victim;
		
		//primary data types
		
		//graphics
		[Embed(source = '../assets/graphics/player.png')]
		public static const GRAPHIC_PLAYER:Class;
		
		[Embed(source = '../assets/graphics/wall.png')]
		public static const GRAPHIC_WALL:Class;
		
		[Embed(source = '../assets/graphics/victim.png')]
		public static const GRAPHIC_VICTIM:Class;
		
		[Embed(source = '../assets/graphics/cop.png')]
		public static const GRAPHIC_COP:Class;
		
		[Embed(source = '../assets/graphics/crate.png')]
		public static const GRAPHIC_CRATE:Class;
	}
}