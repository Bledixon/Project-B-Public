// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_S_K_._u1

package _S_K_ {
import _sp._aJ_;

import flash.events.IEventDispatcher;
import flash.events.Event;

import _sp._xN_;
import _sp._09K_;
import _sp.Slot;

public class _u1 extends _aJ_ implements _j3 {

    public function _u1(_arg1:IEventDispatcher, _arg2:String, _arg3:Class = null) {
        super(((_arg3) || (Event)));
        this._S_b = _arg2;
        this.eventClass = _arg3;
        this.target = _arg1;
    }
    protected var _R_d:IEventDispatcher;
    protected var _bC_:String;
    protected var _1j:Class;

    override public function set valueClasses(_arg1:Array):void {
        this.eventClass = ((((_arg1) && ((_arg1.length > 0)))) ? _arg1[0] : null);
    }

    public function get target():IEventDispatcher {
        return (this._R_d);
    }

    public function set target(_arg1:IEventDispatcher):void {
        if (_arg1 == this._R_d) {
            return;
        }
        if (this._R_d) {
            this.removeAll();
        }
        this._R_d = _arg1;
    }

    public function get _S_b():String {
        return (this._bC_);
    }

    public function set _S_b(_arg1:String):void {
        this._bC_ = _arg1;
    }

    public function get eventClass():Class {
        return (this._1j);
    }

    public function set eventClass(_arg1:Class):void {
        this._1j = ((_arg1) || (Event));
        _wU_ = [this._1j];
    }

    override public function add(_arg1:Function):_xN_ {
        return (this._z(_arg1));
    }

    override public function addOnce(_arg1:Function):_xN_ {
        return (this._J_E_(_arg1));
    }

    override public function remove(_arg1:Function):_xN_ {
        var _local2:Boolean = _01p.nonEmpty;
        var _local3:_xN_ = super.remove(_arg1);
        if (_local2 != _01p.nonEmpty) {
            this.target.removeEventListener(this._S_b, this.onNativeEvent);
        }
        return (_local3);
    }

    override public function removeAll():void {
        if (this.target) {
            this.target.removeEventListener(this._S_b, this.onNativeEvent);
        }
        super.removeAll();
    }

    override public function dispatch(..._args):void {
        if (null == _args) {
            throw (new ArgumentError("Event object expected."));
        }
        if (_args.length != 1) {
            throw (new ArgumentError("No more than one Event object expected."));
        }
        this.dispatchEvent((_args[0] as Event));
    }

    public function _z(_arg1:Function, _arg2:int = 0):_xN_ {
        return (this._0C_w(_arg1, false, _arg2));
    }

    public function _J_E_(_arg1:Function, _arg2:int = 0):_xN_ {
        return (this._0C_w(_arg1, true, _arg2));
    }

    protected function _0C_w(_arg1:Function, _arg2:Boolean = false, _arg3:int = 0):_xN_ {
        if (!this.target) {
            throw (new ArgumentError("Target object cannot be null."));
        }
        var _local4:Boolean = _01p.nonEmpty;
        var _local5:_xN_;
        if (_L_l(_arg1, _arg2)) {
            _local5 = new Slot(_arg1, this, _arg2, _arg3);
            _01p = _01p.insertWithPriority(_local5);
        } else {
            _local5 = _01p.find(_arg1);
        }
        if (_local4 != _01p.nonEmpty) {
            this.target.addEventListener(this._S_b, this.onNativeEvent, false, _arg3);
        }
        return (_local5);
    }

    public function dispatchEvent(_arg1:Event):Boolean {
        if (!this.target) {
            throw (new ArgumentError("Target object cannot be null."));
        }
        if (!_arg1) {
            throw (new ArgumentError("Event object cannot be null."));
        }
        if (!(_arg1 is this.eventClass)) {
            throw (new ArgumentError((((("Event object " + _arg1) + " is not an instance of ") + this.eventClass) + ".")));
        }
        if (_arg1.type != this._S_b) {
            throw (new ArgumentError((((("Event object has incorrect type. Expected <" + this._S_b) + "> but was <") + _arg1.type) + ">.")));
        }
        return (this.target.dispatchEvent(_arg1));
    }

    protected function onNativeEvent(_arg1:Event):void {
        var _local2:_09K_ = _01p;
        while (_local2.nonEmpty) {
            _local2._G_W_.execute1(_arg1);
            _local2 = _local2._U_H_;
        }
    }

}
}//package _S_K_

