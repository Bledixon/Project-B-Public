// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_df._R_y

package _df {

import com.company.util._kp;

import flash.display.Sprite;
import flash.display.Bitmap;

import com.company.assembleegameclient.util._lJ_;

import flash.filters.ColorMatrixFilter;

import com.company.assembleegameclient.util._0B_c;
import com.company.assembleegameclient.util._J_H_;
import com.company.assembleegameclient.util.TextureRedrawer;

import flash.display.BitmapData;


public class _R_y extends Preview {

    private static const _sL_:Vector.<int> = new <int>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];

    private static var textilepreviewiconsEmbed_:Class = _ub;
    private static var _bH_:_kp = function ():_kp {
        var _local1:* = new _kp();
        _local1.addFromBitmapData(new textilepreviewiconsEmbed_().bitmapData, 16, 16);
        return (_local1);
    }();

    public function _R_y(w:int, h:int) {
        super(w, h);
        this._04W_ = _yO_(new Bitmap(_bH_._W_u[1]), this._A_c);
        this._04W_.x = ((w_ - this._04W_.width) - 5);
        this._04W_.y = ((h_ - this._04W_.height) - 5);
        this._D_P_ = _yO_(new Bitmap(_bH_._W_u[0]), this._02_);
        this._D_P_.x = ((this._04W_.x - this._D_P_.width) - 5);
        this._D_P_.y = ((h_ - this._D_P_.height) - 5);
        this._04U_ = _yO_(new Bitmap(_bH_._W_u[3]), function ():void {
            dir_ = _lJ_.RIGHT;
        });
        this._04U_.x = ((w_ - this._04U_.width) - 100);
        this._04U_.y = ((h_ - this._04U_.height) - 5);
        this._0_O_ = _yO_(new Bitmap(_bH_._W_u[4]), function ():void {
            dir_ = _lJ_.DOWN;
        });
        this._0_O_.x = ((this._04U_.x - this._0_O_.width) - 5);
        this._0_O_.y = ((h_ - this._0_O_.height) - 5);
        this._Y_t = _yO_(new Bitmap(_bH_._W_u[2]), function ():void {
            dir_ = _lJ_.UP;
        });
        this._Y_t.x = this._0_O_.x;
        this._Y_t.y = ((this._0_O_.y - this._Y_t.height) - 5);
        this._05y = _yO_(new Bitmap(_bH_._W_u[5]), function ():void {
            dir_ = _lJ_.LEFT;
        });
        this._05y.x = ((this._0_O_.x - this._05y.width) - 5);
        this._05y.y = ((h_ - this._05y.height) - 5);
        this._E_5 = _yO_(new Bitmap(_bH_._W_u[6]), function ():void {
            useTex1_ = true;
        });
        this._E_5.x = 5;
        this._E_5.y = ((h_ - this._E_5.height) - 5);
        this._Y_H_ = _yO_(new Bitmap(_bH_._W_u[7]), function ():void {
            useTex1_ = false;
        });
        this._Y_H_.x = ((this._E_5.x + this._E_5.width) + 5);
        this._Y_H_.y = ((h_ - this._Y_H_.height) - 5);
    }
    private var useTex1_:Boolean = true;
    private var _I_E_:int = 0;
    private var dir_:int = 0;
    private var _04W_:Sprite;
    private var _D_P_:Sprite;
    private var _Y_t:Sprite;
    private var _04U_:Sprite;
    private var _0_O_:Sprite;
    private var _05y:Sprite;
    private var _E_5:Sprite;
    private var _Y_H_:Sprite;

    override public function redraw():void {
        super.redraw();
        this._04W_.filters = (((this._I_E_) == (_sL_.length - 1)) ? [new ColorMatrixFilter(_R_2)] : []);
        this._D_P_.filters = (((this._I_E_) == 0) ? [new ColorMatrixFilter(_R_2)] : []);
        this._04U_.filters = (((this.dir_) == _lJ_.RIGHT) ? [new ColorMatrixFilter(_R_2)] : []);
        this._0_O_.filters = (((this.dir_) == _lJ_.DOWN) ? [new ColorMatrixFilter(_R_2)] : []);
        this._Y_t.filters = (((this.dir_) == _lJ_.UP) ? [new ColorMatrixFilter(_R_2)] : []);
        this._05y.filters = (((this.dir_) == _lJ_.LEFT) ? [new ColorMatrixFilter(_R_2)] : []);
        this._E_5.filters = ((this.useTex1_) ? [new ColorMatrixFilter(_R_2)] : []);
        this._Y_H_.filters = ((this.useTex1_) ? [] : [new ColorMatrixFilter(_R_2)]);
        var _local1:_lJ_ = _0B_c._J_v("players", _sL_[this._I_E_]);
        var _local2:_J_H_ = _local1.imageFromDir(this.dir_, _lJ_._sS_, 0);
        TextureRedrawer._rn = _lT_;
        var _local3:int = (((_lT_) != null) ? 0xFFFFFFFF : 0);
        var _local4:BitmapData = TextureRedrawer.resize(_local2.image_, _local2.mask_, size_, true, ((this.useTex1_) ? _local3 : 0), ((this.useTex1_) ? 0 : _local3));
        _local4 = TextureRedrawer.outlineGlow(_local4, 0, 0);
        bitmap_.bitmapData = _local4;
    }

    private function _A_c():void {
        if (this._I_E_ == (_sL_.length - 1)) {
            return;
        }
        this._I_E_++;
    }

    private function _02_():void {
        if (this._I_E_ == 0) {
            return;
        }
        this._I_E_--;
    }

}
}//package _df

