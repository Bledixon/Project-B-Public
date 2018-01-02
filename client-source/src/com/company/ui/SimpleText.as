// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.ui.SimpleText

package com.company.ui {
import _0_p._q7;

import _zD_.__else;

import com.company.ui.fonts.*;

import flash.text.Font;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.text.TextFieldType;
import flash.events.Event;
import flash.text.TextLineMetrics;

public class SimpleText extends TextField {

    public function SimpleText(_arg1:int, _arg2:uint, _arg3:Boolean = false, _arg4:int = 0, _arg5:int = 0, _arg6:String = "Myriad Pro") {
        this._X_o = _arg4;
        if (this._X_o != 0) {
            width = _arg4;
        }
        this._p5 = _arg5;
        if (this._p5 != 0) {
            width = _arg5;
        }
        switch (_arg6) {
            case 'Myriad Pro':
                font = new MyriadPro();
                break;
            case 'Myriad Pro Bold':
                font = new MyriadProBold();
                break;
            case 'Myriad Pro CFF':
                font = new MyriadProCFF();
                break;
            case 'Myriad Pro Bold CFF':
                font = new MyriadProBoldCFF();
                break;
            case 'CHIP SB':
                font = new CHIPSB();
                break;
            case 'CHIP SBKI':
                font = new CHIPSBKI();
                break;
            default:
                font = new MyriadPro();
                break;
        }
        var _local7:TextFormat = new TextFormat();
        _local7.kerning = true;
        if (!(_arg6 == null) && !(_arg6 == "")) {
            embedFonts = true; // CHANGED - was true, changed to false so that text shows (there is a problem with embeded fonts)
            _local7.font = font.fontName;
        }
        _local7.size = _arg1;
        _local7.color = _arg2;
        defaultTextFormat = _local7;
        if (_arg3) {
            selectable = true;
            mouseEnabled = true;
            type = TextFieldType.INPUT;
            border = true;
            borderColor = _arg2;
            addEventListener(Event.CHANGE, this._bR_);
        } else {
            selectable = false;
            mouseEnabled = false;
        }
    }
    public var _X_o:int;
    public var _p5:int;
    public var _c9:int;
    public var _I_x:int;
    private var font:Font;

    public function _du(_arg1:int, _arg2:uint):void {
        var _local3:TextFormat = defaultTextFormat;
        _local3.size = _arg1;
        _local3.color = _arg2;
        setTextFormat(_local3);
        defaultTextFormat = _local3;
    }

    public function setColor(_arg1:uint):void {
        var _local2:TextFormat = defaultTextFormat;
        _local2.color = _arg1;
        setTextFormat(_local2);
        defaultTextFormat = _local2;
    }

    public function setBold(_arg1:Boolean):void {
        var _local2:TextFormat = defaultTextFormat;
        _local2.bold = _arg1;
        setTextFormat(_local2);
        defaultTextFormat = _local2;
    }

    public function setAlign(_arg1:String):void {
        var _local2:TextFormat = defaultTextFormat;
        _local2.align = _arg1;
        setTextFormat(_local2);
        defaultTextFormat = _local2;
    }

    public function setUnderline(_arg1:Boolean):void {
        var _local2:TextFormat = defaultTextFormat;
        _local2.underline = _arg1;
        setTextFormat(_local2);
        defaultTextFormat = _local2;
    }

    public function updateMetrics():void {
        var _local2:TextLineMetrics;
        var _local3:int;
        var _local4:int;
        this._c9 = 0;
        this._I_x = 0;
        var _local1:int;
        while (_local1 < numLines) {
            _local2 = getLineMetrics(_local1);
            _local3 = (_local2.width + 4);
            _local4 = (_local2.height + 4);
            if (_local3 > this._c9) {
                this._c9 = _local3;
            }
            this._I_x = (this._I_x + _local4);
            _local1++;
        }
        width = (((this._X_o) == 0) ? this._c9 : this._X_o);
        height = (((this._p5) == 0) ? this._I_x : this._p5);
    }

    public function _08S_():void {
        width = (((this._X_o) == 0) ? (textWidth + 4) : this._X_o);
        height = (((this._p5) == 0) ? (textHeight + 4) : this._p5);
    }

    private function _bR_(_arg1:Event):void {
        this.updateMetrics();
    }

}
}//package com.company.ui

