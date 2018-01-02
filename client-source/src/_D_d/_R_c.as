// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_D_d._R_c

package _D_d {
import _0D_d.Frame;
import _0D_d.TextInput;

import flash.events.MouseEvent;
import flash.events.Event;

public class _R_c extends Frame {

    public function _R_c(_arg1:String) {
        super("Tile properties", "Cancel", "Save", null);
        this._O_w = new TextInput("Object Name", false, "");
        if (_arg1 != null) {
            this._O_w.inputText_.text = _arg1;
        }
        _vO_(this._O_w);
        Button1.addEventListener(MouseEvent.CLICK, this.onCancel);
        Button2.addEventListener(MouseEvent.CLICK, this._F_H_);
    }
    public var _O_w:TextInput;

    private function onCancel(_arg1:MouseEvent):void {
        dispatchEvent(new Event(Event.CANCEL));
    }

    private function _F_H_(_arg1:MouseEvent):void {
        dispatchEvent(new Event(Event.COMPLETE));
    }

}
}//package _D_d

