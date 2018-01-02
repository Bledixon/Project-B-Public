// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.hurlant.util.der.ByteString

package com.hurlant.util.der {
import flash.utils.ByteArray;

import com.hurlant.util.Hex;

public class ByteString extends ByteArray implements IAsn1Type {

    public function ByteString(_arg1:uint = 4, _arg2:uint = 0) {
        this._type = _arg1;
        this._len = _arg2;
    }
    private var _type:uint;
    private var _len:uint;

    override public function toString():String {
        return ((((((((DER.indent + "ByteString[") + this._type) + "][") + this._len) + "][") + Hex.fromArray(this)) + "]"));
    }

    public function getLength():uint {
        return (this._len);
    }

    public function getType():uint {
        return (this._type);
    }

    public function toDER():ByteArray {
        return (DER.wrapDER(this._type, this));
    }

}
}//package com.hurlant.util.der

