// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.ui._0M_Y_

package com.company.assembleegameclient.ui {
import _sp._aJ_;

import com.company.assembleegameclient.objects.Player;

import com.company.assembleegameclient.parameters.Parameters;
import com.company.ui.SimpleText;

import flash.display.Bitmap;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;

public class _0M_Y_ extends Sprite {

    public static var options_:_aJ_ = new _aJ_(Boolean);

    public function _0M_Y_(_arg1:int, _arg2:int, _arg3:uint, _arg4:uint, _arg5:String = null) {
        this._03o = new Sprite();
        this.CornerTL = new Bitmap(new BarCornerTL());
        this.CornerBR = new Bitmap(new BarCornerBR());
        super();
        addChild(this._03o);
        addChild(this.CornerTL);
        addChild(this.CornerBR);
        this.w_ = _arg1;
        this.h_ = _arg2;
        this._oi = (this.color_ = _arg3);
        this._eI_ = (this._F_h = _arg4);
        this._native = 0xFFFFFF;
        if (((!((_arg5 == null))) && (!((_arg5.length == 0))))) {
            this.labelText_ = new SimpleText(14, this._native, false, 0, 0, "CHIP SBKI");
            this.labelText_.setBold(true);
            this.labelText_.text = _arg5;
            this.labelText_.updateMetrics();
            this.labelText_.y = -2;
            this.labelText_.filters = [new DropShadowFilter(0, 0, 0)];
            this.labelText_.x = 4;
            addChild(this.labelText_);
        }
        this._08m = new SimpleText(13, 0xFFFFFF, false, 0, 0, "CHIP SBKI");
        this._08m.setBold(true);
        this._08m.filters = [new DropShadowFilter(0, 0, 0)];
        this._08m.y = -1;
        this._0M_M_ = new SimpleText(13, this._native, false, 0, 0, "CHIP SBKI");
        this._0M_M_.setBold(true);
        this._0M_M_.alpha = 0.6;
        this._0M_M_.y = -1;
        this._0M_M_.filters = [new DropShadowFilter(0, 0, 0)];
        this._5B_ = new SimpleText(15, 9493531, false, 0, 0, "CHIP SBKI");
        this._5B_.setBold(true);
        this._5B_.x = (this.w_ - 25);
        this._5B_.y = -1;
        this._5B_.text = "x2";
        this._5B_.filters = [new DropShadowFilter(0, 0, 0)];
        this.CornerTL.y = 0;
        this.CornerTL.x = 0;
        this.CornerBR.y = 0;
        this.CornerBR.x = this.w_ - CornerBR.width;
        if (!(Parameters.data_.toggleBarText)) {
            addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
            addEventListener(MouseEvent.MOUSE_OUT, this.onMouseOut);
        }
        options_.add(this.extraMouseHandler);
    }
    public var w_:int;
    public var h_:int;
    public var color_:uint;
    public var _F_h:uint;
    public var _R_V_:uint;
    public var _native:uint;
    public var val_:int = -1;
    public var _05E_:int = -1;
    public var boost_:int = -1;
    public var _w1:int = -1;
    public var labelText_:SimpleText;
    public var _08m:SimpleText;
    public var _0M_M_:SimpleText;
    public var _5B_:SimpleText;
    public var _68:Boolean = false;
    private var _03o:Sprite;
    private var _oi:Number;
    private var _eI_:Number;
    private var _3d:Boolean = false;
    private var _O_r:int;
    private var _02j:int = -1;
    private var speed = 0.1;
    private var CornerTL:Bitmap;
    private var CornerBR:Bitmap;

    public function draw(_arg1:int, _arg2:int, _arg3:int, _arg4:int = -1):void {
        if (_arg2 > 0) {
            _arg1 = Math.min(_arg2, Math.max(0, _arg1));
        }
        if ((((((((_arg1 == this.val_)) && ((_arg2 == this._05E_)))) && ((_arg3 == this.boost_)))) && ((_arg4 == this._w1)))) {
            return;
        }
        this.val_ = _arg1;
        this._05E_ = _arg2;
        this.boost_ = _arg3;
        this._w1 = _arg4;
        this._0E_J_();
    }

    public function _Y_r(_arg1:Boolean, _arg2:int):void {
        if (_arg1) {
            if (this._5B_.text != ("x" + _arg2).toString())
                this._5B_.text = "x" + _arg2;
            addChild(this._5B_);
            this._W_K_(3, 9493531, 0xFFFFFF);
        } else {
            if (this._5B_.parent) {
                removeChild(this._5B_);
            }
        }
    }

    public function _W_K_(_arg1:Number, _arg2:Number, _arg3:Number):void {
        this._3d = true;
        this.color_ = _arg2;
        this._R_V_ = _arg3;
        this._O_r = _arg1;
        this._0E_J_();
        addEventListener(Event.ENTER_FRAME, this._0F__);
    }

    private function _S_H_(_arg1:uint):void {
        this._native = _arg1;
        if (this._0M_M_ != null) {
            this._0M_M_.setColor(this._native);
        }
        this._08m.setColor(this._native);
    }

    private function _0E_J_():void {
        graphics.clear();
        this._03o.graphics.clear();

        var _local1:uint = 0xFFFFFF;
        if ((((this._w1 > 0)) && (((this._05E_ - this.boost_) == this._w1)))) {
            _local1 = 0xFCDF00;
        } else {
            if (this.boost_ > 0) {
                _local1 = 6206769;
            }
        }
        if (this._native != _local1) {
            this._S_H_(_local1);
        }
        graphics.beginFill(this._F_h);
        graphics.drawRect(0, 0, this.w_, this.h_);
        graphics.endFill();
        if (this._3d) {
            this._03o.graphics.beginFill(this._R_V_);
            this._03o.graphics.drawRect(0, 0, this.w_, this.h_);
        }
        this._03o.graphics.beginFill(this.color_);
        if (this._05E_ > 0) {
            this._03o.graphics.drawRect(0, 0, (this.w_ * (this.val_ / this._05E_)), this.h_);
        } else {
            this._03o.graphics.drawRect(0, 0, this.w_, this.h_);
        }
        this._03o.graphics.endFill();
        if ((Parameters.data_.toggleBarText) || ((this._68) && (this.h_ > 4))) {
            if (this._05E_ > 0) {
                if (Parameters.data_.togglePercentage) {
                    this._08m.text = ("" + (Math.round(((this.val_ / this._05E_) * 100)) + "%") + " (" + NumberFormat(this.val_) + ")");
                } else {
                    this._08m.text = ("" + NumberFormat(this.val_) + "/" + NumberFormat(this._05E_));
                }
            } else {
                this._08m.text = ("" + this.val_);
            }
            this._08m.updateMetrics();
            if (!contains(this._08m)) {
                addChild(this._08m);
            }
            if (this.boost_ != 0 && !Parameters.data_.togglePercentage) {
                this._0M_M_.text = (((" (" + (((this.boost_ > 0)) ? "+" : "")) + this.boost_.toString()) + ")");
                this._0M_M_.updateMetrics();
                this._08m.x = ((this.w_ / 2) - ((this._08m.width + this._0M_M_.width) / 2));
                this._0M_M_.x = (this._08m.x + this._08m.width);
                if (!contains(this._0M_M_)) {
                    addChild(this._0M_M_);
                }
            } else {
                this._08m.x = ((this.w_ / 2) - (this._08m.width / 2));
                if (contains(this._0M_M_)) {
                    removeChild(this._0M_M_);
                }
            }
        } else {
            if (contains(this._08m)) {
                removeChild(this._08m);
            }
            if (contains(this._0M_M_)) {
                removeChild(this._0M_M_);
            }
        }
    }

    private function extraMouseHandler(_arg1:Boolean):void {
        this._68 = false;
        if (_arg1) {
            removeEventListener(MouseEvent.ROLL_OVER, this.onMouseOver);
            removeEventListener(MouseEvent.ROLL_OUT, this.onMouseOut);
        } else {
            addEventListener(MouseEvent.ROLL_OVER, this.onMouseOver);
            addEventListener(MouseEvent.ROLL_OUT, this.onMouseOut);
        }
        this._0E_J_();
    }

    private function _0F__(_arg1:Event):void {
        if ((((this._03o.alpha > 1)) || ((this._03o.alpha < 0)))) {
            this._02j = (this._02j * -1);
            if (this._03o.alpha > 1) {
                this._O_r--;
                if (!this._O_r) {
                    this._3d = false;
                    this.color_ = this._oi;
                    this._F_h = this._eI_;
                    this._03o.alpha = 1;
                    this._0E_J_();
                    removeEventListener(Event.ENTER_FRAME, this._0F__);
                }
            }
        }
        this._03o.alpha = (this._03o.alpha + (this.speed * this._02j));
    }


  private static function NumberFormat(number:int):String {
    var suffix:Array = ["K", "M", "B", "T"];
    var size:int = (number != 0) ? logx(number) : 0;
    if (size >= 3) {
      while (size % 3 != 0) {
        size = size - 1;
      }
    }

    var notation:Number = Math.pow(10, size);
    var result:* = (size >= 3) ? +(Math.round((number / notation) * 100) / 100.0) + suffix[(size / 3) - 1] : +number + "";
    return result;
  }
  public static function logx(val:Number, base:Number = 10):Number {
    return Math.log(val) / Math.log(base)
  }
    private function onMouseOver(_arg1:MouseEvent):void {
        this._68 = true;
        this._0E_J_();
    }

    private function onMouseOut(_arg1:MouseEvent):void {
        this._68 = false;
        this._0E_J_();
    }

}
}//package com.company.assembleegameclient.ui

