// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.net.ServerConnection

package com.company.net {
import flash.events.EventDispatcher;
import flash.net.Socket;
import flash.utils.Dictionary;

import com.hurlant.crypto.symmetric.ICipher;
import com.hurlant.crypto.Crypto;

import flash.utils.ByteArray;

import com.hurlant.crypto.symmetric.IPad;

import flash.events.Event;
import flash.events.ProgressEvent;
import flash.events.IOErrorEvent;
import flash.events.SecurityErrorEvent;
import flash.events.ErrorEvent;


public class ServerConnection extends EventDispatcher {

    public function ServerConnection(_arg1:Boolean = true) {
        this._3I_ = new Dictionary();
        this._aG_ = new Vector.<_098>();
        super();
        this._073 = _arg1;
    }
    private var _073:Boolean;
    private var _A_T_:Socket = null;
    private var _05:int = -1;
    private var server_:String;
    private var port_:int;
    private var _3I_:Dictionary;
    private var _aG_:Vector.<_098>;
    private var _0B_o:ICipher = null;
    private var _0E_R_:ICipher = null;

    public function _7s(_arg1:String, _arg2:ByteArray, _arg3:IPad = null):void {
        this._0B_o = Crypto.getCipher(_arg1, _arg2, _arg3);
    }

    public function _wH_(_arg1:String, _arg2:ByteArray, _arg3:IPad = null):void {
        this._0E_R_ = Crypto.getCipher(_arg1, _arg2, _arg3);
    }

    public function _g9(_arg1:uint, _arg2:Class, _arg3:Function):void {
        this._3I_[_arg1] = new MessageType(_arg2, _arg3);
    }

    public function connect(_arg1:String, _arg2:int):void {
        if (this._A_T_ != null) {
            this._0F_G_();
        }
        this.server_ = _arg1;
        this.port_ = _arg2;
        this._05 = -1;
        this._A_T_ = new Socket();
        this._A_T_.connect(_arg1, _arg2);
        this._A_T_.addEventListener(Event.CONNECT, this._ux);
        this._A_T_.addEventListener(Event.CLOSE, this._of);
        this._A_T_.addEventListener(ProgressEvent.SOCKET_DATA, this._vL_);
        this._A_T_.addEventListener(IOErrorEvent.IO_ERROR, this.onIOError);
        this._A_T_.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.onSecurityError);
    }

    public function _tx():void {
        this.connect(this.server_, this.port_);
    }

    public function _0F_G_():void {
        if (this._A_T_ == null) {
            return;
        }
        if (this._A_T_.connected) {
            this._A_T_.close();
        }
        this._A_T_.removeEventListener(Event.CONNECT, this._ux);
        this._A_T_.removeEventListener(Event.CLOSE, this._of);
        this._A_T_.removeEventListener(ProgressEvent.SOCKET_DATA, this._vL_);
        this._A_T_.removeEventListener(IOErrorEvent.IO_ERROR, this.onIOError);
        this._A_T_.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, this.onSecurityError);
        this._A_T_ = null;
        this._aG_.length = 0;
    }

    public function sendMessage(_arg1:_098):void {
        this._aG_.push(_arg1);
        this._0I_3();
    }

    public function _Y_E_(_arg1:uint):_098 {
        var _local2:MessageType = this._3I_[_arg1];
        if (_local2 == null) {
            return (null);
        }
        var _local3:_098;
        if (_local2.freeList_.length == 0) {
            _local3 = (((_local2.class_ == null)) ? new _098(_arg1) : new _local2.class_(_arg1));
        } else {
            _local3 = _local2.freeList_.pop();
        }
        return (_local3);
    }

    public function _fj(_arg1:_098):void {
        this._3I_[_arg1.id_].freeList_.push(_arg1);
    }

    private function _0I_3():void {
        var _local1:_098;
        var _local2:ByteArray;
        if ((((this._A_T_ == null)) || (!(this._A_T_.connected)))) {
            return;
        }
        for each (_local1 in this._aG_) {
            _local2 = new ByteArray();
            _local1.writeToOutput(_local2);
            _local2.position = 0;
            if (this._0B_o != null) {
                this._0B_o.encrypt(_local2);
                _local2.position = 0;
            }
            this._A_T_.writeInt((_local2.bytesAvailable + 5));
            this._A_T_.writeByte(_local1.id_);
            this._A_T_.writeBytes(_local2);
            this._fj(_local1);
        }
        this._A_T_.flush();
        this._aG_.length = 0;
    }

    private function _ux(_arg1:Event):void {
        if (this._073) {
            this._A_T_.writeMultiByte("<start/>", "utf-8");
            this._A_T_.writeByte(0);
        }
        this._0I_3();
        dispatchEvent(_arg1);
    }

    private function _of(_arg1:Event):void {
        trace("Lost connection to server");
        dispatchEvent(new Event(Event.CLOSE));
    }

    private function onIOError(_arg1:IOErrorEvent):void {
        trace(("IO Error: " + _arg1.text));
        dispatchEvent(new ErrorEvent(ErrorEvent.ERROR, false, false, ("IO Error: " + _arg1.text)));
        dispatchEvent(new Event(Event.CLOSE));
    }

    private function onSecurityError(_arg1:SecurityErrorEvent):void {
        trace(("Server crashed.. " + _arg1.text));
        dispatchEvent(new ErrorEvent(ErrorEvent.ERROR, false, false, ("Server crashed.. " + _arg1.text)));
        dispatchEvent(new Event(Event.CLOSE));
    }

    private function _vL_(event:ProgressEvent):void {
        var messageId:uint;
        var message:_098;
        var data:ByteArray;
        while (1) {
            if ((((this._A_T_ == null)) || (!(this._A_T_.connected)))) break;
            if (this._05 == -1) {
                if (this._A_T_.bytesAvailable < 4) break;
                try {
                    this._05 = this._A_T_.readInt();
                } catch (error:Error) {
                    trace(((error.name + ": ") + error.message));
                    _05 = -1;
                    return;
                }
            }
            if (this._A_T_.bytesAvailable < (this._05 - 4)) break;
            messageId = this._A_T_.readUnsignedByte();
            message = this._Y_E_(messageId);
            data = new ByteArray();
            if ((this._05 - 5) > 0) {
                this._A_T_.readBytes(data, 0, (this._05 - 5));
            }
            data.position = 0;
            if (this._0E_R_ != null) {
                this._0E_R_.decrypt(data);
                data.position = 0;
            }
            this._05 = -1;
            if (message == null) {
                trace("Unknown message in protocol, bailing");
                this._0F_G_();
                dispatchEvent(new Event(Event.CLOSE));
                return;
            }
            try {
                message.parseFromInput(data);
            } catch (e:Error) {
                trace(("Error in protocol: " + e.toString()));
                _0F_G_();
                dispatchEvent(new Event(Event.CLOSE));
                return;
            }
            this._3I_[messageId].callback_(message);
            this._fj(message);
        }
    }

}
}//package com.company.net

import com.company.net._098;


class MessageType {

    public var class_:Class;
    public var freeList_:Vector.<_098>;
    public var callback_:Function;

    public function MessageType(_arg1:Class, _arg2:Function) {
        this.freeList_ = new Vector.<_098>();
        super();
        this.class_ = _arg1;
        this.callback_ = _arg2;
    }
}

