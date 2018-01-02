// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_011._0D_q

package _011 {
import flash.utils.IDataInput;

public class _0D_q extends _01Q_ {

    public function _0D_q(_arg1:uint) {
        super(_arg1);
    }
    public var success_:Boolean;
    public var errorText_:String;

    override public function parseFromInput(_arg1:IDataInput):void {
        this.success_ = _arg1.readBoolean();
        this.errorText_ = _arg1.readUTF();
    }

    override public function toString():String {
        return (formatToString("NAMERESULT", "success_", "errorText_"));
    }

}
}//package _011

