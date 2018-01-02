package _0A_g {
import flash.utils.IDataOutput;

public class TextInputResult extends _R_q {

    public function TextInputResult(_arg1:uint) {
        super(_arg1);
    }

    public var success_:Boolean;
    public var action_:String;
    public var input_:String;

    override public function writeToOutput(_arg1:IDataOutput):void {
        _arg1.writeBoolean(success_);
        _arg1.writeUTF(action_);
        _arg1.writeUTF(input_);
    }

    override public function toString():String {
        return formatToString("TEXTINPUTRESULT", "success_", "action_", "input_");
    }
}
}
