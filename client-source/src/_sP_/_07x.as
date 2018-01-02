// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_sP_._07x

package _sP_ {
import flash.display.Sprite;

import com.company.assembleegameclient.game.GameSprite;

import _F_1._H_o;

import com.company.rotmg.graphics.ScreenGraphic;

import flash.events.MouseEvent;
import flash.events.Event;

import com.company.assembleegameclient.objects.Player;

import _9R_._J_F_;

import _0L_C_._qO_;

import flash.events.KeyboardEvent;

public class _07x extends Sprite {

    public function _07x(_arg1:GameSprite) {
        this.gs_ = _arg1;
        graphics.clear();
        graphics.beginFill(0x2B2B2B, 0.8);
        graphics.drawRect(0, 0, 800, 600);
        graphics.endFill();
        this._wk();
        //addChild(new ScreenGraphic());
        this._0Q_ = new _H_o("continue", 36, false);
        this._0Q_.addEventListener(MouseEvent.CLICK, this._0B_Z_);
        addChild(this._0Q_);
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }
    private var gs_:GameSprite;
    private var _P_t:_if;
    private var _0Q_:_H_o;

    private function _wk():void {
        var _local1:Player = this.gs_.map_.player_;
        this._P_t = new _if(50, 0, (((_local1 == null)) ? "" : _local1.name_), _local1.guildRank_);
        this._P_t.addEventListener(_k6.SET_RANK, this._R_Y_);
        this._P_t.addEventListener(_k6.REMOVE_MEMBER, this._B_P_);
        addChild(this._P_t);
    }

    private function _03C_():void {
        this._P_t.removeEventListener(_k6.SET_RANK, this._R_Y_);
        this._P_t.removeEventListener(_k6.REMOVE_MEMBER, this._B_P_);
        removeChild(this._P_t);
    }

    private function _L_I_(_arg1:String):void {
        var _local2:_qO_ = new _qO_(_arg1, "Error", "Ok", null, "/guildError");
        _local2.addEventListener(_qO_.BUTTON1_EVENT, this._K__);
        stage.addChild(_local2);
    }

    private function close():void {
        stage.focus = null;
        parent.removeChild(this);
    }

    private function _R_Y_(_arg1:_k6):void {
        this._03C_();
        this.gs_.addEventListener(_J_F_._hx, this._C_L_);
        this.gs_.gsc_._k8(_arg1.name_, _arg1._S_e);
    }

    private function _C_L_(_arg1:_J_F_):void {
        this.gs_.removeEventListener(_J_F_._hx, this._C_L_);
        if (!_arg1.success_) {
            this._L_I_(_arg1.errorText_);
        } else {
            this._wk();
        }
    }

    private function _B_P_(_arg1:_k6):void {
        this._03C_();
        this.gs_.addEventListener(_J_F_._hx, this._X_s);
        this.gs_.gsc_.guildRemove(_arg1.name_);
    }

    private function _X_s(_arg1:_J_F_):void {
        this.gs_.removeEventListener(_J_F_._hx, this._X_s);
        if (!_arg1.success_) {
            this._L_I_(_arg1.errorText_);
        } else {
            this._wk();
        }
    }

    private function _K__(_arg1:Event):void {
        var _local2:_qO_ = (_arg1.currentTarget as _qO_);
        stage.removeChild(_local2);
        this._wk();
    }

    private function _0B_Z_(_arg1:MouseEvent):void {
        this.close();
    }

    private function onAddedToStage(_arg1:Event):void {
        stage;
        this._0Q_.x = ((800 / 2) - (this._0Q_.width / 2));
        this._0Q_.y = 545;
        stage.addEventListener(KeyboardEvent.KEY_DOWN, this._0A_Y_, false, 1);
        stage.addEventListener(KeyboardEvent.KEY_UP, this._H_H_, false, 1);
    }

    private function onRemovedFromStage(_arg1:Event):void {
        stage.removeEventListener(KeyboardEvent.KEY_DOWN, this._0A_Y_, false);
        stage.removeEventListener(KeyboardEvent.KEY_UP, this._H_H_, false);
    }

    private function _0A_Y_(_arg1:KeyboardEvent):void {
        _arg1.stopImmediatePropagation();
    }

    private function _H_H_(_arg1:KeyboardEvent):void {
        _arg1.stopImmediatePropagation();
    }

}
}//package _sP_

