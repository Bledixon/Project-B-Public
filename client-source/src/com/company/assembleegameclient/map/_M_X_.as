// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.map._M_X_

package com.company.assembleegameclient.map {
public class _M_X_ {

    public static const _0I_7:int = 0;
    public static const _02o:int = 1;
    public static const _dq:int = 2;

    public var type_:int = 0;
    public var dx_:Number = 0;
    public var dy_:Number = 0;

    public function _7N_(_arg1:XML):void {
        switch (String(_arg1)) {
            case "Wave":
                this.type_ = _02o;
                break;
            case "Flow":
                this.type_ = _dq;
                break;
        }
        this.dx_ = _arg1.@dx;
        this.dy_ = _arg1.@dy;
    }

}
}//package com.company.assembleegameclient.map

