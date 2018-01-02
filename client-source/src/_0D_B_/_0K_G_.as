// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0D_B_._0K_G_

package _0D_B_ {
import flash.display.Sprite;
import flash.geom.ColorTransform;
import flash.display.BitmapData;
import flash.display.Bitmap;

import com.company.ui.SimpleText;
import com.company.assembleegameclient.util.TextureRedrawer;

import flash.filters.DropShadowFilter;
import flash.events.MouseEvent;

import com.company.util.MoreColorUtil;
import com.company.util._G_;

public class _0K_G_ extends Sprite {

    protected static const _0A_8:ColorTransform = new ColorTransform(1, (220 / 0xFF), (133 / 0xFF));

    public function _0K_G_(_arg1:BitmapData, _arg2:uint, _arg3:String) {
        this._01B_ = _arg1;
        this._D_j = TextureRedrawer.redraw(_arg1, this._aW_(), true, 0, 0);
        this._5U_ = new Bitmap(this._D_j);
        this._5U_.filters = [new DropShadowFilter(0, 0, 0)];
        this._5U_.x = -12;
        this._5U_.y = -12;
        addChild(this._5U_);
        this.text_ = new SimpleText(18, _arg2, false, 0, 0, "Myriad Pro");
        this.text_.setBold(true);
        this.text_.text = _arg3;
        this.text_.updateMetrics();
        this.text_.filters = [new DropShadowFilter(0, 0, 0)];
        this.text_.x = 20;
        this.text_.y = -6;
        addChild(this.text_);
        addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
        addEventListener(MouseEvent.MOUSE_OUT, this.onMouseOut);
    }
    protected var _01B_:BitmapData;
    protected var _D_j:BitmapData;
    protected var _5U_:Bitmap;
    protected var text_:SimpleText;
    protected var _4p:ColorTransform = null;

    public function _037(_arg1:ColorTransform):void {
        var _local2:BitmapData;
        if (_arg1 == this._4p) {
            return;
        }
        this._4p = _arg1;
        if (this._4p == null) {
            this._5U_.bitmapData = this._D_j;
            this.text_.transform.colorTransform = MoreColorUtil.identity;
        } else {
            _local2 = _G_._B_2(this._01B_, this._4p);
            _local2 = TextureRedrawer.redraw(_local2, this._aW_(), true, 0, 0);
            this._5U_.bitmapData = _local2;
            this.text_.transform.colorTransform = this._4p;
        }
    }

    protected function _aW_():int {
        return ((40 / (this._01B_.width / 8)));
    }

    protected function onMouseOver(_arg1:MouseEvent):void {
        this._037(_0A_8);
    }

    protected function onMouseOut(_arg1:MouseEvent):void {
        this._037(null);
    }

}
}//package _0D_B_

