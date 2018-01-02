// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_mv._md

package _mv {
import flash.display.DisplayObject;


public class _md implements _F_8 {

    public function _md(_arg1:int) {
        this.padding = _arg1;
    }
    public var padding:int;

    public function layout(_arg1:Vector.<DisplayObject>):void {
        var _local5:DisplayObject;
        var _local2:int;
        var _local3:int = _arg1.length;
        var _local4:int;
        while (_local4 < _local3) {
            _local5 = _arg1[_local4];
            _local5.x = _local2;
            _local2 = (_local2 + (_local5.width + this.padding));
            _local4++;
        }
    }

}
}//package _mv

