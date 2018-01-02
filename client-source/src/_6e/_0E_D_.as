// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_6e._0E_D_

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
import flash.events.Event;
import flash.events.MouseEvent;

import _6e.*;

internal class _0E_D_ extends Sprite {

    public static const _lV_:int = 400;
    public static const _05N_:int = 400;

    public function _0E_D_(_arg1:String) {
        this._vV_ = new GraphicsSolidFill(0x2a2a2a, 1);
        this.outlineFill_ = new GraphicsSolidFill(0xFFFFFF, 1);
        this._0y = new GraphicsStroke(2, false, LineScaleMode.NORMAL, CapsStyle.NONE, JointStyle.ROUND, 3, this.outlineFill_);
        this.path_ = new GraphicsPath(new Vector.<int>(), new Vector.<Number>());
        this.graphicsData_ = new <IGraphicsData>[_0y, _vV_, path_, GraphicHelper.END_FILL, GraphicHelper._H_B_];
        super();
        this.text_ = _arg1;
        this._017 = new Sprite();
        var _local2:Shape = new Shape();
        var _local3:Graphics = _local2.graphics;
        _local3.beginFill(0);
        _local3.drawRect(0, 0, _lV_, _05N_);
        _local3.endFill();
        this._017.addChild(_local2);
        this._017.mask = _local2;
        addChild(this._017);
        this._M_Z_ = new SimpleText(16, 0xB3B3B3, true, _lV_, _05N_, "Myriad Pro");
        this._M_Z_.border = false;
        this._M_Z_.mouseEnabled = true;
        this._M_Z_.multiline = true;
        this._M_Z_.wordWrap = true;
        this._M_Z_.text = _arg1;
        this._M_Z_._08S_();
        this._M_Z_.addEventListener(Event.CHANGE, this._0L_B_);
        this._M_Z_.addEventListener(Event.SCROLL, this._0L_B_);
        this._017.addChild(this._M_Z_);
        this._E_k = new _0K_B_(16, (_05N_ - 4));
        this._E_k.x = (_lV_ + 6);
        this._E_k.y = 0;
        this._E_k._fA_(400, this._M_Z_.height);
        this._E_k.addEventListener(Event.CHANGE, this._A_E_);
        addChild(this._E_k);
        this.w_ = (_lV_ + 26);
        this._t3 = new _7f(14, "Cancel", 120);
        this._t3.x = 4;
        this._t3.y = (_05N_ + 4);
        this._t3.addEventListener(MouseEvent.CLICK, this.onCancel);
        addChild(this._t3);
        this._B_k = new _7f(14, "Save", 120);
        this._B_k.x = ((this.w_ - this._B_k.width) - 4);
        this._B_k.y = (_05N_ + 4);
        this._B_k.addEventListener(MouseEvent.CLICK, this._na);
        addChild(this._B_k);
        this.h_ = ((_05N_ + this._B_k.height) + 8);
        graphics.clear();
        GraphicHelper._0L_6(this.path_);
        GraphicHelper.drawUI(-6, -6, (this.w_ + 12), (this.h_ + 12), 4, [1, 1, 1, 1], this.path_);
        graphics.drawGraphicsData(this.graphicsData_);
        this._E_k._fA_(_05N_, this._M_Z_.textHeight, false);
    }
    public var w_:int;
    public var h_:int;
    private var graphicsData_:Vector.<IGraphicsData>;
    private var text_:String;
    private var _M_Z_:SimpleText;
    private var _017:Sprite;
    private var _gJ_:Sprite;
    private var _E_k:_0K_B_;
    private var _t3:_7f;
    private var _B_k:_7f;
    private var _vV_:GraphicsSolidFill;
    private var outlineFill_:GraphicsSolidFill;
    private var _0y:GraphicsStroke;
    private var path_:GraphicsPath;

    public function _03h():String {
        return (this._M_Z_.text);
    }

    private function _A_E_(_arg1:Event):void {
        this._M_Z_.scrollV = (1 + (this._E_k._Q_D_() * this._M_Z_.maxScrollV));
    }

    private function onCancel(_arg1:Event):void {
        dispatchEvent(new Event(Event.CANCEL));
    }

    private function _na(_arg1:Event):void {
        dispatchEvent(new Event(Event.COMPLETE));
    }

    private function _0L_B_(_arg1:Event):void {
        if (this._E_k == null) {
            return;
        }
        this._E_k._fA_(_05N_, this._M_Z_.textHeight, false);
        if (this._M_Z_.maxScrollV == 1) {
            this._E_k._0D__(0);
        } else {
            this._E_k._0D__(((this._M_Z_.scrollV - 1) / (this._M_Z_.maxScrollV - 1)));
        }
    }

}
}//package _6e

