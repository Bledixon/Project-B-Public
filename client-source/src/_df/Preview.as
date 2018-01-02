// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_df.Preview

package _df {
import flash.display.Sprite;

import com.company.util.MoreColorUtil;

import flash.display.BitmapData;

import com.company.ui.SimpleText;

import flash.display.Bitmap;
import flash.events.MouseEvent;
import flash.filters.ColorMatrixFilter;

public class Preview extends Sprite {

    private static const _pF_:int = 300;
    private static const _09f:int = 40;
    protected static const _R_2:Array = MoreColorUtil._fL_(0x4F4F4F);

    private static var _tQ_:Class = _04o;
    private static var _ij:Class = _0F_2;

    public function Preview(_arg1:int, _arg2:int) {
        this.w_ = _arg1;
        this.h_ = _arg2;
        this.size_ = 100;
        graphics.lineStyle(1, 0xFFFFFF);
        graphics.beginFill(0x7F7F7F, 1);
        graphics.drawRect(0, 0, this.w_, this.h_);
        graphics.lineStyle();
        graphics.endFill();
        this.bitmap_ = new Bitmap();
        addChild(this.bitmap_);
        this._081 = new SimpleText(16, 0xFFFFFF, false, 0, 0, "Myriad Pro");
        this._081.setBold(true);
        this._081.text = (this.size_ + "%");
        this._081.updateMetrics();
        this._081.x = 2;
        addChild(this._081);
        this._6d = this._yO_(new _tQ_(), this._Q_x);
        this._6d.x = ((this.w_ - this._6d.width) - 5);
        this._6d.y = 5;
        this._070 = this._yO_(new _ij(), this._0_7);
        this._070.x = ((this._6d.x - this._070.width) - 5);
        this._070.y = 5;
    }
    protected var w_:int;
    protected var h_:int;
    protected var size_:int;
    protected var _lT_:BitmapData;
    protected var bitmap_:Bitmap;
    private var _081:SimpleText;
    private var _6d:Sprite;
    private var _070:Sprite;

    public function _I_D_(_arg1:BitmapData):void {
        this._lT_ = _arg1;
        this.redraw();
        this.position();
    }

    public function redraw():void {
        this._081.text = (this.size_ + "%");
        this._081.updateMetrics();
        this._6d.filters = (((this.size_) == _pF_) ? [new ColorMatrixFilter(_R_2)] : []);
        this._070.filters = (((this.size_) == _09f) ? [new ColorMatrixFilter(_R_2)] : []);
    }

    public function position():void {
        this.bitmap_.x = ((this.w_ / 2) - (this.bitmap_.width / 2));
        this.bitmap_.y = ((this.h_ / 2) - (this.bitmap_.height / 2));
    }

    protected function _yO_(_arg1:Bitmap, _arg2:Function):Sprite {
        var _local3:Sprite = new Sprite();
        _local3.addChild(_arg1);
        var _local4:IconCallback = new IconCallback(this, _arg2);
        _local3.addEventListener(MouseEvent.MOUSE_DOWN, _local4.handler);
        addChild(_local3);
        return (_local3);
    }

    private function _Q_x():void {
        if (this.size_ == _pF_) {
            return;
        }
        this.size_ = (this.size_ + 20);
    }

    private function _0_7():void {
        if (this.size_ == _09f) {
            return;
        }
        this.size_ = (this.size_ - 20);
    }

}
}//package _df

import _df.Preview;

import flash.events.Event;

class IconCallback {

    public var preview_:Preview;
    public var callback_:Function;

    public function IconCallback(_arg1:Preview, _arg2:Function):void {
        this.preview_ = _arg1;
        this.callback_ = _arg2;
    }

    public function handler(_arg1:Event):void {
        this.callback_();
        this.preview_.redraw();
        this.preview_.position();
    }

}

