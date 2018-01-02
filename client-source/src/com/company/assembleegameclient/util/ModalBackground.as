/**
 * Created by Thelzar on 7/20/2014.
 */
package com.company.assembleegameclient.util {
import flash.display.CapsStyle;
import flash.display.JointStyle;
import flash.display.LineScaleMode;
import flash.display.Sprite;

public class ModalBackground extends Sprite {

    public static const HORIZONTAL_DIVISION:String = "HORIZONTAL_DIVISION";
    public static const VERTICAL_DIVISION:String = "VERTICAL_DIVISION";
    private static const BEVEL:int = 4;

    public function draw(_arg1:int, _arg2:int, _arg3:int=0):void{
        var _local4:_str1119 = new _str1119(_arg1, _arg2, BEVEL);
        var _local5:_str1120 = new _str1120();
        graphics.lineStyle(1, 0xFFFFFF, 1, false, LineScaleMode.NORMAL, CapsStyle.NONE, JointStyle.ROUND, 3);
        switch (_arg3) {
            case 0:
                graphics.beginFill(0x2A2A2A);
                _local5._str2527(0, 0, _local4, graphics);
                graphics.endFill();
                break;
            case 1:
                graphics.lineStyle(1, 0x2A2A2A, 1, false, LineScaleMode.NORMAL, CapsStyle.NONE, JointStyle.ROUND, 3);
                graphics.beginFill(0x2A2A2A, 1);
                _local5._str2527(1, 1, new _str1119((_arg1 - 2), 29, BEVEL), graphics);
                graphics.endFill();
                graphics.beginFill(0x2A2A2A, 1);
                graphics.drawRect(1, 15, (_arg1 - 2), 15);
                graphics.endFill();
                graphics.lineStyle(2, 0xFFFFFF, 1, false, LineScaleMode.NORMAL, CapsStyle.NONE, JointStyle.ROUND, 3);
                graphics.beginFill(0x2A2A2A, 0);
                _local5._str2527(0, 0, _local4, graphics);
                graphics.endFill();
                break;
            case 2:
                graphics.lineStyle(2, 0xFFFFFF, 1, false, LineScaleMode.NORMAL, CapsStyle.NONE, JointStyle.ROUND, 3);
                graphics.beginFill(0x2A2A2A, 0);
                _local5._str2527(0, 0, _local4, graphics);
                graphics.endFill();
                break;
            default:
                throw new Error("No value has been set!");
                break;
        }
    }
    public function _str2638(_arg1:String, _arg2:int):void{
       switch (_arg1) {
           case HORIZONTAL_DIVISION:
               this._str2639(_arg2);
               break;
           case VERTICAL_DIVISION:
               this._str2640(_arg2);
               break;
       }
    }
    private function _str2639(_arg_1:int):void{
        graphics.lineStyle();
        graphics.endFill();
        graphics.moveTo(1, _arg_1);
        graphics.beginFill(0x666666, 1);
        graphics.drawRect(1, _arg_1, (width - 2), 2);
    }
    private function _str2640(_arg_1:int):void{
        graphics.lineStyle();
        graphics.moveTo(_arg_1, 1);
        graphics.lineStyle(2, 0x666666);
        graphics.lineTo(_arg_1, (height - 1));
    }

    public function ModalBackground() {
    }
}
}
