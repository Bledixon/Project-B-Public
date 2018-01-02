// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0I_r.MultipartURLLoader

package _0I_r {
import flash.events.EventDispatcher;
import flash.net.URLLoader;
import flash.utils.Dictionary;
import flash.utils.ByteArray;
import flash.errors.IllegalOperationError;
import flash.utils.clearInterval;
import flash.net.URLLoaderDataFormat;
import flash.net.URLRequest;
import flash.net.URLRequestMethod;
import flash.net.URLRequestHeader;
import flash.utils.Endian;

import _0I_c._b7;

import flash.events.ProgressEvent;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.SecurityErrorEvent;
import flash.events.HTTPStatusEvent;
import flash.utils.setTimeout;

public class MultipartURLLoader extends EventDispatcher {

    public static var BLOCK_SIZE:uint = (64 * 0x0400);//65536

    public function MultipartURLLoader() {
        this._wc = [];
        this._0F_h = new Dictionary();
        this._u9 = [];
        this._0_u = new Dictionary();
        this._loader = new URLLoader();
        this.requestHeaders = [];
    }
    public var requestHeaders:Array;
    private var _rb:String;
    private var _u9:Array;
    private var _wc:Array;
    private var _0_u:Dictionary;
    private var _0F_h:Dictionary;
    private var _03F_:Boolean = false;
    private var _3R_:String;
    private var _data:ByteArray;
    private var _U__:Boolean = false;
    private var _A_7:Number;
    private var _J_Z_:uint = 0;
    private var _J_h:uint = 0;
    private var _fm:uint = 0;

    private var _loader:URLLoader;

    public function get loader():URLLoader {
        return (this._loader);
    }

    public function get _05r():Boolean {
        return (this._03F_);
    }

    public function get _kV_():Boolean {
        return (this._U__);
    }

    public function get dataFormat():String {
        return (this._loader.dataFormat);
    }

    public function set dataFormat(_arg1:String):void {
        if (((((!((_arg1 == URLLoaderDataFormat.BINARY))) && (!((_arg1 == URLLoaderDataFormat.TEXT))))) && (!((_arg1 == URLLoaderDataFormat.VARIABLES))))) {
            throw (new IllegalOperationError("Illegal URLLoader Data Format"));
        }
        this._loader.dataFormat = _arg1;
    }

    public function load(_arg1:String, _arg2:Boolean = false):void {
        if ((((_arg1 == null)) || ((_arg1 == "")))) {
            throw (new IllegalOperationError("You cant load without specifing PATH"));
        }
        this._3R_ = _arg1;
        this._03F_ = _arg2;
        if (this._03F_) {
            if (!this._U__) {
                this._D_8();
            } else {
                this._0I_t();
            }
        } else {
            this._data = this._G_t();
            this._0I_t();
        }
    }

    public function _V_o():void {
        if ((((((this._3R_ == null)) || ((this._3R_ == "")))) || ((this._03F_ == false)))) {
            throw (new IllegalOperationError("You can use this method only if loading asynchronous."));
        }
        if (((!(this._U__)) && (this._03F_))) {
            throw (new IllegalOperationError("You should prepare data before sending when using asynchronous."));
        }
        this._0I_t();
    }

    public function _05m():void {
        this._D_8();
    }

    public function close():void {
        try {
            this._loader.close();
        } catch (e:Error) {
        }
    }

    public function _cF_(_arg1:String, _arg2:Object = ""):void {
        if (this._u9.indexOf(_arg1) == -1) {
            this._u9.push(_arg1);
        }
        this._0_u[_arg1] = _arg2;
        this._U__ = false;
    }

    public function _d(_arg1:ByteArray, _arg2:String, _arg3:String = "Filedata", _arg4:String = "application/octet-stream"):void {
        var _local5:FilePart;
        if (this._wc.indexOf(_arg2) == -1) {
            this._wc.push(_arg2);
            this._0F_h[_arg2] = new FilePart(_arg1, _arg2, _arg3, _arg4);
            this._J_h = (this._J_h + _arg1.length);
        } else {
            _local5 = (this._0F_h[_arg2] as FilePart);
            this._J_h = (this._J_h - _local5.fileContent.length);
            _local5.fileContent = _arg1;
            _local5.fileName = _arg2;
            _local5.dataField = _arg3;
            _local5.contentType = _arg4;
            this._J_h = (this._J_h + _arg1.length);
        }
        this._U__ = false;
    }

    public function _0C_5():void {
        this._u9 = [];
        this._0_u = new Dictionary();
        this._U__ = false;
    }

    public function _0B_t():void {
        var _local1:String;
        for each (_local1 in this._wc) {
            (this._0F_h[_local1] as FilePart).dispose();
        }
        this._wc = [];
        this._0F_h = new Dictionary();
        this._J_h = 0;
        this._U__ = false;
    }

    public function dispose():void {
        clearInterval(this._A_7);
        this._pD_();
        this.close();
        this._loader = null;
        this._rb = null;
        this._u9 = null;
        this._0_u = null;
        this._wc = null;
        this._0F_h = null;
        this.requestHeaders = null;
        this._data = null;
    }

    public function _6Y_():String {
        var _local1:int;
        if (this._rb == null) {
            this._rb = "";
            _local1 = 0;
            while (_local1 < 32) {
                this._rb = (this._rb + String.fromCharCode(int((97 + (Math.random() * 25)))));
                _local1++;
            }
        }
        return (this._rb);
    }

    private function _0I_t():void {
        var _local1:URLRequest = new URLRequest();
        _local1.url = this._3R_;
        _local1.method = URLRequestMethod.POST;
        _local1.data = this._data;
        _local1.requestHeaders.push(new URLRequestHeader("Content-type", ("multipart/form-data; boundary=" + this._6Y_())));
        if (this.requestHeaders.length) {
            _local1.requestHeaders = _local1.requestHeaders.concat(this.requestHeaders);
        }
        this._uA_();
        this._loader.load(_local1);
    }

    private function _D_8():void {
        clearInterval(this._A_7);
        this._data = new ByteArray();
        this._data.endian = Endian.BIG_ENDIAN;
        this._data = this._w(this._data);
        this._J_Z_ = 0;
        this._fm = 0;
        this._U__ = false;
        if (this._wc.length) {
            this._3U_();
        } else {
            this._data = this._09P_(this._data);
            this._U__ = true;
            dispatchEvent(new _b7(_b7._0C_C_));
        }
    }

    private function _G_t():ByteArray {
        var _local1:ByteArray = new ByteArray();
        _local1.endian = Endian.BIG_ENDIAN;
        _local1 = this._w(_local1);
        _local1 = this._04I_(_local1);
        return (this._09P_(_local1));
    }

    private function _09P_(_arg1:ByteArray):ByteArray {
        _arg1 = this._if(_arg1);
        return (this._0K_D_(_arg1));
    }

    private function _w(_arg1:ByteArray):ByteArray {
        var _local2:uint;
        var _local3:String;
        var _local4:String;
        for each (_local4 in this._u9) {
            _arg1 = this._if(_arg1);
            _arg1 = this._8A_(_arg1);
            _local3 = (('Content-Disposition: form-data; name="' + _local4) + '"');
            _local2 = 0;
            while (_local2 < _local3.length) {
                _arg1.writeByte(_local3.charCodeAt(_local2));
                _local2++;
            }
            _arg1 = this._8A_(_arg1);
            _arg1 = this._8A_(_arg1);
            _arg1.writeUTFBytes(this._0_u[_local4]);
            _arg1 = this._8A_(_arg1);
        }
        return (_arg1);
    }

    private function _04I_(_arg1:ByteArray):ByteArray {
        var _local2:uint;
        var _local3:String;
        var _local4:String;
        if (this._wc.length) {
            for each (_local4 in this._wc) {
                _arg1 = this._0H_G_(_arg1, (this._0F_h[_local4] as FilePart));
                _arg1 = this._T_M_(_arg1, (this._0F_h[_local4] as FilePart));
                if (_local2 != (this._wc.length - 1)) {
                    _arg1 = this._8A_(_arg1);
                }
                _local2++;
            }
            _arg1 = this._gj(_arg1);
        }
        return (_arg1);
    }

    private function _gj(_arg1:ByteArray):ByteArray {
        var _local2:uint;
        var _local3:String;
        _arg1 = this._8A_(_arg1);
        _arg1 = this._if(_arg1);
        _arg1 = this._8A_(_arg1);
        _local3 = 'Content-Disposition: form-data; name="Upload"';
        _local2 = 0;
        while (_local2 < _local3.length) {
            _arg1.writeByte(_local3.charCodeAt(_local2));
            _local2++;
        }
        _arg1 = this._8A_(_arg1);
        _arg1 = this._8A_(_arg1);
        _local3 = "Submit Query";
        _local2 = 0;
        while (_local2 < _local3.length) {
            _arg1.writeByte(_local3.charCodeAt(_local2));
            _local2++;
        }
        return (this._8A_(_arg1));
    }

    private function _0H_G_(_arg1:ByteArray, _arg2:FilePart):ByteArray {
        var _local3:uint;
        var _local4:String;
        _arg1 = this._if(_arg1);
        _arg1 = this._8A_(_arg1);
        _local4 = 'Content-Disposition: form-data; name="Filename"';
        _local3 = 0;
        while (_local3 < _local4.length) {
            _arg1.writeByte(_local4.charCodeAt(_local3));
            _local3++;
        }
        _arg1 = this._8A_(_arg1);
        _arg1 = this._8A_(_arg1);
        _arg1.writeUTFBytes(_arg2.fileName);
        _arg1 = this._8A_(_arg1);
        _arg1 = this._if(_arg1);
        _arg1 = this._8A_(_arg1);
        _local4 = (('Content-Disposition: form-data; name="' + _arg2.dataField) + '"; filename="');
        _local3 = 0;
        while (_local3 < _local4.length) {
            _arg1.writeByte(_local4.charCodeAt(_local3));
            _local3++;
        }
        _arg1.writeUTFBytes(_arg2.fileName);
        _arg1 = this._S_Q_(_arg1);
        _arg1 = this._8A_(_arg1);
        _local4 = ("Content-Type: " + _arg2.contentType);
        _local3 = 0;
        while (_local3 < _local4.length) {
            _arg1.writeByte(_local4.charCodeAt(_local3));
            _local3++;
        }
        _arg1 = this._8A_(_arg1);
        return (this._8A_(_arg1));
    }

    private function _T_M_(_arg1:ByteArray, _arg2:FilePart):ByteArray {
        _arg1.writeBytes(_arg2.fileContent, 0, _arg2.fileContent.length);
        return (_arg1);
    }

    private function _uA_():void {
        this._loader.addEventListener(Event.COMPLETE, this.onComplete, false, 0, false);
        this._loader.addEventListener(ProgressEvent.PROGRESS, this._P_n, false, 0, false);
        this._loader.addEventListener(IOErrorEvent.IO_ERROR, this.onIOError, false, 0, false);
        this._loader.addEventListener(HTTPStatusEvent.HTTP_STATUS, this._82, false, 0, false);
        this._loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.onSecurityError, false, 0, false);
    }

    private function _pD_():void {
        this._loader.removeEventListener(Event.COMPLETE, this.onComplete);
        this._loader.removeEventListener(ProgressEvent.PROGRESS, this._P_n);
        this._loader.removeEventListener(IOErrorEvent.IO_ERROR, this.onIOError);
        this._loader.removeEventListener(HTTPStatusEvent.HTTP_STATUS, this._82);
        this._loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, this.onSecurityError);
    }

    private function _if(_arg1:ByteArray):ByteArray {
        var _local2:int = this._6Y_().length;
        _arg1 = this._0K_D_(_arg1);
        var _local3:int;
        while (_local3 < _local2) {
            _arg1.writeByte(this._rb.charCodeAt(_local3));
            _local3++;
        }
        return (_arg1);
    }

    private function _8A_(_arg1:ByteArray):ByteArray {
        _arg1.writeShort(3338);
        return (_arg1);
    }

    private function _S_Q_(_arg1:ByteArray):ByteArray {
        _arg1.writeByte(34);
        return (_arg1);
    }

    private function _0K_D_(_arg1:ByteArray):ByteArray {
        _arg1.writeShort(0x2D2D);
        return (_arg1);
    }

    private function _3U_():void {
        var _local1:FilePart;
        if (this._J_Z_ < this._wc.length) {
            _local1 = (this._0F_h[this._wc[this._J_Z_]] as FilePart);
            this._data = this._0H_G_(this._data, _local1);
            this._A_7 = setTimeout(this._01e, 10, this._data, _local1.fileContent, 0);
            this._J_Z_++;
        } else {
            this._data = this._gj(this._data);
            this._data = this._09P_(this._data);
            this._U__ = true;
            dispatchEvent(new _b7(_b7._X_b, this._J_h, this._J_h));
            dispatchEvent(new _b7(_b7._0C_C_));
        }
    }

    private function _01e(_arg1:ByteArray, _arg2:ByteArray, _arg3:uint = 0):void {
        var _local4:uint = Math.min(BLOCK_SIZE, (_arg2.length - _arg3));
        _arg1.writeBytes(_arg2, _arg3, _local4);
        if ((((_local4 < BLOCK_SIZE)) || (((_arg3 + _local4) >= _arg2.length)))) {
            _arg1 = this._8A_(_arg1);
            this._3U_();
            return;
        }
        _arg3 = (_arg3 + _local4);
        this._fm = (this._fm + _local4);
        if (((this._fm % BLOCK_SIZE) * 2) == 0) {
            dispatchEvent(new _b7(_b7._X_b, this._fm, this._J_h));
        }
        this._A_7 = setTimeout(this._01e, 10, _arg1, _arg2, _arg3);
    }

    private function _P_n(_arg1:ProgressEvent):void {
        dispatchEvent(_arg1);
    }

    private function onComplete(_arg1:Event):void {
        this._pD_();
        dispatchEvent(_arg1);
    }

    private function onIOError(_arg1:IOErrorEvent):void {
        this._pD_();
        dispatchEvent(_arg1);
    }

    private function onSecurityError(_arg1:SecurityErrorEvent):void {
        this._pD_();
        dispatchEvent(_arg1);
    }

    private function _82(_arg1:HTTPStatusEvent):void {
        dispatchEvent(_arg1);
    }

}
}//package _0I_r

import flash.utils.ByteArray;

class FilePart {

    public var fileContent:ByteArray;
    public var fileName:String;
    public var dataField:String;
    public var contentType:String;

    public function FilePart(_arg1:ByteArray, _arg2:String, _arg3:String = "Filedata", _arg4:String = "application/octet-stream") {
        this.fileContent = _arg1;
        this.fileName = _arg2;
        this.dataField = _arg3;
        this.contentType = _arg4;
    }

    public function dispose():void {
        this.fileContent = null;
        this.fileName = null;
        this.dataField = null;
        this.contentType = null;
    }

}

