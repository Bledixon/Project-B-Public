// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_lo._5u

package _lo {
import flash.events.EventDispatcher;

import _s3._im;

import flash.display.DisplayObjectContainer;

import _s3._yp;


public class _5u extends EventDispatcher implements _im {

    private const _H_x:Vector.<DisplayObjectContainer> = new Vector.<DisplayObjectContainer>();
    private const _handlers:Vector.<_yp> = new Vector.<_yp>();

    public function _5u(_arg1:_t5) {
        this._055 = _arg1;
    }
    private var _055:_t5;

    public function get _07z():Vector.<DisplayObjectContainer> {
        return (this._H_x);
    }

    public function _tP_(_arg1:DisplayObjectContainer):void {
        var _local2:_yp;
        if (!this._07y(_arg1)) {
            return;
        }
        this._H_x.push(_arg1);
        for each (_local2 in this._handlers) {
            this._055._tP_(_arg1)._0_m(_local2);
        }
        dispatchEvent(new _nR_(_nR_._0K_h, _arg1));
    }

    public function _function(_arg1:DisplayObjectContainer):void {
        var _local4:_yp;
        var _local2:int = this._H_x.indexOf(_arg1);
        if (_local2 == -1) {
            return;
        }
        this._H_x.splice(_local2, 1);
        var _local3:_02f = this._055._3N_(_arg1);
        for each (_local4 in this._handlers) {
            _local3._K_y(_local4);
        }
        dispatchEvent(new _nR_(_nR_._mh, _arg1));
    }

    public function _eq(_arg1:_yp):void {
        var _local2:DisplayObjectContainer;
        if (this._handlers.indexOf(_arg1) != -1) {
            return;
        }
        this._handlers.push(_arg1);
        for each (_local2 in this._H_x) {
            this._055._tP_(_local2)._0_m(_arg1);
        }
        dispatchEvent(new _nR_(_nR_._M_U_, null, _arg1));
    }

    public function _9k(_arg1:_yp):void {
        var _local3:DisplayObjectContainer;
        var _local2:int = this._handlers.indexOf(_arg1);
        if (_local2 == -1) {
            return;
        }
        this._handlers.splice(_local2, 1);
        for each (_local3 in this._H_x) {
            this._055._3N_(_local3)._K_y(_arg1);
        }
        dispatchEvent(new _nR_(_nR_._T_A_, null, _arg1));
    }

    public function _F_P_():void {
        var _local1:DisplayObjectContainer;
        var _local2:_02f;
        var _local3:_yp;
        for each (_local1 in this._H_x) {
            _local2 = this._055._3N_(_local1);
            for each (_local3 in this._handlers) {
                _local2._K_y(_local3);
            }
        }
    }

    private function _07y(_arg1:DisplayObjectContainer):Boolean {
        var _local2:DisplayObjectContainer;
        for each (_local2 in this._H_x) {
            if (_arg1 == _local2) {
                return (false);
            }
            if (((_local2.contains(_arg1)) || (_arg1.contains(_local2)))) {
                throw (new Error("Containers can not be nested"));
            }
        }
        return (true);
    }

}
}//package _lo

