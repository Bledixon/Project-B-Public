// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.map._C_O_

package com.company.assembleegameclient.map {
import com.company.assembleegameclient.objects._Z_H_;

import flash.display.BitmapData;

import com.company.util.BitmapUtil;


public class _C_O_ {

    public function _C_O_(_arg1:XML) {
        this.animate_ = new _M_X_();
        super();
        this.type_ = int(_arg1.@type);
        this.id_ = String(_arg1.@id);
        this._b5 = _arg1.hasOwnProperty("NoWalk");
        if (_arg1.hasOwnProperty("MinDamage")) {
            this.minDamage_ = int(_arg1.MinDamage);
        }
        if (_arg1.hasOwnProperty("MaxDamage")) {
            this.maxDamage_ = int(_arg1.MaxDamage);
        }
        this.push_ = _arg1.hasOwnProperty("Push");
        if (_arg1.hasOwnProperty("Animate")) {
            this.animate_._7N_(XML(_arg1.Animate));
        }
        if (_arg1.hasOwnProperty("BlendPriority")) {
            this._9r = int(_arg1.BlendPriority);
        }
        if (_arg1.hasOwnProperty("CompositePriority")) {
            this._O_q = int(_arg1.CompositePriority);
        }
        if (_arg1.hasOwnProperty("Speed")) {
            this.speed_ = Number(_arg1.Speed);
        }
        this._zT_ = ((_arg1.hasOwnProperty("XOffset")) ? Number(_arg1.XOffset) : 0);
        this._P_U_ = ((_arg1.hasOwnProperty("YOffset")) ? Number(_arg1.YOffset) : 0);
        this.push_ = _arg1.hasOwnProperty("Push");
        this.sink_ = _arg1.hasOwnProperty("Sink");
        this._rr = _arg1.hasOwnProperty("Sinking");
        this._wX_ = _arg1.hasOwnProperty("RandomOffset");
        if (_arg1.hasOwnProperty("Edge")) {
            this._0H_U_ = true;
            this._lK_ = new _Z_H_(XML(_arg1.Edge));
            if (_arg1.hasOwnProperty("Corner")) {
                this._uk = new _Z_H_(XML(_arg1.Corner));
            }
            if (_arg1.hasOwnProperty("InnerCorner")) {
                this._03g = new _Z_H_(XML(_arg1.InnerCorner));
            }
        }
        this._M_e = _arg1.hasOwnProperty("SameTypeEdgeMode");
        if (_arg1.hasOwnProperty("Top")) {
            this._S_7 = new _Z_H_(XML(_arg1.Top));
            this._003 = new _M_X_();
            if (_arg1.hasOwnProperty("TopAnimate")) {
                this._003._7N_(XML(_arg1.TopAnimate));
            }
        }
    }
    public var type_:int;
    public var id_:String;
    public var _b5:Boolean = true;
    public var minDamage_:int = 0;
    public var maxDamage_:int = 0;
    public var animate_:_M_X_;
    public var _9r:int = -1;
    public var _O_q:int = 0;
    public var speed_:Number = 1;
    public var _zT_:Number = 0;
    public var _P_U_:Number = 0;
    public var push_:Boolean = false;
    public var sink_:Boolean = false;
    public var _rr:Boolean = false;
    public var _wX_:Boolean = false;
    public var _0H_U_:Boolean = false;
    public var _M_e:Boolean = false;
    public var _S_7:_Z_H_ = null;
    public var _003:_M_X_ = null;
    private var _lK_:_Z_H_ = null;
    private var _uk:_Z_H_ = null;
    private var _03g:_Z_H_ = null;
    private var _07o:Vector.<BitmapData> = null;
    private var _02P_:Vector.<BitmapData> = null;

    public function _yf():Vector.<BitmapData> {
        if (((!(this._0H_U_)) || (!((this._07o == null))))) {
            return (this._07o);
        }
        this._07o = new Vector.<BitmapData>(9);
        this._07o[3] = this._lK_.getTexture(0);
        this._07o[1] = BitmapUtil._c(this._07o[3], 1);
        this._07o[5] = BitmapUtil._c(this._07o[3], 2);
        this._07o[7] = BitmapUtil._c(this._07o[3], 3);
        if (this._uk != null) {
            this._07o[0] = this._uk.getTexture(0);
            this._07o[2] = BitmapUtil._c(this._07o[0], 1);
            this._07o[8] = BitmapUtil._c(this._07o[0], 2);
            this._07o[6] = BitmapUtil._c(this._07o[0], 3);
        }
        return (this._07o);
    }

    public function _05n():Vector.<BitmapData> {
        if ((((this._03g == null)) || (!((this._02P_ == null))))) {
            return (this._02P_);
        }
        this._02P_ = this._07o.concat();
        this._02P_[0] = this._03g.getTexture(0);
        this._02P_[2] = BitmapUtil._c(this._02P_[0], 1);
        this._02P_[8] = BitmapUtil._c(this._02P_[0], 2);
        this._02P_[6] = BitmapUtil._c(this._02P_[0], 3);
        return (this._02P_);
    }

}
}//package com.company.assembleegameclient.map

