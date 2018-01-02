/**
 * Created by Thelzar on 7/20/2014.
 */
package com.company.assembleegameclient.util {
import flash.display.Graphics;

public class _str1120 {

    public function _str2527(_arg_1:int, _arg_2:int, _arg_3:_str1119, _arg_4:Graphics):void{
        var _local_5:int = (_arg_1 + _arg_3.width);
        var _local_6:int = (_arg_2 + _arg_3.height);
        var _local_7:int = _arg_3._str4769;
        if (_arg_3._str4765){
            _arg_4.moveTo(_arg_1, (_arg_2 + _local_7));
            _arg_4.lineTo((_arg_1 + _local_7), _arg_2);
        } else {
            _arg_4.moveTo(_arg_1, _arg_2);
        };
        if (_arg_3._str4766){
            _arg_4.lineTo((_local_5 - _local_7), _arg_2);
            _arg_4.lineTo(_local_5, (_arg_2 + _local_7));
        } else {
            _arg_4.lineTo(_local_5, _arg_2);
        };
        if (_arg_3._str4768){
            _arg_4.lineTo(_local_5, (_local_6 - _local_7));
            _arg_4.lineTo((_local_5 - _local_7), _local_6);
        } else {
            _arg_4.lineTo(_local_5, _local_6);
        };
        if (_arg_3._str4767){
            _arg_4.lineTo((_arg_1 + _local_7), _local_6);
            _arg_4.lineTo(_arg_1, (_local_6 - _local_7));
        } else {
            _arg_4.lineTo(_arg_1, _local_6);
        };
    }
}
}
