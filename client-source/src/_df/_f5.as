// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_df._f5

package _df {
import com.company.util._kp;
import com.company.assembleegameclient.util._lJ_;

import flash.display.Sprite;
import flash.display.Bitmap;
import flash.events.Event;
import flash.filters.ColorMatrixFilter;

import com.company.assembleegameclient.util._J_H_;

import flash.utils.getTimer;

import com.company.assembleegameclient.util.TextureRedrawer;

import flash.display.BitmapData;

public class _f5 extends Preview {

    private static var animationpreviewiconsEmbed_:Class = _7K_;
    private static var _bH_:_kp = function ():_kp {
        var _local1:* = new _kp();
        _local1.addFromBitmapData(new animationpreviewiconsEmbed_().bitmapData, 16, 16);
        return (_local1);
    }();

    public function _f5(w:int, h:int) {
        super(w, h);
        var walkBitmap:Bitmap = new Bitmap(_bH_._W_u[1]);
        walkBitmap.scaleX = (walkBitmap.scaleY = 2);
        this._Q_e = _yO_(walkBitmap, function ():void {
            action_ = _lJ_._m1;
        });
        this._Q_e.x = ((w_ / 2) - (this._Q_e.width / 2));
        this._Q_e.y = ((h_ - this._Q_e.height) - 5);
        var standBitmap:Bitmap = new Bitmap(_bH_._W_u[0]);
        standBitmap.scaleX = (standBitmap.scaleY = 2);
        this._iz = _yO_(standBitmap, function ():void {
            action_ = _lJ_._sS_;
        });
        this._iz.x = ((this._Q_e.x - this._iz.width) - 5);
        this._iz.y = ((h_ - this._iz.height) - 5);
        var attackBitmap:Bitmap = new Bitmap(_bH_._W_u[2]);
        attackBitmap.scaleX = (attackBitmap.scaleY = 2);
        this._hh = _yO_(attackBitmap, function ():void {
            action_ = _lJ_._E_w;
        });
        this._hh.x = ((this._Q_e.x + this._Q_e.width) + 5);
        this._hh.y = ((h_ - this._hh.height) - 5);
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }
    private var _yN_:_lJ_ = null;
    private var action_:int = 0;
    private var _iz:Sprite;
    private var _Q_e:Sprite;
    private var _hh:Sprite;

    override public function redraw():void {
        super.redraw();
        this._iz.filters = (((this.action_) == _lJ_._sS_) ? [new ColorMatrixFilter(_R_2)] : []);
        this._Q_e.filters = (((this.action_) == _lJ_._m1) ? [new ColorMatrixFilter(_R_2)] : []);
        this._hh.filters = (((this.action_) == _lJ_._E_w) ? [new ColorMatrixFilter(_R_2)] : []);
        if ((((_lT_ == null)) || ((_lT_.width <= 16)))) {
            return;
        }
        this._yN_ = new _lJ_(new _J_H_(_lT_, null), (_lT_.width / 7), _lT_.height, _lJ_.RIGHT);
        this._yu();
    }

    protected function _yu():void {
        if (this._yN_ == null) {
            return;
        }
        var _local1:Number = ((getTimer() % 400) / 400);
        var _local2:_J_H_ = this._yN_.imageFromDir(_lJ_.RIGHT, this.action_, _local1);
        bitmap_.bitmapData = TextureRedrawer.redraw(_local2.image_, size_, true, 0, 0, false);
        position();
    }

    private function onAddedToStage(_arg1:Event):void {
        addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
    }

    private function onRemovedFromStage(_arg1:Event):void {
        removeEventListener(Event.ENTER_FRAME, this.onEnterFrame);
    }

    private function onEnterFrame(_arg1:Event):void {
        this._yu();
    }

}
}//package _df

