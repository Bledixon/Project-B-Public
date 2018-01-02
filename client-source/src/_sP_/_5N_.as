// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_sP_._5N_

package _sP_ {
import flash.display.Sprite;
import flash.geom.ColorTransform;

import com.company.ui.SimpleText;

import flash.display.Bitmap;
import flash.filters.DropShadowFilter;

import com.company.assembleegameclient.util._07E_;

import flash.events.MouseEvent;

import com.company.rotmg.graphics.DeleteXGraphic;

import flash.display.Graphics;

import com.company.util.MoreColorUtil;

import _0L_C_._qO_;

import _sP_._k6;

import flash.events.Event;

internal class _5N_ extends Sprite {

    public static const WIDTH:int = 756;
    public static const HEIGHT:int = 32;
    protected static const _0A_8:ColorTransform = new ColorTransform(1, (220 / 0xFF), (133 / 0xFF));

    public function _5N_(_arg1:int, _arg2:String, _arg3:int, _arg4:int, _arg5:Boolean, _arg6:int) {
        var _local7:uint;
        super();
        this.name_ = _arg2;
        this._S_e = _arg3;
        _local7 = 0xB3B3B3;
        if (_arg5) {
            _local7 = 16564761;
        }
        this._30 = new SimpleText(22, _local7, false, 0, 0, "Myriad Pro");
        this._30.setBold(true);
        this._30.text = (_arg1.toString() + ".");
        this._30._08S_();
        this._30.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
        this._30.x = (60 - this._30.width);
        this._30.y = ((HEIGHT / 2) - (this._30.height / 2));
        addChild(this._30);
        this.nameText_ = new SimpleText(22, _local7, false, 0, 0, "Myriad Pro");
        this.nameText_.setBold(true);
        this.nameText_.text = _arg2;
        this.nameText_._08S_();
        this.nameText_.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
        this.nameText_.x = 100;
        this.nameText_.y = ((HEIGHT / 2) - (this.nameText_.height / 2));
        addChild(this.nameText_);
        this._Q_R_ = new SimpleText(22, _local7, false, 0, 0, "Myriad Pro");
        this._Q_R_.text = _arg4.toString();
        this._Q_R_._08S_();
        this._Q_R_.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
        this._Q_R_.x = (408 - this._Q_R_.width);
        this._Q_R_.y = ((HEIGHT / 2) - (this._Q_R_.height / 2));
        addChild(this._Q_R_);
        this._0F_Z_ = new Bitmap(_07E_._oO_(40));
        this._0F_Z_.x = 400;
        this._0F_Z_.y = ((HEIGHT / 2) - (this._0F_Z_.height / 2));
        addChild(this._0F_Z_);
        this._L_P_ = new Bitmap(_07E_._wS_(_arg3, 10));
        this._L_P_.x = 548;
        this._L_P_.y = ((HEIGHT / 2) - (this._L_P_.height / 2));
        addChild(this._L_P_);
        this._pg = new SimpleText(22, _local7, false, 0, 0, "Myriad Pro");
        this._pg.text = _07E_._0C_n(_arg3);
        this._pg._08S_();
        this._pg.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
        this._pg.x = 580;
        this._pg.y = ((HEIGHT / 2) - (this._pg.height / 2));
        addChild(this._pg);
        if (_07E_._0D_e(_arg6, _arg3)) {
            this._pv = this._85(true);
            this._W_a(this._pv);
            this._pv.addEventListener(MouseEvent.CLICK, this._0H_3);
            this._pv.x = (670 + 6);
            this._pv.y = (HEIGHT / 2);
            addChild(this._pv);
        }
        if (_07E_._z0(_arg6, _arg3)) {
            this._06V_ = this._85(false);
            this._W_a(this._06V_);
            this._06V_.addEventListener(MouseEvent.CLICK, this._P_w);
            this._06V_.x = (700 + 6);
            this._06V_.y = (HEIGHT / 2);
            addChild(this._06V_);
        }
        if (_07E_._dn(_arg6, _arg3)) {
            this._2y = new DeleteXGraphic();
            this._W_a(this._2y);
            this._2y.addEventListener(MouseEvent.CLICK, this._Q_2);
            this._2y.x = 730;
            this._2y.y = ((HEIGHT / 2) - (this._2y.height / 2));
            addChild(this._2y);
        }
    }
    private var name_:String;
    private var _S_e:int;
    private var _30:SimpleText;
    private var nameText_:SimpleText;
    private var _Q_R_:SimpleText;
    private var _0F_Z_:Bitmap;
    private var _L_P_:Bitmap;
    private var _pg:SimpleText;
    private var _pv:Sprite;
    private var _06V_:Sprite;
    private var _2y:Sprite;

    private function _85(_arg1:Boolean):Sprite {
        var _local2:Sprite = new Sprite();
        var _local3:Graphics = _local2.graphics;
        _local3.beginFill(0xFFFFFF);
        _local3.moveTo(-8, -6);
        _local3.lineTo(8, -6);
        _local3.lineTo(0, 6);
        _local3.lineTo(-8, -6);
        if (_arg1) {
            _local2.rotation = 180;
        }
        return (_local2);
    }

    private function _W_a(_arg1:Sprite):void {
        _arg1.addEventListener(MouseEvent.MOUSE_OVER, this._A_4);
        _arg1.addEventListener(MouseEvent.ROLL_OUT, this._26);
    }

    private function _A_4(_arg1:MouseEvent):void {
        var _local2:Sprite = (_arg1.currentTarget as Sprite);
        _local2.transform.colorTransform = _0A_8;
    }

    private function _26(_arg1:MouseEvent):void {
        var _local2:Sprite = (_arg1.currentTarget as Sprite);
        _local2.transform.colorTransform = MoreColorUtil.identity;
    }

    private function _0H_3(_arg1:MouseEvent):void {
        var _local2:_qO_ = new _qO_((((("Are you sure you want to promote " + this.name_) + " to ") + _07E_._0C_n(_07E_._0H_q(this._S_e))) + "?"), ("Promote " + this.name_), "Cancel", "Promote", "/promote");
        _local2.addEventListener(_qO_.BUTTON1_EVENT, this._0C_f);
        _local2.addEventListener(_qO_.BUTTON2_EVENT, this._ep);
        stage.addChild(_local2);
    }

    private function _ep(_arg1:Event):void {
        var _local2:_qO_ = (_arg1.currentTarget as _qO_);
        stage.removeChild(_local2);
        dispatchEvent(new _k6(_k6.SET_RANK, this.name_, _07E_._0H_q(this._S_e)));
    }

    private function _P_w(_arg1:MouseEvent):void {
        var _local2:_qO_ = new _qO_((((("Are you sure you want to demote " + this.name_) + " to ") + _07E_._0C_n(_07E_._4J_(this._S_e))) + "?"), ("Demote " + this.name_), "Cancel", "Demote", "/demote");
        _local2.addEventListener(_qO_.BUTTON1_EVENT, this._0C_f);
        _local2.addEventListener(_qO_.BUTTON2_EVENT, this._gy);
        stage.addChild(_local2);
    }

    private function _gy(_arg1:Event):void {
        var _local2:_qO_ = (_arg1.currentTarget as _qO_);
        stage.removeChild(_local2);
        dispatchEvent(new _k6(_k6.SET_RANK, this.name_, _07E_._4J_(this._S_e)));
    }

    private function _Q_2(_arg1:MouseEvent):void {
        var _local2:_qO_ = new _qO_((("Are you sure you want to remove " + this.name_) + " from the guild?"), ("Remove " + this.name_), "Cancel", "Remove", "/removeFromGuild");
        _local2.addEventListener(_qO_.BUTTON1_EVENT, this._0C_f);
        _local2.addEventListener(_qO_.BUTTON2_EVENT, this._uy);
        stage.addChild(_local2);
    }

    private function _uy(_arg1:Event):void {
        var _local2:_qO_ = (_arg1.currentTarget as _qO_);
        stage.removeChild(_local2);
        dispatchEvent(new _k6(_k6.REMOVE_MEMBER, this.name_));
    }

    private function _0C_f(_arg1:Event):void {
        var _local2:_qO_ = (_arg1.currentTarget as _qO_);
        stage.removeChild(_local2);
    }

}
}//package _sP_

