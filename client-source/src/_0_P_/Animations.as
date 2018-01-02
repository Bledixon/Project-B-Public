// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0_P_.Animations

package _0_P_ {

import flash.display.BitmapData;


public class Animations {

    public function Animations(_arg1:_0F_7) {
        this._fe = _arg1;
    }
    public var _fe:_0F_7;
    public var _1y:Vector.<int> = null;
    public var _zl:RunningAnimation = null;

    public function getTexture(_arg1:int):BitmapData {
        var _local2:_3Y_;
        var _local4:BitmapData;
        var _local5:int;
        if (this._1y == null) {
            this._1y = new Vector.<int>();
            for each (_local2 in this._fe._20) {
                this._1y.push(_local2._tu(_arg1));
            }
        }
        if (this._zl != null) {
            _local4 = this._zl.getTexture(_arg1);
            if (_local4 != null) {
                return (_local4);
            }
            this._zl = null;
        }
        var _local3:int;
        while (_local3 < this._1y.length) {
            if (_arg1 > this._1y[_local3]) {
                _local5 = this._1y[_local3];
                _local2 = this._fe._20[_local3];
                this._1y[_local3] = _local2._gr(_arg1);
                if (!((!((_local2._01D_ == 1))) && ((Math.random() > _local2._01D_)))) {
                    this._zl = new RunningAnimation(_local2, _local5);
                    return (this._zl.getTexture(_arg1));
                }
            }
            _local3++;
        }
        return (null);
    }

}
}//package _0_P_

import _0_P_._3Y_;

import flash.display.BitmapData;

import _0_P_._C_n;

class RunningAnimation {

    public var animationData_:_3Y_;
    public var start_:int;
    public var frameId_:int;
    public var frameStart_:int;
    public var texture_:BitmapData;

    public function RunningAnimation(_arg1:_3Y_, _arg2:int) {
        this.animationData_ = _arg1;
        this.start_ = _arg2;
        this.frameId_ = 0;
        this.frameStart_ = _arg2;
        this.texture_ = null;
    }

    public function getTexture(_arg1:int):BitmapData {
        var _local2:_C_n = this.animationData_._2_[this.frameId_];
        while ((_arg1 - this.frameStart_) > _local2.time_) {
            if (this.frameId_ >= (this.animationData_._2_.length - 1)) {
                return (null);
            }
            this.frameStart_ = (this.frameStart_ + _local2.time_);
            this.frameId_++;
            _local2 = this.animationData_._2_[this.frameId_];
            this.texture_ = null;
        }
        if (this.texture_ == null) {
            this.texture_ = _local2._Y_D_.getTexture((Math.random() * 100));
        }
        return (this.texture_);
    }

}

