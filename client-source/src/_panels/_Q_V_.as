// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_panels._Q_V_

package _panels {
import flash.display.Sprite;

import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.objects.Player;
import com.company.assembleegameclient.objects._G_4;

import flash.events.Event;

import com.company.assembleegameclient.objects.GameObject;
import com.company.util.PointUtil;

public class _Q_V_ extends Sprite {

    public static const _gZ_:Number = 1;

    public function _Q_V_(_arg1:GameSprite, _arg2:Player, _arg3:int, _arg4:int) {
        this.gs_ = _arg1;
        this.player_ = _arg2;
        this.w_ = _arg3;
        this.h_ = _arg4;
        this._V_D_ = new _w6(_arg1);
    }
    public var gs_:GameSprite;
    public var player_:Player;
    public var w_:int;
    public var h_:int;
    public var _G_2:Panel = null;
    public var _dN_:_G_4 = null;
    public var _V_D_:_w6;
    private var _g:Panel;

    public function _j(_arg1:Panel):void {
        if (this._g != null) {
            this._g.removeEventListener(Event.COMPLETE, this.onComplete);
        }
        this._g = _arg1;
        this._g.addEventListener(Event.COMPLETE, this.onComplete);
    }

    public function redraw():void {
        this._G_2.draw();
    }

    public function draw():void {
        var _local3:GameObject;
        var _local4:_G_4;
        var _local5:Number;
        var _local6:Panel;
        if (this._g != null) {
            this._tB_(this._g, true);
            this._G_2.draw();
            return;
        }
        var _local1:Number = Number.MAX_VALUE;
        var _local2:_G_4;
        for each (_local3 in this.gs_.map_.goDict_) {
            if (_local3._064) {
                _local4 = (_local3 as _G_4);
                if (_local4 == null) {
                    return;
                }
                if (!((((((((_local3.x_ - this.player_.x_) > _gZ_)) || (((this.player_.x_ - _local3.x_) > _gZ_)))) || (((_local3.y_ - this.player_.y_) > _gZ_)))) || (((this.player_.y_ - _local3.y_) > _gZ_)))) {
                    _local5 = PointUtil._R_O_(_local3.x_, _local3.y_, this.player_.x_, this.player_.y_);
                    if ((((_local5 < _gZ_)) && ((_local5 < _local1)))) {
                        _local1 = _local5;
                        _local2 = _local4;
                    }
                }
            }
        }
        if ((((this._G_2 == null)) || (!((_local2 == this._dN_))))) {
            this._dN_ = _local2;
            _local6 = (((this._dN_) != null) ? this._dN_.getPanel(this.gs_) : this._V_D_);
            this._tB_(_local6, !((this._dN_ == null)));
        }
        this._G_2.draw();
    }

    private function _tB_(_arg1:Panel, _arg2:Boolean):void {
        if (_arg1 == this._G_2) {
            return;
        }
        if (this._G_2 != null) {
            removeChild(this._G_2);
        }
        this._G_2 = _arg1;
        if (this._G_2 == null) {
            return;
        }
        if (_arg2) {
            this._G_2.x = 6;
            this._G_2.y = 20;
        }
        addChild(this._G_2);
    }

    private function onComplete(_arg1:Event):void {
        if (this._g != null) {
            this._g.removeEventListener(Event.COMPLETE, this.onComplete);
            this._g = null;
        }
        this._tB_(null, false);
        this.draw();
    }

}
}//package _panels

