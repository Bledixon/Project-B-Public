/**
 * Created by club5_000 on 9/13/2014.
 */
package _0D_d {
    import com.company.assembleegameclient.game.GameSprite;
    import com.company.util._H_V_;

    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.events.MouseEvent;

    public class TextInputForm extends Frame {

        public function TextInputForm(_gs:GameSprite, _name:String, _action:String) {
            super("Text input", "Cancel", "Confirm", "/textInput");
            this.gs_ = _gs;
            this.action_ = _action;
            this.text_ = new TextInput(_name, false, "");
            this._vO_(this.text_);
            this.addEventListener(Event.ADDED_TO_STAGE, this.onAdded);
            this.addEventListener(Event.REMOVED_FROM_STAGE, this.onRemoved);
            Button1.addEventListener(MouseEvent.CLICK, this.close);
            Button2.addEventListener(MouseEvent.CLICK, this.confirm);
        }

        public var text_:TextInput;
        private var action_:String;
        private var gs_:GameSprite;

        private function _0_c():void {
            stage.focus = null;
            dispatchEvent(new Event(Event.COMPLETE));
        }

        private function close(e:Event):void {
            gs_.gsc_.textInputResult(false, this.action_, "");
            _0_c();
        }

        private function confirm(event:MouseEvent):void {
            gs_.gsc_.textInputResult(true, this.action_, this.text_.text());
            _0_c();
        }

        private function onAdded(e:Event):void {
            this.addEventListener(KeyboardEvent.KEY_DOWN, this.onKeyPressed);
        }

        private function onRemoved(e:Event):void {
            this.removeEventListener(KeyboardEvent.KEY_DOWN, this.onKeyPressed);
        }

        private function onKeyPressed(e:KeyboardEvent):void {
            if (e.keyCode == _H_V_.ENTER) {
                gs_.gsc_.textInputResult(true, this.action_, this.text_.text());
                _0_c();
            }
        }
    }
}
