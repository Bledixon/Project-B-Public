// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.util._9e

package com.company.util {


  import flash.display.Bitmap;
  import flash.display.CapsStyle;
  import flash.display.GraphicsEndFill;
  import flash.display.GraphicsPath;
  import flash.display.GraphicsPathCommand;
  import flash.display.GraphicsSolidFill;
  import flash.display.GraphicsStroke;
  import flash.display.JointStyle;
  import flash.display.LineScaleMode;
  import flash.geom.Matrix;

  public class GraphicHelper {

    public static const END_FILL:GraphicsEndFill = new GraphicsEndFill();
    public static const _H_2:Vector.<int> = new <int>[GraphicsPathCommand.MOVE_TO, GraphicsPathCommand.LINE_TO, GraphicsPathCommand.LINE_TO, GraphicsPathCommand.LINE_TO];
    public static const _E__:GraphicsStroke = new GraphicsStroke(1, false, LineScaleMode.NORMAL, CapsStyle.NONE, JointStyle.ROUND, 3, new GraphicsSolidFill(0xFF0000));
    public static const _H_B_:GraphicsStroke = new GraphicsStroke();
    private static const _H_6:Number = (2 * Math.PI);//6.28318530717959
    public static const _0D_3:Array = [true, true, true, true];

    public static function _0L_6(data:GraphicsPath):void {
      data.commands.length = 0;
      data.data.length = 0;
    }

    public static function _wj(_arg1:int, _arg2:int, _arg3:int, _arg4:int):GraphicsPath {
      new GraphicsPath(_H_2, new <Number>[_arg1, _arg2, (_arg1 + _arg3), _arg2, (_arg1 + _arg3), (_arg2 + _arg4), _arg1, (_arg2 + _arg4)]);
      return null;
    }

    public static function _0L_0(_arg1:Number, _arg2:Number, _arg3:Number = 0, _arg4:Number = 0, _arg5:Number = 0):Matrix {
      var _local6:Matrix = new Matrix();
      _local6.createGradientBox(_arg1, _arg2, _arg3, _arg4, _arg5);
      return (_local6);
    }

    public static function drawRect(_arg1:int, _arg2:int, _arg3:int, _arg4:int, _arg5:GraphicsPath):void {
      _arg5.moveTo(_arg1, _arg2);
      _arg5.lineTo((_arg1 + _arg3), _arg2);
      _arg5.lineTo((_arg1 + _arg3), (_arg2 + _arg4));
      _arg5.lineTo(_arg1, (_arg2 + _arg4));
    }

    public static function drawCircle(_arg1:Number, _arg2:Number, _arg3:Number, _arg4:GraphicsPath, _arg5:int = 8):void {
      var _local8:Number;
      var _local9:Number;
      var _local10:Number;
      var _local11:Number;
      var _local12:Number;
      var _local13:Number;
      var _local6:Number = (1 + (1 / (_arg5 * 1.75)));
      _arg4.moveTo((_arg1 + _arg3), _arg2);
      var _local7:int = 1;
      while (_local7 <= _arg5) {
        _local8 = ((_H_6 * _local7) / _arg5);
        _local9 = ((_H_6 * (_local7 - 0.5)) / _arg5);
        _local10 = (_arg1 + (_arg3 * Math.cos(_local8)));
        _local11 = (_arg2 + (_arg3 * Math.sin(_local8)));
        _local12 = (_arg1 + ((_arg3 * _local6) * Math.cos(_local9)));
        _local13 = (_arg2 + ((_arg3 * _local6) * Math.sin(_local9)));
        _arg4.curveTo(_local12, _local13, _local10, _local11);
        _local7++;
      }
    }

    public static function drawUI(x:int, y:int, width:int, height:int, cornerRadius:int, corner:Array, data:GraphicsPath):void {
      if (corner[0] != 0) {
        data.moveTo(x, (y + cornerRadius));
        data.lineTo((x + cornerRadius), y);
      } else {
        data.moveTo(x, y);
      }
      if (corner[1] != 0) {
        data.lineTo(((x + width) - cornerRadius), y);
        data.lineTo((x + width), (y + cornerRadius));
      } else {
        data.lineTo((x + width), y);
      }
      if (corner[2] != 0) {
        data.lineTo((x + width), ((y + height) - cornerRadius));
        data.lineTo(((x + width) - cornerRadius), (y + height));
      } else {
        data.lineTo((x + width), (y + height));
      }
      if (corner[3] != 0) {
        data.lineTo((x + cornerRadius), (y + height));
        data.lineTo(x, ((y + height) - cornerRadius));
      } else {
        data.lineTo(x, (y + height));
      }
      if (corner[0] != 0) {
        data.lineTo(x, (y + cornerRadius));
      } else {
        data.lineTo(x, y);
      }
    }

    public static function drawSpacer(x:Number, y:Number, cornerRadius:Number, data:GraphicsPath):void {
      data.moveTo(x, (y - cornerRadius));
      data.lineTo((x + cornerRadius), y);
      data.lineTo(x, (y + cornerRadius));
      data.lineTo((x - cornerRadius), y);
    }

    public static function darkenColor(hexColor:Number, percent:Number):Number{
      if(isNaN(percent))
        percent=0;
      if(percent>100)
        percent=100;
      if(percent<0)
        percent=0;

      var factor:Number=1-(percent/100);
      var rgb:Object=hexToRgb(hexColor);

      rgb.r*=factor;
      rgb.b*=factor;
      rgb.g*=factor;

      return rgbToHex(Math.round(rgb.r),Math.round(rgb.g),Math.round(rgb.b));
    }

    public static function rgbToHex(r:Number, g:Number, b:Number):Number {
      return(r<<16 | g<<8 | b);
    }

    public static function hexToRgb (hex:Number):Object{
      return {r:(hex & 0xff0000) >> 16,g:(hex & 0x00ff00) >> 8,b:hex & 0x0000ff};
    }

  }
}//package com.company.util


