// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_qY_._02O_

package _qY_ {
import _E_x._00J_;

import _E_x._K_T_;

import _sp._08P_;

import _eZ_._08b;

import flash.utils.Dictionary;
import flash.utils.describeType;

import _03T_.guardsApprove;
import _03T_.applyHooks;


public class _02O_ implements _00J_ {

    private const _0K_E_:Vector.<_K_T_> = new Vector.<_K_T_>();

    public function _02O_(_arg1:_08b, _arg2:Class, _arg3:Boolean = false) {
        this._vz = _arg1;
        this._6I_ = _arg2;
        this._once = _arg3;
        this._T_Z_ = new Dictionary(false);
        this._0G_i = new Dictionary(false);
    }
    protected var _vz:_08b;
    protected var _T_Z_:Dictionary;
    protected var _0G_i:Dictionary;
    private var _signal:_08P_;
    private var _6I_:Class;
    private var _once:Boolean;

    public function _J_w(_arg1:_K_T_):void {
        this._b4(_arg1);
        this._0K_E_.push(_arg1);
        if (this._0K_E_.length == 1) {
            this._0H_z(_arg1.commandClass);
        }
    }

    public function _0A_W_(_arg1:_K_T_):void {
        var _local2:int = this._0K_E_.indexOf(_arg1);
        if (_local2 != -1) {
            this._0K_E_.splice(_local2, 1);
            if (this._0K_E_.length == 0) {
                this._C_y(_arg1.commandClass);
            }
        }
    }

    protected function _b4(mapping:_K_T_):void {
        if (this._0G_i[mapping.commandClass]) {
            return;
        }
        if (describeType(mapping.commandClass).factory.method.(@name == "execute").length() == 0) {
            throw (new Error("Command Class must expose an execute method"));
        }
        this._0G_i[mapping.commandClass] = true;
    }

    protected function _wJ_(_arg1:_08P_, _arg2:Array, _arg3:Class, _arg4:Boolean):void {
        var _local6:_K_T_;
        var _local7:Object;
        var _local5:Vector.<_K_T_> = this._0K_E_.concat();
        for each (_local6 in _local5) {
            if (guardsApprove(_local6._0_R_, this._vz)) {
                ((this._once) && (this._0A_W_(_local6)));
                this._vz.map(_local6.commandClass)._hZ_();
                _local7 = this._Y_(_arg1.valueClasses, _arg2, _local6.commandClass);
                applyHooks(_local6._7w, this._vz);
                this._vz._1Y_(_local6.commandClass);
                _local7.execute();
                this._5v(_arg1.valueClasses, _arg2);
            }
        }
        if (this._once) {
            this._C_y(_arg3);
        }
    }

    protected function _yB_(_arg1:Array, _arg2:Array):void {
        var _local3:uint;
        while (_local3 < _arg1.length) {
            this._vz.map(_arg1[_local3])._q3(_arg2[_local3]);
            _local3++;
        }
    }

    protected function _5v(_arg1:Array, _arg2:Array):void {
        var _local3:uint;
        while (_local3 < _arg1.length) {
            this._vz._1Y_(_arg1[_local3]);
            _local3++;
        }
    }

    protected function _Y_(_arg1:Array, _arg2:Array, _arg3:Class):Object {
        this._yB_(_arg1, _arg2);
        return (this._vz.getInstance(_arg3));
    }

    protected function _T_z(_arg1:_08P_, _arg2:Class):Boolean {
        var _local3:Dictionary = this._T_Z_[_arg1];
        if (_local3 == null) {
            return (false);
        }
        var _local4:Function = _local3[_arg2];
        return (!((_local4 == null)));
    }

    private function _0H_z(commandClass:Class):void {
        if (this._T_z(this._signal, commandClass)) {
            return;
        }
        this._signal = this._vz.getInstance(this._6I_);
        this._vz.map(this._6I_)._q3(this._signal);
        var signalCommandMap:Dictionary = (this._T_Z_[this._signal] = ((this._T_Z_[this._signal]) || (new Dictionary(false))));
        var callback:Function = function ():void {
            _wJ_(_signal, arguments, commandClass, _once);
        };
        signalCommandMap[commandClass] = callback;
        this._signal.add(callback);
    }

    private function _C_y(_arg1:Class):void {
        var _local2:Dictionary = this._T_Z_[this._signal];
        if (_local2 == null) {
            return;
        }
        var _local3:Function = _local2[_arg1];
        if (_local3 == null) {
            return;
        }
        this._signal.remove(_local3);
        delete _local2[_arg1];
    }

}
}//package _qY_

