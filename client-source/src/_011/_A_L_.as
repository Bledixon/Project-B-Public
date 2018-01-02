// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_011._A_L_

package _011 {
import flash.utils.IDataInput;

public class _A_L_ extends _01Q_ {

    public static const _nV_:int = 0;
    public static const _00N_:int = 1;

    public function _A_L_(_arg1:uint) {
        super(_arg1);
    }
    public var code_:int;
    public var description_:String;

    override public function parseFromInput(_arg1:IDataInput):void {
        this.code_ = _arg1.readInt();
        this.description_ = _arg1.readUTF();
    }

    override public function toString():String {
        return (formatToString("TRADEDONE", "code_", "description_"));
    }

}
}//package _011

