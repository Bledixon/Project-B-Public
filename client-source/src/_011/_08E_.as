// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_011._08E_

package _011 {
import flash.utils.IDataInput;

public class _08E_ extends _01Q_ {

    public static const _04l:int = -1;
    public static const _dV_:int = 0;
    public static const _4E_:int = 1;
    public static const _o1:int = 2;
    public static const _7a:int = 3;
    public static const _X_u:int = 4;
    public static const _mI_:int = 5;
    public static const _0I_C_:int = 6;
    public static const _83_e:int = 9;

    public function _08E_(_arg1:uint) {
        super(_arg1);
    }
    public var result_:int;
    public var resultString_:String;

    override public function parseFromInput(_arg1:IDataInput):void {
        this.result_ = _arg1.readInt();
        this.resultString_ = _arg1.readUTF();
    }

    override public function toString():String {
        return (formatToString("BUYRESULT", "result_", "resultString_"));
    }

}
}//package _011

