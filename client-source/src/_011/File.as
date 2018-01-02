// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_011.File

package _011 {
import flash.utils.IDataInput;

public class File extends _01Q_ {

    public function File(_arg1:uint) {
        super(_arg1);
    }
    public var filename_:String;
    public var file_:String;

    override public function parseFromInput(_arg1:IDataInput):void {
        this.filename_ = _arg1.readUTF();
        var _local2:int = _arg1.readInt();
        this.file_ = _arg1.readUTFBytes(_local2);
    }

    override public function toString():String {
        return (formatToString("CLIENTSTAT", "filename_", "file_"));
    }

}
}//package _011

