// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.net._098

package com.company.net {
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

public class _098 {

    public function _098(_arg1:uint) {
        this.id_ = _arg1;
    }
    public var id_:uint;

    public function parseFromInput(_arg1:IDataInput):void {
    }

    public function writeToOutput(_arg1:IDataOutput):void {
    }

    public function toString():String {
        return (this.formatToString("MESSAGE", "id_"));
    }

    protected function formatToString(_arg1:String, ..._args):String {
        var _local3:String = ("[" + _arg1);
        var _local4:int;
        while (_local4 < _args.length) {
            _local3 = (_local3 + ((((" " + _args[_local4]) + '="') + this[_args[_local4]]) + '"'));
            _local4++;
        }
        return ((_local3 + "]"));
    }

}
}//package com.company.net

