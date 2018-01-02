// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.appengine._0B_u

package com.company.assembleegameclient.appengine {
import flash.events.EventDispatcher;
import flash.net.URLRequest;
import flash.net.URLLoader;
import flash.utils.getTimer;
import flash.net.URLRequestMethod;
import flash.net.URLVariables;
import flash.events.SecurityErrorEvent;
import flash.events.IOErrorEvent;

import _zo._mS_;
import _zo._8C_;

import flash.events.Event;

import com.company.assembleegameclient.parameters.Parameters;

public class _0B_u extends EventDispatcher {

    public function _0B_u(_arg1:String, _arg2:String, _arg3:Boolean, _arg4:int = 0) {
        var _local5:String = ((!(_arg3) || (_arg1.indexOf(Parameters.connection) == 0)) ? "http://" : "https://");
        this._E_v = (((_local5 + _arg1) + _arg2) + "/");
        this._0D_R_ = _arg4;
    }
    public var _E_v:String;
    private var _009:String = "text";
    private var _om:URLRequest = null;
    private var _04v:URLLoader = null;
    private var _0D_R_:int = 0;
    private var name_:String;
    private var _C_u:Object;
    private var _dF_:int;

    public function sendRequest(_arg1:String, _arg2:Object):void {
        this.name_ = _arg1;
        this._C_u = _arg2;
        this._C_u["ignore"] = getTimer();
        this._dF_ = this._0D_R_;
        this._0C_l();
    }

    public function _R_z(_arg1:String):void {
        this._009 = _arg1;
    }

    private function _0C_l():void {
        this._U_x();
        this._om = this._M_z(this.name_, this._C_u);
        this._04v = this._01V_();
        this._04v.load(this._om);
    }

    private function _M_z(_arg1:String, _arg2:Object):URLRequest {
        var _local5:String;
        var _local3:URLRequest = new URLRequest((this._E_v + _arg1));
        _local3.method = URLRequestMethod.POST;
        var _local4:URLVariables = new URLVariables();
        for (_local5 in _arg2) {
            _local4[_local5] = _arg2[_local5];
        }
        _local3.data = _local4;
        return (_local3);
    }

    private function error(_arg1:String):void {
        if (this._dF_ > 0) {
            this._dF_--;
            this._0C_l();
            return;
        }
        dispatchEvent(new _mS_(_arg1));
    }

    private function _01V_():URLLoader {
        var _local1:URLLoader = new URLLoader();
        _local1.dataFormat = this._009;
        _local1.addEventListener(IOErrorEvent.IO_ERROR, this.onIOError);
        _local1.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.onSecurityError);
        _local1.addEventListener(Event.COMPLETE, this.onComplete);
        return (_local1);
    }

    private function _U_x():void {
        if (this._04v == null) {
            return;
        }
        this._04v.removeEventListener(IOErrorEvent.IO_ERROR, this.onIOError);
        this._04v.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, this.onSecurityError);
        this._04v.removeEventListener(Event.COMPLETE, this.onComplete);
        try {
            this._04v.close();
        } catch (e:Error) {
        }
        this._04v = null;
    }

    private function onSecurityError(_arg1:SecurityErrorEvent):void {
        this.error("Security Error");
    }

    private function onIOError(_arg1:IOErrorEvent):void {
        var _local2:String = this._04v.data;
        if (_local2.length == 0) {
            _local2 = "Unable to contact server";
        }
        this.error(_local2);
    }

    private function onComplete(_arg1:Event):void {
        var _local2:String = this._04v.data;
        if (_local2.substring(0, 7) == "<Error>") {
            this.error(XML(_local2));
            return;
        }
        if (_local2.substring(0, 12) == "<FatalError>") {
            dispatchEvent(new _mS_(XML(_local2)));
            return;
        }
        dispatchEvent(new _8C_(this._04v.data));
    }

}
}//package com.company.assembleegameclient.appengine

