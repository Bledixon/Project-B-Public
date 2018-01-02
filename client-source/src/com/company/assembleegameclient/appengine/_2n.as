// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.appengine._2n

package com.company.assembleegameclient.appengine {
import com.company.assembleegameclient.parameters.Parameters;

import _zo._8C_;

import _qN_.Account;

import com.company.util._H_U_;

import flash.events.Event;

public class _2n extends _0B_u {

    public function _2n(_arg1:int = 0) {
        super(Parameters._fK_(), "/char", true, _arg1);
    }

    public function _H_Q_():void {
        addEventListener(_8C_.GENERIC_DATA, this._D_D_);
        var _local1:Object = Account._get().credentials();
        var _local2:Object = {
            "game_net_user_id": Account._get().gameNetworkUserId(),
            "game_net": Account._get().gameNetwork(),
            "play_platform": Account._get().playPlatform(),
            "do_login": Parameters._hk
        };
        _H_U_._t2(_local2, _local1);
        sendRequest("list", _local2);
        Parameters._hk = false;
    }

    public function deleteCharacter(_arg1:int):void {
        addEventListener(_8C_.GENERIC_DATA, this._Q_M_);
        var _local2:Object = {
            "charId": _arg1,
            "reason": 1
        };
        _H_U_._t2(_local2, Account._get().credentials());
        sendRequest("delete", _local2);
    }

    private function _D_D_(_arg1:_8C_):void {
        dispatchEvent(new Server_list(_arg1.data_.toString()));
    }

    private function _Q_M_(_arg1:_8C_):void {
        dispatchEvent(new Event(Event.COMPLETE));
    }

}
}//package com.company.assembleegameclient.appengine

