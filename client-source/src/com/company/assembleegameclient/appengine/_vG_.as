// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.appengine._vG_

package com.company.assembleegameclient.appengine {
import flash.events.ErrorEvent;

import com.company.assembleegameclient.parameters.Parameters;
import com.company.util._gv;

import _qN_.Account;

public class _vG_ {

    public static const _0J_D_:Boolean = true;

    public static function _A_U_(_arg1:*):void {
        var _local4:String;
        var _local6:String;
        var _local7:_0B_u;
        var _local2:Error = (_arg1 as Error);
        var _local3:ErrorEvent = (_arg1 as ErrorEvent);
        var _local5:String;
        if (_local2 != null) {
            _local4 = _local2.message;
            _local5 = _local2.getStackTrace();
        } else {
            if (_local3 != null) {
                _local4 = _local3.text;
            } else {
                if (_arg1 != null) {
                    _local4 = _arg1.toString();
                }
            }
        }
        if (((_0J_D_) && ((_local5 == null)))) {
            return;
        }
        if (Parameters.sendErrors) {
            _local6 = ((((((((("Build: " + Parameters._02Q_()) + "\n") + "message: ") + _local4) + "\n") + "stackTrace: ") + _local5) + "\n") + _gv._00f());
            _local7 = new _0B_u(Parameters._fK_(), "/clientError", false);
            _local7.sendRequest("add", {
                "text": _local6,
                "guid": Account._get().guid()
            });
        } else {
            trace(_local4);
            trace(_local5);
        }
    }

}
}//package com.company.assembleegameclient.appengine

