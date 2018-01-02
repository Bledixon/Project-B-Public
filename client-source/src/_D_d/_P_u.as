// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_D_d._P_u

package _D_d {
import flash.display.Sprite;

import _E_7._for_;

import flash.events.Event;
import flash.events.MouseEvent;

public class _P_u extends Sprite {

    public static const WIDTH:int = 50;
    public static const HEIGHT:int = 50;

    protected static var toolTip_:_for_ = null;

    public function _P_u(_arg1:int) {
        this.type_ = _arg1;
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }
    public var type_:int;
    protected var selected_:Boolean = false;
    protected var _68:Boolean = false;

    public function setSelected(_arg1:Boolean):void {
        this.selected_ = _arg1;
        this.draw();
    }

    protected function _V_B_(_arg1:_for_):void {
        this._X_S_();
        toolTip_ = _arg1;
        if (toolTip_ != null) {
            stage.addChild(toolTip_);
        }
    }

    protected function _X_S_():void {
        if (toolTip_ != null) {
            if (toolTip_.parent != null) {
                toolTip_.parent.removeChild(toolTip_);
            }
            toolTip_ = null;
        }
    }

    protected function getToolTip():_for_ {
        return (null);
    }

    private function draw():void {
        graphics.clear();
        var _local1:uint = 0x363636;
        if (this.selected_) {
            graphics.lineStyle(1, 0xFFFFFF);
            _local1 = 0x7F7F7F;
        }
        graphics.beginFill(((this._68) ? 0x565656 : 0x363636), 1);
        graphics.drawRect(2, 2, (WIDTH - 4), (HEIGHT - 4));
        if (this.selected_) {
            graphics.lineStyle();
        }
        graphics.endFill();
    }

    private function onAddedToStage(_arg1:Event):void {
        addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
        addEventListener(MouseEvent.ROLL_OUT, this.onRollOut);
    }

    private function onRemovedFromStage(_arg1:Event):void {
        removeEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
        removeEventListener(MouseEvent.ROLL_OUT, this.onRollOut);
    }

    private function onMouseOver(_arg1:Event):void {
        this._68 = true;
        this.draw();
        this._V_B_(this.getToolTip());
    }

    private function onRollOut(_arg1:Event):void {
        this._68 = false;
        this.draw();
        this._X_S_();
    }

}
}//package _D_d

