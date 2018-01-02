// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_F_1._02a

package _F_1 {
import _011.MapInfo;

import flash.display.Sprite;
import flash.display.DisplayObjectContainer;

import com.company.ui.SimpleText;

import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.display.BitmapData;
import flash.display.Bitmap;
import flash.utils.Timer;
import flash.events.Event;
import flash.text.TextFieldAutoSize;
import flash.events.TimerEvent;

import _05R_.GTween;

public class _02a extends Sprite {

    public static const _0L_e:Number = 1000;
    public static const _S_h:int = 5;
    public static const _us:Number = 0.4;
    public static const _02x:Number = 200;

    public function _02a():void {
        this._J_8 = _dy;
        super();
        this._rc = new _kd(this._J_8);
        this._rc.ready.addOnce(this._b);
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }
    public var _J_8:Class;
    private var screen:DisplayObjectContainer;
    private var _50:SimpleText;
    private var _2S_:Vector.<DisplayObject>;
    private var _X_Y_:MovieClip;
    private var charContainer:MovieClip;
    private var _W_Q_:Boolean;
    private var _rc:_kd;
    private var _O__:Boolean;
    private var background:MovieClip;
    private var _kw:String;
    private var difficulty_:int;
    private var _P_f:int;
    private var bmpData1:BitmapData;
    private var bmpData2:BitmapData;
    private var _nF_:Bitmap;
    private var _ir:Timer;

    public function display(_arg1:MapInfo, _arg2:int, _arg3:BitmapData, _arg4:BitmapData):void {
        this._kw = (_arg1.conMessage_ != "") ? _arg1.conMessage_ : ((_arg1.name_) ? _arg1.name_ : "");
        this.difficulty_ = _arg2;
        if (((_arg3) && (_arg4))) {
            this.bmpData1 = _arg3;
            this.bmpData2 = _arg4;
            this._nF_ = new Bitmap(this.bmpData1);
        }
        this._aX_();
    }

    public function _pW_(_arg1:Boolean = false):void {
        this._W_Q_ = true;
        this._0A_M_();
    }

    private function _b(_arg1:_kd):void {
        var _local1:MovieClip;
        this.screen = (_arg1.content as MovieClip); //new MapLoadingScreen();
        this.background = (this.screen.getChildByName("background") as MovieClip);
        _local1 = (this.screen.getChildByName("mapNameContainer") as MovieClip);
        this._50 = new SimpleText(30, 0xFFFFFF, false, 0, 0, "Myriad Pro");
        this._50.setBold(true);
        this._50.autoSize = TextFieldAutoSize.CENTER;
        this._50.updateMetrics();
        this._50.x = _local1.x;
        this._50.y = _local1.y;
        this.screen.addChild(this._50);
        this.charContainer = (this.screen.getChildByName("charContainer") as MovieClip);
        this._X_Y_ = (this.screen.getChildByName("difficulty_indicators") as MovieClip);
        this._X_Y_.visible = true;
        this.screen.getChildByName("bgGroup").visible = false;
        this._2S_ = new Vector.<DisplayObject>(_S_h);
        var _local2:int = 1;
        while (_local2 <= _S_h) {
            this._2S_[(_local2 - 1)] = this._X_Y_.getChildByName(("indicator_" + _local2));
            _local2++;
        }
        addChild(this.screen);
        this._ir = new Timer(_02x);
        this._aX_();
    }

    private function _aX_():void {
        var _local1:int;
        if (this.screen) {
            this._50.text = this._kw;
            if (this.difficulty_ <= 0) {
                this.screen.getChildByName("bgGroup").visible = false;
                this._X_Y_.visible = false;
            } else {
                this.screen.getChildByName("bgGroup").visible = true;
                this._X_Y_.visible = true;
                _local1 = 0;
                while (_local1 < _S_h) {
                    this._2S_[_local1].visible = (_local1 < this.difficulty_);
                    _local1++;
                }
            }
            if (this._nF_) {
                addChild(this._nF_);
                this._nF_.x = ((this.charContainer.x - (this._nF_.width / 2)) + 5);
                this._nF_.y = (this.charContainer.y - (this._nF_.height / 2));
            }
            this._ir.addEventListener(TimerEvent.TIMER, this._I_1);
            this._ir.start();
        }
    }

    private function _X_8():void {
        var _local1:GTween = new GTween(this, _us, {"alpha": 0});
        _local1.onComplete = this._8l;
        mouseEnabled = false;
        mouseChildren = false;
    }

    private function _8l(_arg1:GTween):void {
        ((parent) && (parent.removeChild(this)));
    }

    private function _0A_M_():void {
        if (((this._W_Q_) && ((this._ir.currentCount >= (_0L_e / _02x))))) {
            this._X_8();
        }
    }

    private function _I_1(_arg1:TimerEvent):void {
        if (this._nF_) {
            this._nF_.bitmapData = (((this._nF_.bitmapData == this.bmpData2)) ? this.bmpData1 : this.bmpData2);
        }
        this._0A_M_();
    }

    private function onRemovedFromStage(_arg1:Event):void {
        if (this._ir) {
            this._ir.stop();
            this._ir = null;
        }
    }

}
}//package _F_1

