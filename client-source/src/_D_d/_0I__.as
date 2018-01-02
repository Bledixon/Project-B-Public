// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_D_d._0I__

package _D_d {
import flash.display.Sprite;

import com.company.util.IntPoint;

import flash.display.Shape;
import flash.display.Graphics;
import flash.events.Event;

public class _0I__ extends Sprite {

    public function _0I__(_arg1:Vector.<IntPoint>, _arg2:String) {
        this.tiles_ = _arg1;
        this._T_y = new Shape();
        var _local3:Graphics = this._T_y.graphics;
        _local3.clear();
        _local3.beginFill(0, 0.8);
        _local3.drawRect(0, 0, 800, 600);
        _local3.endFill();
        addChild(this._T_y);
        this._0K_F_ = new _R_c(_arg2);
        this._0K_F_.addEventListener(Event.COMPLETE, this.onComplete);
        this._0K_F_.addEventListener(Event.CANCEL, this.onCancel);
        addChild(this._0K_F_);
    }
    public var tiles_:Vector.<IntPoint>;
    private var _T_y:Shape;
    private var _0K_F_:_R_c;

    public function _wa():String {
        if (this._0K_F_._O_w.text() == "") {
            return (null);
        }
        return (this._0K_F_._O_w.text());
    }

    public function onComplete(_arg1:Event):void {
        dispatchEvent(new Event(Event.COMPLETE));
        parent.removeChild(this);
    }

    public function onCancel(_arg1:Event):void {
        parent.removeChild(this);
    }

}
}//package _D_d

