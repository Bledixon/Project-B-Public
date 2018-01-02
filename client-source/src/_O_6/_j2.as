// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_O_6._j2

package _O_6 {
import _A_G_._0A_Z_;

import flash.utils.Dictionary;

import _A_G_._07A_;
import _A_G_._08I_;

import flash.display.DisplayObject;

public class _j2 implements _0A_Z_ {

    private const _0K_E_:Array = [];

    public function _j2(_arg1:_07A_):void {
        this._vq = new Dictionary(true);
        super();
        this._factory = _arg1;
    }
    private var _vq:Dictionary;
    private var _factory:_07A_;

    public function _J_w(_arg1:_08I_):void {
        var _local2:int = this._0K_E_.indexOf(_arg1);
        if (_local2 > -1) {
            return;
        }
        this._0K_E_.push(_arg1);
        this._0B_i();
    }

    public function _0A_W_(_arg1:_08I_):void {
        var _local2:int = this._0K_E_.indexOf(_arg1);
        if (_local2 == -1) {
            return;
        }
        this._0K_E_.splice(_local2, 1);
        this._0B_i();
    }

    public function _H_3(_arg1:DisplayObject, _arg2:Class):void {
        var _local3:Array = this._uY_(_arg1, _arg2);
        if (_local3) {
            this._factory._06C_(_arg1, _arg2, _local3);
        }
    }

    public function _O_4(_arg1:Object, _arg2:Class):void {
        var _local3:Array = this._uY_(_arg1, _arg2);
        if (_local3) {
            this._factory._06C_(_arg1, _arg2, _local3);
        }
    }

    private function _0B_i():void {
        this._vq = new Dictionary(true);
    }

    private function _uY_(_arg1:Object, _arg2:Class):Array {
        var _local3:_08I_;
        if (this._vq[_arg2] === false) {
            return (null);
        }
        if (this._vq[_arg2] == undefined) {
            this._vq[_arg2] = false;
            for each (_local3 in this._0K_E_) {
                _local3._ok();
                if (_local3._01g.matches(_arg1)) {
                    this._vq[_arg2] = ((this._vq[_arg2]) || ([]));
                    this._vq[_arg2].push(_local3);
                }
            }
            if (this._vq[_arg2] === false) {
                return (null);
            }
        }
        return ((this._vq[_arg2] as Array));
    }

}
}//package _O_6

