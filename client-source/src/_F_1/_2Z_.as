// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_F_1._2Z_

package _F_1 {
import flash.display.Sprite;

import _E_7._aS_;

import com.company.ui.SimpleText;

import flash.display.DisplayObject;
import flash.filters.DropShadowFilter;
import flash.events.Event;
import flash.utils.getTimer;
import flash.events.MouseEvent;

public class _2Z_ extends Sprite {

    public static var _0B_k:_aS_ = new _aS_(0x2A2A2A, 0x9B9B9B, null, "", 150);

    public function _2Z_(_arg1:int, _arg2:uint, _arg3:uint, _arg4:String, _arg5:String, _arg6:int, _arg7:String, _arg8:String, _arg9:DisplayObject):void {
        this.name_ = _arg4;
        this._00R_ = _arg5;
        this._uT_ = _arg6;
        this._d8 = _arg7;
        this._tK_ = _arg8;
        this.nameText_ = new SimpleText(_arg1, _arg2, false, 0, 0, "Myriad Pro");
        this.nameText_.setBold(true);
        this.nameText_.text = this.name_;
        this.nameText_.updateMetrics();
        this.nameText_.x = (410 - this.nameText_.textWidth);
        this.nameText_.filters = [new DropShadowFilter(0, 0, 0, 1, 4, 4, 2)];
        addChild(this.nameText_);
        if (this._uT_ != -1) {
            this._0J_q = new SimpleText(_arg1, _arg3, false, 0, 0, "Myriad Pro");
            this._0J_q.setBold(true);
            this._0J_q.text = (((_arg7 + "0") + " ") + _arg8);
            this._0J_q.updateMetrics();
            this._0J_q.x = 450;
            this._0J_q.filters = [new DropShadowFilter(0, 0, 0, 1, 4, 4, 2)];
            addChild(this._0J_q);
        }
        if (_arg9 != null) {
            this._ue = _arg9;
            if (this._0J_q != null) {
                this._ue.x = ((this._0J_q.x + this._0J_q.width) - 4);
                _arg9.y = (((this._0J_q.height / 2) - (this._ue.height / 2)) + 2);
            } else {
                this._ue.x = 450;
                _arg9.y = (((this.nameText_.height / 2) - (this._ue.height / 2)) + 2);
            }
            addChild(this._ue);
        }
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }
    public var name_:String;
    public var _00R_:String;
    public var _uT_:int;
    public var _d8:String;
    public var _tK_:String;
    private var startTime_:int = 0;
    private var nameText_:SimpleText;
    private var _0J_q:SimpleText;
    private var _ue:DisplayObject;

    public function _0_v():void {
        this.startTime_ = -1000000;
    }

    private function _F_G_():void {
        if (_0B_k.parent != null) {
            _0B_k.parent.removeChild(_0B_k);
        }
    }

    public function onEnterFrame(_arg1:Event):void {
        var _local3:int;
        var _local2:Number = Math.min(1, ((getTimer() - this.startTime_) / 500));
        if (this._0J_q != null) {
            _local3 = (this._uT_ * _local2);
            this._0J_q.text = (((this._d8 + _local3.toString()) + " ") + this._tK_);
            this._0J_q.updateMetrics();
            if (this._ue != null) {
                this._ue.x = ((this._0J_q.x + this._0J_q.width) - 4);
                this._ue.y = (((this._0J_q.height / 2) - (this._ue.height / 2)) + 2);
            }
        }
        if (_local2 == 1) {
            removeEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        }
    }

    public function onMouseOver(_arg1:Event):void {
        this._F_G_();
        if (this._00R_ == null) {
            return;
        }
        _0B_k._02C_(this._00R_);
        stage.addChild(_0B_k);
    }

    public function onRollOut(_arg1:Event):void {
        this._F_G_();
    }

    private function onAddedToStage(_arg1:Event):void {
        if (this.startTime_ == 0) {
            this.startTime_ = getTimer();
        }
        addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
        addEventListener(MouseEvent.ROLL_OUT, this.onRollOut);
    }

    private function onRemovedFromStage(_arg1:Event):void {
        this._F_G_();
        removeEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        removeEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
        removeEventListener(MouseEvent.ROLL_OUT, this.onRollOut);
    }

}
}//package _F_1

