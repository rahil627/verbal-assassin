package objects {
  import net.flashpunk.graphics.Text;
  import net.flashpunk.Entity;
  import net.flashpunk.utils.Input;
  import net.flashpunk.utils.Key;

  public class TextBox extends Entity {

    //A vector of all of the TextBox instances that were added to the screen.
    private static var all_boxes:Vector.<TextBox> = new Vector.<TextBox>();

    //True if this text box is reading data.
    private var _reading:Boolean;

    //The text being displayed by this text box.
    protected var txt:Text;

    //Initialize a new TextBox. Only one text box should be reading at a time.
	public function TextBox(reading:Boolean, text:String = "", x:Number = 0, y:Number = 0) {
      txt = new Text(text);
      this.reading = reading;
      super(x, y, txt);
      width = txt.width;
      height = txt.height;
    }

    override public function update():void {
      if (_reading) {
        txt.text = Input.keyString;
        width = txt.width;
        height = txt.height;

        //Cycle through other text boxes when tab is pressed.
        if (Input.pressed(Key.TAB)) {
          //Clear the input so that only one TextBox sees the Tab.
          Input.clear();
          var idx:int = all_boxes.indexOf(this);
          _reading = false;
          //If there is a next box enable reading for it.
          //Otherwise wrap around adn enable reading for the first box
          if (idx+1 < all_boxes.length) {
            all_boxes[idx+1].enableInput();
          }
          else {
            all_boxes[0].enableInput();
          }
        }
      }
      if (Input.mouseReleased && collidePoint(x, y, Input.mouseX, Input.mouseY)) {
        //Setting reading to false for all other TextBoxes and reading to true
        //for this one.
        if (_reading != true) {
          enableInput();
        }
      }
    }

    override public function added():void {
      //Add this element into the all_boxes list.
      all_boxes.push(this);
      if (_reading) {
        enableInput();
      }
    }

    override public function removed():void {
      //Remove this element from the all_boxes list if it was there.
      var idx:int = all_boxes.indexOf(this);
      if (-1 != idx) {
        all_boxes.splice(idx, 1); //(idx, 1, 0)
      }
    }

    public function enableInput():void {
      //Set reading to false for all of the boxes.
      all_boxes.forEach(function (box:TextBox, idx:int, vect:Vector.<TextBox>):void
          {box.reading = false;}, null);
      _reading = true;
      //What is currently in this buffer is transferred to the keyString.
      //This makes backspaces and such work correctly.
      Input.keyString = txt.text;
    }

    public function get text():String { return txt.text; }
    public function set text(str:String):void { txt.text = str; }

    public function get reading():Boolean { return _reading; }
    public function set reading(reading:Boolean):void {
      if (reading != _reading) {
        _reading = reading;
        //What is currently in this buffer is transferred to the keyString.
        //This makes backspaces and such work correctly.
        if (_reading) {
          enableInput();
        }
      }
    }
  }
}

