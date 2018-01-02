// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_011._wx

package _011 {

import flash.utils.IDataInput;


public class _wx extends _01Q_ {

    public function _wx(_arg1:uint) {
        this.clientXML_ = new Vector.<String>();
        this.extraXML_ = new Vector.<String>();
        super(_arg1);
    }
    public var width_:int;
    public var height_:int;
    public var name_:String;
    public var fp_:uint;
    public var background_:int;
    public var allowPlayerTeleport_:Boolean;
    public var showDisplays_:Boolean;
    public var clientXML_:Vector.<String>;
    public var extraXML_:Vector.<String>;
    public var music_:String;

    override public function parseFromInput(_arg1:IDataInput):void {
        var _local2:int;
        var _local3:int;
        var _local4:int;
        this.width_ = _arg1.readInt();
        this.height_ = _arg1.readInt();
        this.name_ = _arg1.readUTF();
        this.fp_ = _arg1.readUnsignedInt();
        this.background_ = _arg1.readInt();
        this.allowPlayerTeleport_ = _arg1.readBoolean();
        this.showDisplays_ = _arg1.readBoolean();
        this.music_ = _arg1.readUTF();
        _local2 = _arg1.readShort();
        this.clientXML_.length = 0;
        _local3 = 0;
        while (_local3 < _local2) {
            _local4 = _arg1.readInt();
            this.clientXML_.push(_arg1.readUTFBytes(_local4));
            _local3++;
        }
        _local2 = _arg1.readShort();
        this.extraXML_.length = 0;
        _local3 = 0;
        while (_local3 < _local2) {
            _local4 = _arg1.readInt();
            this.extraXML_.push(_arg1.readUTFBytes(_local4));
            _local3++;
        }
    }

    override public function toString():String {
        return (formatToString("MAPINFO", "width_", "height_", "name_", "fp_", "background_", "allowPlayerTeleport_", "showDisplays_", "music_", "clientXML_", "extraXML_"));
    }

}
}//package _011

