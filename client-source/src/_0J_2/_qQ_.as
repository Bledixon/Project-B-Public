// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0J_2._qQ_

package _0J_2 {
import _U_5._dd;

import _04w._07V_;

import _W_D_._0I_H_;

import _02b._0D_5;

import _4X_._E_h;

import com.company.assembleegameclient.parameters.Parameters;

import _4X_._o8;
import _4X_._0G_R_;

import com.company.assembleegameclient.net.Server;

import flash.utils.ByteArray;

import com.company.assembleegameclient.appengine.Server_list;
import com.company.assembleegameclient.game.GameSprite;

public class _qQ_ {

    [Inject]
    public var _T__:_dd;
    [Inject]
    public var data:_07V_;
    [Inject]
    public var _0I_s:_0I_H_;
    [Inject]
    public var _ys:_0D_5;
    [Inject]
    public var _H_d:_E_h;

    public function execute():void {
        this._U_X_();
        this._03w();
    }

    private function _U_X_():void {
        Parameters.data_.charIdUseMap[this.data.charId] = new Date().time;
        Parameters.save();
    }

    private function _03w():void {
        var _local1:_o8;
        if (!this.data._0_E_) {
            this._6s();
        } else {
            _local1 = new _o8();
            _local1.add(new _0G_R_(this._6s));
            _local1.add(this._ys);
            this._H_d.add(_local1);
            _local1.start();
        }
    }

    private function _6s():void {
        var _local1:Server = ((this.data._0L_9) || (this._0I_s._T_1._04D_()));
        var _local2:int = ((this.data._05d) ? this._0J_t() : this.data._0A_6);
        var _local3:Boolean = this.data._0_E_;
        var _local4:int = this.data.charId;
        var _local5:int = ((this.data._05d) ? -1 : this.data._f2);
        var _local6:ByteArray = this.data.key;
        var _local7:Server_list = this._0I_s._T_1;
        this._0I_s._sy = _local4;
        this._T__.dispatch(new GameSprite(_local1, _local2, _local3, _local4, _local5, _local6, _local7, null));
    }

    private function _0J_t():int {
        if (Parameters.data_.needsTutorial) {
            return (Parameters.TUT_ID);
        }
        if (Parameters.data_.needsRandomRealm) {
            return (Parameters.RAND_REALM);
        }
        if (Parameters.data_.needsNexusTutorial) {
            Parameters.data_.needsNexusTutorial = false;
            Parameters.save();
            return (Parameters.NEXUS_LIMBO);
        }
        return (Parameters.NEXUS_ID);
    }

}
}//package _0J_2

