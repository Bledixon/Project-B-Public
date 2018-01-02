// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_9W_._J_6

package _9W_ {
import _03T_._078;

import _0_p._Q_5;

import _eZ_._08b;

import _s3._im;

import _0_p._L_y;

import flash.display.DisplayObjectContainer;

import _lo._nR_;

public class _J_6 {

    private const _ul:String = _078.create(_J_6);

    public function _J_6(_arg1:_L_y, _arg2:_im) {
        this._eo = _arg1._0H_4(this);
        this._vz = _arg1._O_R_;
        this._yv = _arg2;
        _arg1._iL_._kf(this.destroy);
        this.init();
    }
    private var _eo:_Q_5;
    private var _vz:_08b;
    private var _yv:_im;
    private var _xO_:_L_y;

    public function toString():String {
        return (this._ul);
    }

    private function init():void {
        var _local1:DisplayObjectContainer;
        for each (_local1 in this._yv._07z) {
            this._eo.debug("Adding context existence event listener to container {0}", [_local1]);
            _local1.addEventListener(ModularContextEvent._qb, this._R_);
        }
        this._yv.addEventListener(_nR_._0K_h, this._wC_);
        this._yv.addEventListener(_nR_._mh, this._B_8);
    }

    private function destroy():void {
        var _local1:DisplayObjectContainer;
        for each (_local1 in this._yv._07z) {
            this._eo.debug("Removing context existence event listener from container {0}", [_local1]);
            _local1.removeEventListener(ModularContextEvent._qb, this._R_);
        }
        this._yv.removeEventListener(_nR_._0K_h, this._wC_);
        this._yv.removeEventListener(_nR_._mh, this._B_8);
        if (this._xO_) {
            this._eo.debug("Unlinking parent injector for child context {0}", [this._xO_]);
            this._xO_._O_R_._k = null;
        }
    }

    private function _wC_(_arg1:_nR_):void {
        this._eo.debug("Adding context existence event listener to container {0}", [_arg1.container]);
        _arg1.container.addEventListener(ModularContextEvent._qb, this._R_);
    }

    private function _B_8(_arg1:_nR_):void {
        this._eo.debug("Removing context existence event listener from container {0}", [_arg1.container]);
        _arg1.container.removeEventListener(ModularContextEvent._qb, this._R_);
    }

    private function _R_(_arg1:ModularContextEvent):void {
        _arg1.stopImmediatePropagation();
        this._xO_ = _arg1.context;
        this._eo.debug("Context existence event caught. Configuring child context {0}", [this._xO_]);
        this._xO_._O_R_._k = this._vz;
    }

}
}//package _9W_

