// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_F_1._U_W_

package _F_1 {
import _02t._R_f;

import _05R_.GTween;

import _S_K_._u3;

import _sp._aJ_;

import _vf._5T_;

import com.company.assembleegameclient.objects.ObjectLibrary;
import com.company.assembleegameclient.util.TextureRedrawer;
import com.company.assembleegameclient.util._0B_c;
import com.company.assembleegameclient.util._J_H_;
import com.company.assembleegameclient.util._Z_B_;
import com.company.assembleegameclient.util._lJ_;
import com.company.rotmg.graphics.FameIconBackgroundDesign;
import com.company.rotmg.graphics.ScreenGraphic;
import com.company.ui.SimpleText;
import com.company.util.BitmapUtil;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;
import flash.geom.Rectangle;

public class _U_W_ extends Sprite {

    private static const _P_O_:String = "${NAME}, Level ${LEVEL} ${TYPE}";
    private static const _R_b:String = "killed on ${DATE} by ${KILLER}";
    private static const _V_u:String = "died ${DATE}";

    public function _U_W_() {
        addChild(new _charscreen());
        addChild((this._9N_ = new Sprite()));
        addChild((this._0M_g = new Sprite()));
        this._0I_B_ = new _H_o("continue", 36, false);
        this._0M_S_ = new _u3(this._0I_B_, MouseEvent.CLICK);
    }
    public var _0M_S_:_aJ_;
    private var _9N_:DisplayObjectContainer;
    private var _0M_g:DisplayObjectContainer;
    private var title:SimpleText;
    private var date:SimpleText;
    private var _mZ_:_no;
    private var _0L_r:_2Z_;
    private var _0I_B_:_H_o;
    private var _S_c:Boolean;
    private var _0I_w:Boolean;
    private var _qa:Boolean;

    public function _yK_(_arg1:Boolean):void {
        this._S_c = _arg1;
    }

    public function _K_f(_arg1:BitmapData):void {
        this._0M_g.addChild(new Bitmap(_arg1));
        var _local2:GTween = new GTween(this._0M_g, 2, {"alpha": 0});
        _local2.onComplete = this._gl;
        _5T_.play("death_screen");
    }

    public function _tC_(_arg1:String, _arg2:int, _arg3:int):void {
        this.title = new SimpleText(38, 0xCCCCCC, false, 0, 0, "Myriad Pro");
        this.title.setBold(true);
        this.title.filters = [new DropShadowFilter(0, 0, 0, 0.5, 12, 12)];
        this.title.text = _P_O_.replace("${NAME}", _arg1).replace("${LEVEL}", _arg2).replace("${TYPE}", ObjectLibrary._0D_N_[_arg3]);
        this.title.updateMetrics();
        stage;
        this.title.x = ((800 / 2) - (this.title.width / 2));
        this.title.y = 225;
        this._9N_.addChild(this.title);
    }

    public function _ec(_arg1:String, _arg2:String):void {
        this.date = new SimpleText(24, 0xCCCCCC, false, 0, 0, "Myriad Pro");
        this.date.setBold(true);
        this.date.filters = [new DropShadowFilter(0, 0, 0, 0.5, 12, 12)];
        this.date.text = ((_arg2) ? _R_b : _V_u).replace("${DATE}", _arg1).replace("${KILLER}", _arg2);
        this.date.updateMetrics();
        stage;
        this.date.x = ((800 / 2) - (this.date.width / 2));
        this.date.y = 272;
        this._9N_.addChild(this.date);
    }

    public function _sQ_(_arg1:XML):void {
        var _local9:Bitmap;
        var _local2:Sprite = new Sprite();
        var _local3:Sprite = new FameIconBackgroundDesign();
        _local3.filters = [new DropShadowFilter(0, 0, 0, 0.5, 12, 12)];
        _local2.addChild(_local3);
        var _local4:XML = new XML(_arg1);
        var _local5:XML = ObjectLibrary._Q_F_[int(_local4.ObjectType)];
        var _skin:int = int(_local4.hasOwnProperty("Skin") ? _local4.Skin : -1);
        var _local6:_lJ_ = _0B_c._J_v(String(_local5.AnimatedTexture.File), int(_local5.AnimatedTexture.Index));
        if (_skin == -1) {
            _local6 = _0B_c._J_v(String(_local5.AnimatedTexture.File), int(_local5.AnimatedTexture.Index));
        } else {
            var _skinx:XML = ObjectLibrary._Q_F_[_skin];
            if (_skinx == null) {
                _local6 = _0B_c._J_v(String(_local5.AnimatedTexture.File), int(_local5.AnimatedTexture.Index));
            }
            _local6 = _0B_c._J_v(String(_skinx.AnimatedTexture.File), int(_skinx.AnimatedTexture.Index));
        }
        var _local7:_J_H_ = _local6.imageFromDir(_lJ_.RIGHT, _lJ_._sS_, 0);
        var _local8:BitmapData = TextureRedrawer.resize(_local7.image_, _local7.mask_, 250, true, int(_local4.Tex1), int(_local4.Tex2));
        _local8 = TextureRedrawer.outlineGlow(_local8, 0, 0);
        _local9 = new Bitmap(_local8);
        _local9.x = ((_local2.width / 2) - (_local9.width / 2));
        _local9.y = ((_local2.height / 2) - (_local9.height / 2));
        _local2.addChild(_local9);
        _local2.y = 20;
        stage;
        _local2.x = ((800 / 2) - (_local2.width / 2));
        this._9N_.addChild(_local2);
    }

    public function _0__(_arg1:int, _arg2:XML):void {
        this._mZ_ = new _no(new Rectangle(0, 0, 784, 150), _arg2);
        this._mZ_.x = 8;
        this._mZ_.y = 316;
        addChild(this._mZ_);
        this._9N_.addChild(this._mZ_);
        var _local3:BitmapData = _Z_B_._qf();
        _local3 = BitmapUtil._Y_d(_local3, 6, 6, (_local3.width - 12), (_local3.height - 12));
        this._0L_r = new _2Z_(24, 0xCCCCCC, 0xFFC800, "Total Fame Earned", null, _arg1, "", "", new Bitmap(_local3));
        this._0L_r.x = 10;
        this._0L_r.y = 470;
        this._9N_.addChild(this._0L_r);
        this._qa = true;
        if (((this._S_c) || (this._0I_w))) {
            this._0M_5();
        }
    }

    private function _gl(_arg1:GTween):void {
        removeChild(this._0M_g);
        this._0I_w = true;
        if (this._qa) {
            this._0M_5();
        }
    }

    private function _0M_5():void {
        //this._9N_.addChild(new ScreenGraphic());
        stage;
        this._0I_B_.x = ((800 / 2) - (this._0I_B_.width / 2));
        this._0I_B_.y = 524;
        this._9N_.addChild(this._0I_B_);
        if (this._S_c) {
            this._mZ_._3s();
        } else {
            this._mZ_._D_G_();
        }
    }

}
}//package _F_1

