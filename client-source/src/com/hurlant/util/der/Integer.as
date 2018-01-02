// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.hurlant.util.der.Integer

package com.hurlant.util.der {
import com.hurlant.math._03Q_;

import flash.utils.ByteArray;

public class Integer extends _03Q_ implements IAsn1Type {

    public function Integer(_arg1:uint, _arg2:uint, _arg3:ByteArray) {
        this._type = _arg1;
        this._len = _arg2;
        super(_arg3);
    }
    private var _type:uint;
    private var _len:uint;

    override public function toString(_arg1:Number = 0):String {
        return ((((((((DER.indent + "Integer[") + this._type) + "][") + this._len) + "][") + super.toString(16)) + "]"));
    }

    public function getLength():uint {
        return (this._len);
    }

    public function getType():uint {
        return (this._type);
    }

    public function toDER():ByteArray {
        return (null);
    }

}
}//package com.hurlant.util.der

