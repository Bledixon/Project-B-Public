// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_sp._0J_G_

package _sp {
import flash.utils.getQualifiedClassName;
import flash.errors.IllegalOperationError;

public class _0J_G_ implements _F_6 {

    public function _0J_G_(..._args) {
        this._01p = _09K_.NIL;
        super();
        this.valueClasses = (((((_args.length == 1)) && ((_args[0] is Array)))) ? _args[0] : _args);
    }
    protected var _wU_:Array;
    protected var _01p:_09K_;

    public function get valueClasses():Array {
        return (this._wU_);
    }

    public function set valueClasses(_arg1:Array):void {
        this._wU_ = ((_arg1) ? _arg1.slice() : []);
        var _local2:int = this._wU_.length;
        while (_local2--) {
            if (!(this._wU_[_local2] is Class)) {
                throw (new ArgumentError((((((("Invalid valueClasses argument: " + "item at index ") + _local2) + " should be a Class but was:<") + this._wU_[_local2]) + ">.") + getQualifiedClassName(this._wU_[_local2]))));
            }
        }
    }

    public function get _xk():uint {
        return (this._01p.length);
    }

    public function addOnce(_arg1:Function):_xN_ {
        return (this._F_R_(_arg1, true));
    }

    public function remove(_arg1:Function):_xN_ {
        var _local2:_xN_ = this._01p.find(_arg1);
        if (!_local2) {
            return (null);
        }
        this._01p = this._01p._Y_f(_arg1);
        return (_local2);
    }

    public function removeAll():void {
        this._01p = _09K_.NIL;
    }

    public function dispatch(..._args):void {
        var _local2:int = this._wU_.length;
        var _local3:int = _args.length;
        if (_local3 < _local2) {
            throw (new ArgumentError(((((("Incorrect number of arguments. " + "Expected at least ") + _local2) + " but received ") + _local3) + ".")));
        }
        var _local4:int;
        while (_local4 < _local2) {
            if (!(((_args[_local4] is this._wU_[_local4])) || ((_args[_local4] === null)))) {
                throw (new ArgumentError((((("Value object <" + _args[_local4]) + "> is not an instance of <") + this._wU_[_local4]) + ">.")));
            }
            _local4++;
        }
        var _local5:_09K_ = this._01p;
        if (_local5.nonEmpty) {
            while (_local5.nonEmpty) {
                _local5._G_W_.execute(_args);
                _local5 = _local5._U_H_;
            }
        }
    }

    protected function _F_R_(_arg1:Function, _arg2:Boolean = false):_xN_ {
        var _local3:_xN_;
        if (this._L_l(_arg1, _arg2)) {
            _local3 = new Slot(_arg1, this, _arg2);
            this._01p = this._01p.prepend(_local3);
            return (_local3);
        }
        return (this._01p.find(_arg1));
    }

    protected function _L_l(_arg1:Function, _arg2:Boolean):Boolean {
        if (!this._01p.nonEmpty) {
            return (true);
        }
        var _local3:_xN_ = this._01p.find(_arg1);
        if (!_local3) {
            return (true);
        }
        if (_local3.once != _arg2) {
            throw (new IllegalOperationError("You cannot addOnce() then add() the same listener without removing the relationship first."));
        }
        return (false);
    }

}
}//package _sp

