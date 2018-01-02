package _011 {
import flash.utils.IDataInput;

public class SwitchMusic extends _01Q_ {
    public function SwitchMusic(_arg1:uint) {

        super(_arg1);
    }
    public var music_:String;

    override public function parseFromInput(_arg1:IDataInput):void {

        this.music_ = _arg1.readUTF();
    }

    override public function toString():String {

        return formatToString("SWITCHMUSIC", "music_");
    }
}
}