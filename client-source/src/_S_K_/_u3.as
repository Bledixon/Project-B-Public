// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_S_K_._u3

package _S_K_ {
import flash.events.IEventDispatcher;
import flash.utils.getQualifiedClassName;
import flash.events.Event;

import _sp._09K_;

public class _u3 extends _u1 {

    public function _u3(_arg1:IEventDispatcher, _arg2:String, _arg3:Class = null, ..._args) {
        super(_arg1, _arg2, _arg3);
        this.valueClasses = _args;
    }
    private var _I_:Function = null;

    override public function get eventClass():Class {
        return (_1j);
    }

    override public function set eventClass(_arg1:Class):void {
        _1j = _arg1;
    }

    override public function set valueClasses(_arg1:Array):void {
        _wU_ = ((_arg1) ? _arg1.slice() : []);
        var _local2:int = _wU_.length;
        while (_local2--) {
            if (!(_wU_[_local2] is Class)) {
                throw (new ArgumentError((((((("Invalid valueClasses argument: " + "item at index ") + _local2) + " should be a Class but was:<") + _wU_[_local2]) + ">.") + getQualifiedClassName(_wU_[_local2]))));
            }
        }
    }

    protected function get _oS_():Function {
        return (this._I_);
    }

    public function mapTo(...objectListOrFunction):_u3 {
        if ((((objectListOrFunction.length == 1)) && ((objectListOrFunction[0] is Function)))) {
            this._I_ = (objectListOrFunction[0] as Function);
            if (this._I_.length > 1) {
                throw (new ArgumentError((("Mapping function has " + this._I_.length) + " arguments but it needs zero or one of type Event")));
            }
        } else {
            this._I_ = function ():Object {
                return (objectListOrFunction);
            };
        }
        return (this);
    }

    override public function dispatchEvent(_arg1:Event):Boolean {
        var _local4:Array;
        var _local5:Object;
        var _local6:Class;
        var _local7:int;
        var _local2:Object = this._0o(_arg1);
        var _local3:int = valueClasses.length;
        if ((_local2 is Array)) {
            _local4 = (_local2 as Array);
            _local7 = 0;
            while (_local7 < _local3) {
                _local5 = _local4[_local7];
                _local6 = valueClasses[_local7];
                if (!(((_local5 === null)) || ((_local5 is _local6)))) {
                    throw (new ArgumentError((((("Value object <" + _local5) + "> is not an instance of <") + _local6) + ">.")));
                }
                _local7++;
            }
        } else {
            if (_local3 > 1) {
                throw (new ArgumentError("Expected more than one value."));
            }
            if (!(_local2 is valueClasses[0])) {
                throw (new ArgumentError((((("Mapping returned " + getQualifiedClassName(_local2)) + ", expected ") + valueClasses[0]) + ".")));
            }
        }
        return (super.dispatchEvent(_arg1));
    }

    override protected function onNativeEvent(_arg1:Event):void {
        var _local4:Array;
        var _local2:Object = this._0o(_arg1);
        var _local3:_09K_ = _01p;
        if ((_local2 is Array)) {
            if ((((valueClasses.length == 1)) && ((valueClasses[0] == Array)))) {
                while (_local3.nonEmpty) {
                    _local3._G_W_.execute1(_local2);
                    _local3 = _local3._U_H_;
                }
            } else {
                _local4 = (_local2 as Array);
                while (_local3.nonEmpty) {
                    _local3._G_W_.execute(_local4);
                    _local3 = _local3._U_H_;
                }
            }
        } else {
            while (_local3.nonEmpty) {
                _local3._G_W_.execute1(_local2);
                _local3 = _local3._U_H_;
            }
        }
    }

    protected function _0o(_arg1:Event):Object {
        if (this._oS_ != null) {
            if (this._oS_.length == 1) {
                return (this._oS_(_arg1));
            }
            return (this._oS_());
        }
        if (valueClasses.length == 0) {
            return ([]);
        }
        throw (new ArgumentError((("There are valueClasses set to be dispatched <" + valueClasses) + "> but mappingFunction is null.")));
    }

}
}//package _S_K_

