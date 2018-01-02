// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.net.messages.data._0H_9

package com.company.assembleegameclient.net.messages.data {
import flash.utils.IDataInput;

public class _0H_9 {

    public function _0H_9() {
        this._zM_ = new ObjectStatusData();
        super();
    }
    public var objectType_:int;
    public var _zM_:ObjectStatusData;

    public function parseFromInput(_arg1:IDataInput):void {
        this.objectType_ = _arg1.readShort();
        this._zM_.parseFromInput(_arg1);
    }

    public function toString():String {
        return (((("objectType_: " + this.objectType_) + " status_: ") + this._zM_));
    }

}
}//package com.company.assembleegameclient.net.messages.data

