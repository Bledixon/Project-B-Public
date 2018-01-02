// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_6e._03v

package _6e {
import flash.display.Sprite;

import flash.display.IGraphicsData;

import com.company.util.GraphicHelper;
import com.company.ui.SimpleText;
import com.company.assembleegameclient.ui._0K_B_;
import com.company.assembleegameclient.ui._7f;

import flash.display.GraphicsSolidFill;
import flash.display.GraphicsStroke;
import flash.display.GraphicsPath;
import flash.display.LineScaleMode;
import flash.display.CapsStyle;
import flash.display.JointStyle;
import flash.display.Shape;
import flash.display.Graphics;

import com.company.util._sH_;

import flash.events.Event;
import flash.events.MouseEvent;

import _6e.*;

internal class _03v extends Sprite {

    public static const _lV_:int = 400;
    public static const _05N_:int = 400;
    private static const _pH_:RegExp = /((https?|ftp):((\/\/)|(\\\\))+[\w\d:#@%\/;$()~_?\+-=\\\.&]*)/g;

    public function _03v(_arg1:String, _arg2:Boolean) {
        this._vV_ = new GraphicsSolidFill(0x2a2a2a, 1);
        this.outlineFill_ = new GraphicsSolidFill(0xFFFFFF, 1);
        this._0y = new GraphicsStroke(2, false, LineScaleMode.NORMAL, CapsStyle.NONE, JointStyle.ROUND, 3, this.outlineFill_);
        this.path_ = new GraphicsPath(new Vector.<int>(), new Vector.<Number>());
        this.graphicsData_ = new <IGraphicsData>[_0y, _vV_, path_, GraphicHelper.END_FILL, GraphicHelper._H_B_];
        super();
        this.text_ = _arg1;
        this._017 = new Sprite();
        var _local3:Shape = new Shape();
        var _local4:Graphics = _local3.graphics;
        _local4.beginFill(0);
        _local4.drawRect(0, 0, _lV_, _05N_);
        _local4.endFill();
        this._017.addChild(_local3);
        this._017.mask = _local3;
        addChild(this._017);
        var _local5:String = _sH_._M_6(_arg1);
        _local5.replace(_pH_, ('<font color="#7777EE"><a href="$1" target="_blank">' + "$1</a></font>"));
        _local5 = _arg1;
        this._M_Z_ = new SimpleText(16, 0xB3B3B3, false, _lV_, 0, "Myriad Pro");
        this._M_Z_.border = false;
        this._M_Z_.mouseEnabled = true;
        this._M_Z_.multiline = true;
        this._M_Z_.wordWrap = true;
        this._M_Z_.htmlText = _local5;
        this._M_Z_._08S_();
        this._017.addChild(this._M_Z_);
        var _local6 = (this._M_Z_.height > 400);
        if (_local6) {
            this._E_k = new _0K_B_(16, (_05N_ - 4));
            this._E_k.x = (_lV_ + 6);
            this._E_k.y = 0;
            this._E_k._fA_(400, this._M_Z_.height);
            this._E_k.addEventListener(Event.CHANGE, this._A_E_);
            addChild(this._E_k);
        }
        this.w_ = (_lV_ + ((_local6) ? 26 : 0));
        this._5Y_ = new _7f(14, "Edit", 120);
        this._5Y_.x = 4;
        this._5Y_.y = (_05N_ + 4);
        this._5Y_.addEventListener(MouseEvent.CLICK, this._L_n);
        addChild(this._5Y_);
        this._5Y_.visible = _arg2;
        this._zF_ = new _7f(14, "Close", 120);
        this._zF_.x = ((this.w_ - this._zF_.width) - 4);
        this._zF_.y = (_05N_ + 4);
        this._zF_.addEventListener(MouseEvent.CLICK, this._of);
        addChild(this._zF_);
        this.h_ = ((_05N_ + this._zF_.height) + 8);
        graphics.clear();
        GraphicHelper._0L_6(this.path_);
        GraphicHelper.drawUI(-6, -6, (this.w_ + 12), (this.h_ + 12), 4, [1, 1, 1, 1], this.path_);
        graphics.drawGraphicsData(this.graphicsData_);
    }
    public var w_:int;
    public var h_:int;
    private var graphicsData_:Vector.<IGraphicsData>;
    private var text_:String;
    private var _M_Z_:SimpleText;
    private var _017:Sprite;
    private var _gJ_:Sprite;
    private var _E_k:_0K_B_;
    private var _5Y_:_7f;
    private var _zF_:_7f;
    private var _vV_:GraphicsSolidFill;
    private var outlineFill_:GraphicsSolidFill;
    private var _0y:GraphicsStroke;
    private var path_:GraphicsPath;

    private function _A_E_(_arg1:Event):void {
        this._M_Z_.y = (-(this._E_k._Q_D_()) * (this._M_Z_.height - 400));
    }

    private function _L_n(_arg1:Event):void {
        dispatchEvent(new Event(Event.CHANGE));
    }

    private function _of(_arg1:Event):void {
        dispatchEvent(new Event(Event.COMPLETE));
    }

}
}//package _6e

