// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_fh._zh

package _fh {
import flash.display.Sprite;

import com.company.assembleegameclient.map._X_l;

import com.company.assembleegameclient.objects._ez;

import flash.events.Event;

import com.company.assembleegameclient.objects.Player;
import com.company.assembleegameclient.map._0D_v;


public class _zh extends Sprite {

    public function _zh(_arg1:_X_l) {
        var _local3:_A_p;
        super();
        this.map_ = _arg1;
        this._gh = new Vector.<_A_p>(_ez._tn, true);
        var _local2:int;
        while (_local2 < _ez._tn) {
            _local3 = new _A_p();
            this._gh[_local2] = _local3;
            addChild(_local3);
            _local2++;
        }
        this.questArrow_ = new _nt(this.map_);
        addChild(this.questArrow_);
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }
    public var map_:_X_l;
    public var _gh:Vector.<_A_p> = null;
    public var questArrow_:_nt;

    public function draw(_arg1:_0D_v, _arg2:int):void {
        var _local6:_A_p;
        var _local7:Player;
        var _local8:int;
        var _local9:_A_p;
        var _local10:Number;
        var _local11:Number;
        if (this.map_.player_ == null) {
            return;
        }
        var _local3:_ez = this.map_.party_;
        var _local4:Player = this.map_.player_;
        var _local5:int;
        while (_local5 < _ez._tn) {
            _local6 = this._gh[_local5];
            if (!_local6._68) {
                if (_local5 >= _local3._X_e.length) {
                    _local6._bz(null);
                } else {
                    _local7 = _local3._X_e[_local5];
                    if (((((_local7._1D_) || ((_local7.map_ == null)))) || (_local7._aE_))) {
                        _local6._bz(null);
                    } else {
                        _local6._bz(_local7);
                        _local8 = 0;
                        while (_local8 < _local5) {
                            _local9 = this._gh[_local8];
                            _local10 = (_local6.x - _local9.x);
                            _local11 = (_local6.y - _local9.y);
                            if (((_local10 * _local10) + (_local11 * _local11)) < 64) {
                                if (!_local9._68) {
                                    _local9._dB_(_local7);
                                }
                                _local6._bz(null);
                                break;
                            }
                            _local8++;
                        }
                        _local6.draw(_arg2, _arg1);
                    }
                }
            }
            _local5++;
        }
        if (!this.questArrow_._68) {
            this.questArrow_.draw(_arg2, _arg1);
        }
    }

    private function onRemovedFromStage(_arg1:Event):void {
        _rB_._7C_();
    }

}
}//package _fh

