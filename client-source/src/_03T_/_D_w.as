// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_03T_._D_w

package _03T_ {

import _0_p._I_Y_;


public class _D_w {

    private const _8e:Vector.<String> = new Vector.<String>();
    private const _0L_4:MessageDispatcher = new MessageDispatcher();
    private const _callbacks:Array = [];

    public function _D_w(_arg1:String, _arg2:_0A_P_) {
        this._name = _arg1;
        this._5O_ = _arg2;
    }
    private var _name:String;
    private var _5O_:_0A_P_;
    private var _01s:String;
    private var _finalState:String;
    private var _preTransitionEvent:String;
    private var _transitionEvent:String;
    private var _postTransitionEvent:String;
    private var _0D_g:Boolean;

    public function fromStates(..._args):_D_w {
        var _local2:String;
        for each (_local2 in _args) {
            this._8e.push(_local2);
        }
        return (this);
    }

    public function toStates(_arg1:String, _arg2:String):_D_w {
        this._01s = _arg1;
        this._finalState = _arg2;
        return (this);
    }

    public function withEvents(_arg1:String, _arg2:String, _arg3:String):_D_w {
        this._preTransitionEvent = _arg1;
        this._transitionEvent = _arg2;
        this._postTransitionEvent = _arg3;
        ((this._0D_g) && (this._5O_._J_Q_(_arg1, _arg2, _arg3)));
        return (this);
    }

    public function inReverse():_D_w {
        this._0D_g = true;
        this._5O_._J_Q_(this._preTransitionEvent, this._transitionEvent, this._postTransitionEvent);
        return (this);
    }

    public function _W_5(_arg1:Function):_D_w {
        this._0L_4._kJ_(this._name, _arg1);
        return (this);
    }

    public function enter(callback:Function = null):void {
        var initialState:String;
        if (this._5O_.state == this._finalState) {
            ((callback) && (safelyCallBack(callback, null, this._name)));
            return;
        }
        if (this._5O_.state == this._01s) {
            ((callback) && (this._callbacks.push(callback)));
            return;
        }
        if (this._me()) {
            this.reportError("Invalid transition", [callback]);
            return;
        }
        initialState = this._5O_.state;
        ((callback) && (this._callbacks.push(callback)));
        this.setState(this._01s);
        this._0L_4._0C_z(this._name, function (_arg1:Object):void {
            var _local3:Function;
            if (_arg1) {
                setState(initialState);
                reportError(_arg1, _callbacks);
                return;
            }
            dispatch(_preTransitionEvent);
            dispatch(_transitionEvent);
            setState(_finalState);
            var _local2:Array = _callbacks.concat();
            _callbacks.length = 0;
            for each (_local3 in _local2) {
                safelyCallBack(_local3, null, _name);
            }
            dispatch(_postTransitionEvent);
        }, this._0D_g);
    }

    private function _me():Boolean {
        return ((((this._8e.length > 0)) && ((this._8e.indexOf(this._5O_.state) == -1))));
    }

    private function setState(_arg1:String):void {
        ((_arg1) && (this._5O_._T_4(_arg1)));
    }

    private function dispatch(_arg1:String):void {
        if (((_arg1) && (this._5O_.hasEventListener(_arg1)))) {
            this._5O_.dispatchEvent(new _I_Y_(_arg1));
        }
    }

    private function reportError(_arg1:Object, _arg2:Array = null):void {
        var _local4:_I_Y_;
        var _local5:Function;
        var _local3:Error = (((_arg1 is Error)) ? (_arg1 as Error) : new Error(_arg1));
        if (this._5O_.hasEventListener(_I_Y_.ERROR)) {
            _local4 = new _I_Y_(_I_Y_.ERROR);
            _local4.error = _local3;
            this._5O_.dispatchEvent(_local4);
            if (_arg2) {
                for each (_local5 in _arg2) {
                    ((_local5) && (safelyCallBack(_local5, _local3, this._name)));
                }
                _arg2.length = 0;
            }
        } else {
            throw (_local3);
        }
    }

}
}//package _03T_

