// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_05R_.GTween

package _05R_ {
import flash.events.EventDispatcher;
import flash.display.Shape;
import flash.utils.Dictionary;
import flash.events.Event;
import flash.utils.getTimer;
import flash.events.IEventDispatcher;

public class GTween extends EventDispatcher {

    {
        _7p();
    }
    public static var version:Number = 2.01;
    public static var _5V_:Boolean = false;
    public static var _hu:Function = _I_R_;
    public static var _00j:Boolean = false;
    public static var _dl:Number = 1;
    protected static var _I_l:Boolean = false;
    protected static var _05A_:Object = {};
    protected static var _kb:Shape;
    protected static var time:Number;
    protected static var _0J_H_:Dictionary = new Dictionary(true);
    protected static var _Y_g:Dictionary = new Dictionary(false);

    public static function _y2(_arg1:Object, _arg2:Array, _arg3:Boolean = false):void {
        var _local5:String;
        var _local4:uint;
        while (_local4 < _arg2.length) {
            _local5 = _arg2[_local4];
            if (_local5 == "*") {
                _I_l = true;
            }
            if (_05A_[_local5] == null) {
                _05A_[_local5] = [_arg1];
            } else {
                if (_arg3) {
                    _05A_[_local5].unshift(_arg1);
                } else {
                    _05A_[_local5].push(_arg1);
                }
            }
            _local4++;
        }
    }

    public static function _I_R_(_arg1:Number, _arg2:Number, _arg3:Number, _arg4:Number):Number {
        return (_arg1);
    }

    protected static function _7p():void {
        (_kb = new Shape()).addEventListener(Event.ENTER_FRAME, _kk);
        time = (getTimer() / 1000);
    }

    public function GTween(_arg1:Object = null, _arg2:Number = 1, _arg3:Object = null, _arg4:Object = null, _arg5:Object = null) {
        var _local6:Boolean;
        super();
        this.ease = _hu;
        this._C_c = _5V_;
        this.target = _arg1;
        this.duration = _arg2;
        this._dz = this._7W_(_arg5, {});
        if (_arg4) {
            _local6 = _arg4.swapValues;
            delete _arg4.swapValues;
        }
        this._7W_(_arg4, this);
        this._8f(_arg3);
        if (_local6) {
            this.swapValues();
        }
        if ((((((this.duration == 0)) && ((this._K_p == 0)))) && (this._O_p))) {
            this.position = 0;
        }
    }
    public var _O_p:Boolean = true;
    public var data;
    public var duration:Number;
    public var ease:Function;
    public var _0E_A_:GTween;
    public var _dz:Object;
    public var _S_A_:Boolean;
    public var _0H_o:int = 1;
    public var target:Object;
    public var _08W_:Boolean;
    public var _5r:Number = 1;
    public var _0F_8:Number;
    public var _0D_S_:Number;
    public var _4Q_:Number;
    public var _04y:Number;
    public var _65:Number;
    public var _0M_W_:Boolean;
    public var _C_c:Boolean;
    public var onComplete:Function;
    public var _bR_:Function;
    public var _mc:Function;
    protected var _07S_:Number = 0;
    protected var _9J_:Object;
    protected var _gn:Boolean = true;
    protected var _qL_:Number;
    protected var _0J_d:Boolean;
    protected var _0H_8:Object;
    protected var _k7:Object;

    protected var _proxy:TargetProxy;

    public function get proxy():TargetProxy {
        if (this._proxy == null) {
            this._proxy = new TargetProxy(this);
        }
        return (this._proxy);
    }

    public function get _04u():Boolean {
        return (this._gn);
    }

    public function set _04u(_arg1:Boolean):void {
        if (_arg1 == this._gn) {
            return;
        }
        this._gn = _arg1;
        if (this._gn) {
            delete _0J_H_[this];
            if ((this.target is IEventDispatcher)) {
                this.target.removeEventListener("_", this._0D_p);
            }
            delete _Y_g[this];
        } else {
            if (((isNaN(this._qL_)) || (((!((this._0H_o == 0))) && ((this._qL_ >= (this._0H_o * this.duration))))))) {
                this._0J_d = false;
                this._04y = (this._65 = (this._0D_S_ = (this._4Q_ = (this._0F_8 = 0))));
                this._qL_ = -(this._K_p);
            }
            _0J_H_[this] = true;
            if ((this.target is IEventDispatcher)) {
                this.target.addEventListener("_", this._0D_p);
            } else {
                _Y_g[this] = true;
            }
        }
    }

    public function get position():Number {
        return (this._qL_);
    }

    public function set position(_arg1:Number):void {
        var _local4:String;
        var _local5:Number;
        var _local6:Number;
        var _local7:Number;
        var _local8:Array;
        var _local9:uint;
        var _local10:uint;
        this._0F_8 = this._qL_;
        this._4Q_ = this._0D_S_;
        this._65 = this._04y;
        var _local2:Number = (this._0H_o * this.duration);
        var _local3:Boolean = (((_arg1 >= _local2)) && ((this._0H_o > 0)));
        if (_local3) {
            if (this._65 == _local2) {
                return;
            }
            this._qL_ = _local2;
            this._04y = ((((this._S_A_) && (!((this._0H_o && 1))))) ? 0 : this.duration);
        } else {
            this._qL_ = _arg1;
            this._04y = (((this._qL_ < 0)) ? 0 : (this._qL_ % this.duration));
            if (((this._S_A_) && (((this._qL_ / this.duration) && 1)))) {
                this._04y = (this.duration - this._04y);
            }
        }
        this._0D_S_ = (((((this.duration == 0)) && ((this._qL_ >= 0)))) ? 1 : this.ease((this._04y / this.duration), 0, 1, 1));
        if (((((this.target) && ((((this._qL_ >= 0)) || ((this._0F_8 >= 0)))))) && (!((this._04y == this._65))))) {
            if (!this._0J_d) {
                this.init();
            }
            for (_local4 in this._9J_) {
                _local5 = this._0H_8[_local4];
                _local6 = this._k7[_local4];
                _local7 = (_local5 + (_local6 * this._0D_S_));
                _local8 = _05A_[_local4];
                if (_local8) {
                    _local9 = _local8.length;
                    _local10 = 0;
                    while (_local10 < _local9) {
                        _local7 = _local8[_local10].tween(this, _local4, _local7, _local5, _local6, this._0D_S_, _local3);
                        _local10++;
                    }
                    if (!isNaN(_local7)) {
                        this.target[_local4] = _local7;
                    }
                } else {
                    this.target[_local4] = _local7;
                }
            }
        }
        if (_I_l) {
            _local8 = _05A_["*"];
            _local9 = _local8.length;
            _local10 = 0;
            while (_local10 < _local9) {
                _local8[_local10].tween(this, "*", NaN, NaN, NaN, this._0D_S_, _local3);
                _local10++;
            }
        }
        if (!this._0M_W_) {
            if (this._C_c) {
                this._S_R_("change");
            }
            if (this._bR_ != null) {
                this._bR_(this);
            }
        }
        if (_local3) {
            this._04u = true;
            if (this._0E_A_) {
                this._0E_A_._04u = false;
            }
            if (!this._0M_W_) {
                if (this._C_c) {
                    this._S_R_("complete");
                }
                if (this.onComplete != null) {
                    this.onComplete(this);
                }
            }
        }
    }

    public function get _K_p():Number {
        return (this._07S_);
    }

    public function set _K_p(_arg1:Number):void {
        if (this._qL_ <= 0) {
            this._qL_ = -(_arg1);
        }
        this._07S_ = _arg1;
    }

    public function setValue(_arg1:String, _arg2:Number):void {
        this._9J_[_arg1] = _arg2;
        this._0D_p();
    }

    public function getValue(_arg1:String):Number {
        return (this._9J_[_arg1]);
    }

    public function _V_6(_arg1:String):Boolean {
        delete this._k7[_arg1];
        delete this._0H_8[_arg1];
        return (delete this._9J_[_arg1]);
    }

    public function _aX_(_arg1:Object):void {
        this._7W_(_arg1, this._9J_, true);
        this._0D_p();
    }

    public function _8f(_arg1:Object = null):void {
        this._9J_ = {};
        this._aX_(_arg1);
    }

    public function _0A_a():Object {
        return (this._7W_(this._9J_, {}));
    }

    public function _0A_J_(_arg1:String):Number {
        return (this._0H_8[_arg1]);
    }

    public function swapValues():void {
        var _local2:String;
        var _local3:Number;
        if (!this._0J_d) {
            this.init();
        }
        var _local1:Object = this._9J_;
        this._9J_ = this._0H_8;
        this._0H_8 = _local1;
        for (_local2 in this._k7) {
            this._k7[_local2] = (this._k7[_local2] * -1);
        }
        if (this._qL_ < 0) {
            _local3 = this._0F_8;
            this.position = 0;
            this._qL_ = this._0F_8;
            this._0F_8 = _local3;
        } else {
            this.position = this._qL_;
        }
    }

    public function init():void {
        var _local1:String;
        var _local2:Array;
        var _local3:uint;
        var _local4:Number;
        var _local5:uint;
        this._0J_d = true;
        this._0H_8 = {};
        this._k7 = {};
        for (_local1 in this._9J_) {
            if (_05A_[_local1]) {
                _local2 = _05A_[_local1];
                _local3 = _local2.length;
                _local4 = (((_local1 in this.target)) ? this.target[_local1] : NaN);
                _local5 = 0;
                while (_local5 < _local3) {
                    _local4 = _local2[_local5].init(this, _local1, _local4);
                    _local5++;
                }
                if (!isNaN(_local4)) {
                    this._k7[_local1] = (this._9J_[_local1] - (this._0H_8[_local1] = _local4));
                }
            } else {
                this._k7[_local1] = (this._9J_[_local1] - (this._0H_8[_local1] = this.target[_local1]));
            }
        }
        if (_I_l) {
            _local2 = _05A_["*"];
            _local3 = _local2.length;
            _local5 = 0;
            while (_local5 < _local3) {
                _local2[_local5].init(this, "*", NaN);
                _local5++;
            }
        }
        if (!this._0M_W_) {
            if (this._C_c) {
                this._S_R_("init");
            }
            if (this._mc != null) {
                this._mc(this);
            }
        }
    }

    public function _G_s():void {
        this.position = 0;
        this._04u = true;
    }

    public function end():void {
        this.position = (((this._0H_o) > 0) ? (this._0H_o * this.duration) : this.duration);
    }

    protected function _0D_p():void {
        this._0J_d = false;
        if (this._qL_ > 0) {
            this._qL_ = 0;
        }
        if (this._O_p) {
            this._04u = false;
        }
    }

    protected function _7W_(_arg1:Object, _arg2:Object, _arg3:Boolean = false):Object {
        var _local4:String;
        for (_local4 in _arg1) {
            if (((_arg3) && ((_arg1[_local4] == null)))) {
                delete _arg2[_local4];
            } else {
                _arg2[_local4] = _arg1[_local4];
            }
        }
        return (_arg2);
    }

    protected function _S_R_(_arg1:String):void {
        if (hasEventListener(_arg1)) {
            dispatchEvent(new Event(_arg1));
        }
    }

    protected static function _kk(_arg1:Event):void {
        var _local4:Object;
        var _local5:GTween;
        var _local2:Number = time;
        time = (getTimer() / 1000);
        if (_00j) {
            return;
        }
        var _local3:Number = ((time - _local2) * _dl);
        for (_local4 in _0J_H_) {
            _local5 = (_local4 as GTween);
            _local5.position = (_local5._qL_ + (((_local5._08W_) ? _dl : _local3) * _local5._5r));
        }
    }

}
}//package _05R_

import flash.utils.Proxy;

import _05R_.GTween;

import flash.utils.flash_proxy;

use namespace flash.utils.flash_proxy;

dynamic class TargetProxy extends Proxy {

    /*private*/
    internal var tween:GTween;

    public function TargetProxy(_arg1:GTween):void {
        this.tween = _arg1;
    }

    override flash_proxy function callProperty(name:*, ...rest):* {
        return (this.tween.target[name].apply(null, name));
    }

    override flash_proxy function getProperty(name:*):* {
        var _local2:Number = this.tween.getValue(name);
        return (((isNaN(_local2)) ? this.tween.target[name] : _local2));
    }

    override flash_proxy function setProperty(_arg1:*, _arg2:*):void {
        if ((((((_arg2 is Boolean)) || ((_arg2 is String)))) || (isNaN(_arg2)))) {
            this.tween.target[_arg1] = _arg2;
        } else {
            this.tween.setValue(String(_arg1), Number(_arg2));
        }
    }

    override flash_proxy function deleteProperty(_arg1:*):Boolean {
        this.tween._V_6(_arg1);
        return (true);
    }

}

