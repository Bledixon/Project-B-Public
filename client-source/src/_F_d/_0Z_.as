// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_F_d._0Z_

package _F_d {
import _0_p._D_v;

import _03T_._078;

import _0_p._L_y;

import _eZ_._08b;

import _0_p._Q_5;

import flash.display.DisplayObjectContainer;

import _9W_.ModularContextEvent;

import _s3._im;

import _9W_._J_6;
import _9W_._we;

public class _0Z_ implements _D_v {

    private const _ul:String = _078.create(_0Z_);

    public function _0Z_(_arg1:Boolean = true, _arg2:Boolean = true) {
        this._eW_ = _arg1;
        this._extends = _arg2;
    }
    private var _rA_:_L_y;
    private var _vz:_08b;
    private var _eo:_Q_5;
    private var _eW_:Boolean;
    private var _extends:Boolean;

    public function extend(_arg1:_L_y):void {
        this._rA_ = _arg1;
        this._vz = _arg1._O_R_;
        this._eo = _arg1._0H_4(this);
        this._rA_._iL_._8u(this._8u);
    }

    public function toString():String {
        return (this._ul);
    }

    private function _8u():void {
        ((this._eW_) && (this._R_L_()));
        ((this._extends) && (this._03p()));
    }

    private function _R_L_():void {
        var _local1:DisplayObjectContainer;
        if (this._vz._d6(DisplayObjectContainer)) {
            this._eo.debug("Context configured to inherit. Broadcasting existence event...");
            _local1 = this._vz.getInstance(DisplayObjectContainer);
            _local1.dispatchEvent(new ModularContextEvent(ModularContextEvent._qb, this._rA_));
        } else {
            this._eo._0E_Q_("Context has been configured to inherit dependencies but has no way to do so");
        }
    }

    private function _03p():void {
        var _local1:_im;
        var _local2:DisplayObjectContainer;
        if (this._vz._d6(_im)) {
            this._eo.debug("Context has a ViewManager. Configuring view manager based context existence watcher...");
            _local1 = this._vz.getInstance(_im);
            new _J_6(this._rA_, _local1);
        } else {
            if (this._vz._d6(DisplayObjectContainer)) {
                this._eo.debug("Context has a ContextView. Configuring context view based context existence watcher...");
                _local2 = this._vz.getInstance(DisplayObjectContainer);
                new _we(this._rA_, _local2);
            } else {
                this._eo._0E_Q_("Context has been configured to expose its dependencies but has no way to do so");
            }
        }
    }

}
}//package _F_d

