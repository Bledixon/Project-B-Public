// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.net.Server

package com.company.assembleegameclient.net {
import com.company.util._0K_N_;

public class Server {

    public function Server(_arg1:String, _arg2:String, _arg3:int, _arg4:_0K_N_ = null, _arg5:Number = 0, _arg6:Boolean = false):void {
        this.name_ = _arg1;
        this.address_ = _arg2;
        this.port_ = _arg3;
        this.latLong_ = _arg4;
        this.usage_ = _arg5;
        this.isAdminOnly_ = _arg6;
    }
    public var name_:String;
    public var address_:String;
    public var port_:int;
    public var latLong_:_0K_N_;
    public var usage_:Number;
    public var isAdminOnly_:Boolean;

    public function setName(_arg1:String):Server{
        this.name_ = _arg1;
        return (this);
    }
    public function setAddress(_arg1:String):Server{
        this.address_ = _arg1;
        return (this);
    }
    public function setPort(_arg1:int):Server{
        this.port_ = _arg1;
        return (this);
    }
    public function setLatLong(_arg1:Number, _arg2:Number):Server{
        this.latLong_ = new _0K_N_(_arg1, _arg2);
        return (this);
    }
    public function setUsage(_arg1:Number):Server{
        this.usage_ = _arg1;
        return (this);
    }
    public function setIsAdminOnly(_arg1:Boolean):Server{
        this.isAdminOnly_ = _arg1;
        return (this);
    }

    public function priority():int {
        if (this.isAdminOnly_) {
            return (6);
        }
        if (this._0J_m()) {
            return (1);
        }
        return (0);
    }

    public function _0J_m():Boolean {
        return ((this.usage_ >= 0.66));
    }

    public function _02s():Boolean {
        return ((this.usage_ >= 1));
    }

    public function toString():String {
        return ("[" + this.name_ + ": " + this.address_ + ":" + this.port_ + ":" + this.latLong_ + ":" + this.usage_ + ":" + this.isAdminOnly_ + "]");
    }

}
}//package com.company.assembleegameclient.net

