// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_011._06N_

package _011 {
import com.company.assembleegameclient.net.messages.data._Q_0;

import flash.utils.IDataInput;

public class ShowEffect extends _01Q_ {

    public static const _7A_:int = 0;
    public static const _x0:int = 1;
    public static const _0A_T_:int = 2;
    public static const _04t:int = 3;
    public static const _hn:int = 4;
    public static const _e8:int = 5;
    public static const _X_k:int = 6;
    public static const _4C_:int = 7;
    public static const _each_:int = 8;
    public static const _ow:int = 9;
    public static const _010:int = 10;
    public static const _eY_:int = 11;
    public static const _dP_:int = 12;
    public static const _L_3:int = 13;
    public static const _Z_u:int = 14;
    public static const _0_1:int = 15;
    public static const _g8:int = 16;

    public function ShowEffect(_arg1:uint) {
        this.pos1_ = new _Q_0();
        this.pos2_ = new _Q_0();
        super(_arg1);
    }
    public var effectType_:uint;
    public var targetObjectId_:int;
    public var pos1_:_Q_0;
    public var pos2_:_Q_0;
    public var color_:int;

    override public function parseFromInput(_arg1:IDataInput):void {
        this.effectType_ = _arg1.readUnsignedByte();
        this.targetObjectId_ = _arg1.readInt();
        this.pos1_.parseFromInput(_arg1);
        this.pos2_.parseFromInput(_arg1);
        this.color_ = _arg1.readInt();
    }

    override public function toString():String {
        return (formatToString("SHOW_EFFECT", "effectType_", "targetObjectId_", "pos1_", "pos2_", "color_"));
    }

}
}//package _011

