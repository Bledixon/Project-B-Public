// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.game._0H__

package com.company.assembleegameclient.game {
import flash.events.MouseEvent;
import flash.events.KeyboardEvent;

import com.company.assembleegameclient.parameters.Parameters;

public class _0H__ {

    private static const _0A_l:int = (60 * 1000);//60000
    private static const _bS_:int = 10;
    private static const _with:int = 15;
    private static const _06L_:int = 20;

    public var gs_:GameSprite = null;
    public var _78:int = 0;

    public function start(_arg1:GameSprite):void {
        this.gs_ = _arg1;
        this._78 = 0;
        this.gs_.stage.addEventListener(MouseEvent.MOUSE_MOVE, this.onMouseMove);
        this.gs_.stage.addEventListener(KeyboardEvent.KEY_DOWN, this._0A_Y_);
    }

    public function update(_arg1:int):Boolean {
        var _local2:int = this._78;
        this._78 = (this._78 + _arg1);
        if (this._78 < (_bS_ * _0A_l)) {
            return (false);
        }
        if ((((this._78 >= (_bS_ * _0A_l))) && ((_local2 < (_bS_ * _0A_l))))) {
            this.gs_.textBox_.addText(Parameters.SendError, ((((("You have been idle for " + _bS_) + " minutes, you will disconnected if you are idle for ") + "more than ") + _06L_) + " minutes."));
            return (false);
        }
        if ((((this._78 >= (_with * _0A_l))) && ((_local2 < (_with * _0A_l))))) {
            this.gs_.textBox_.addText(Parameters.SendError, ((((("You have been idle for " + _with) + " minutes, you will disconnected if you are idle for ") + "more than ") + _06L_) + " minutes."));
            return (false);
        }
        if ((((this._78 >= (_06L_ * _0A_l))) && ((_local2 < (_06L_ * _0A_l))))) {
            this.gs_.textBox_.addText(Parameters.SendError, (("You have been idle for " + _06L_) + " minutes, disconnecting."));
            return (true);
        }
        return (false);
    }

    public function stop():void {
        this.gs_.stage.removeEventListener(MouseEvent.MOUSE_MOVE, this.onMouseMove);
        this.gs_.stage.removeEventListener(KeyboardEvent.KEY_DOWN, this._0A_Y_);
        this.gs_ = null;
    }

    private function onMouseMove(_arg1:MouseEvent):void {
        this._78 = 0;
    }

    private function _0A_Y_(_arg1:KeyboardEvent):void {
        this._78 = 0;
    }

}
}//package com.company.assembleegameclient.game

