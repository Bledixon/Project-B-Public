// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.appengine.RemoteTexture

package com.company.assembleegameclient.appengine {
import flash.net.URLLoaderDataFormat;

import _zo._8C_;
import _zo._mS_;

import _089._W_s;

import flash.utils.ByteArray;
import flash.display.BitmapData;

import com.company.assembleegameclient.parameters.Parameters;

public class RemoteTexture {

    private static const _E_o:Number = Number(new Date().time);

    public function RemoteTexture(_arg1:String, _arg2:String, _arg3:Function):void {
        this.id_ = _arg1;
        this._Z_Q_ = _arg2;
        this.callback_ = _arg3;
    }
    public var id_:String;
    public var _Z_Q_:String;
    public var callback_:Function;

    public function run():void {
        var _local1:String = ((this._Z_Q_ == "testing") ? "rotmgtesting.appspot.com" : (this._Z_Q_ == "production") ? "realmofthemadgod.appspot.com" : Parameters._fK_());
        var _local2:_0B_u = new _0B_u(_local1, "/picture", false);
        _local2._R_z(URLLoaderDataFormat.BINARY);
        _local2.addEventListener(_8C_.GENERIC_DATA, this.onURLLoadComplete);
        _local2.addEventListener(_mS_.TEXT_ERROR, this.onError);
        _local2.sendRequest("get", {
            "id": this.id_,
            "instance": this._Z_Q_,
            "time": _E_o
        });
    }

    public function onURLLoadComplete(_arg1:_8C_):void {
        var _local2:BitmapData = _W_s._80((_arg1.data_ as ByteArray));
        this.callback_(_local2);
    }

    public function onError(_arg1:_mS_):void {
    }

}
}//package com.company.assembleegameclient.appengine

