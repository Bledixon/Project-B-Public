// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.tutorial.Tutorial

package com.company.assembleegameclient.tutorial {
import flash.display.Sprite;

import com.company.assembleegameclient.game.GameSprite;

import flash.display.Shape;
import flash.display.Graphics;

import zerorealms.rotmg.assets.DataEmbeds;
import com.company.assembleegameclient.parameters.Parameters;

import flash.events.Event;

import com.company.assembleegameclient.objects.Player;
import com.company.assembleegameclient.objects.GameObject;

import flash.utils.getTimer;
import flash.filters.BlurFilter;

import com.company.util.PointUtil;


public class Tutorial extends Sprite {

    public static const _K_O_:String = "Next";
    public static const _04m:String = "MoveForward";
    public static const _03b:String = "MoveBackward";
    public static const _0B_d:String = "RotateLeft";
    public static const _95:String = "RotateRight";
    public static const _S_B_:String = "MoveLeft";
    public static const _0A_j:String = "MoveRight";
    public static const _xX_:String = "Update";
    public static const _9Z_:String = "Attack";
    public static const _5M_:String = "Damage";
    public static const _05O_:String = "Kill";
    public static const _07B_:String = "ShowLoot";
    public static const _X_I_:String = "Text";
    public static const _r8:String = "ShowPortal";
    public static const _Y_5:String = "EnterPortal";
    public static const _67:String = "Near";
    public static const _B_H_:String = "Equip";

    public function Tutorial(_arg1:GameSprite) {
        var _local2:XML;
        var _local3:Graphics;
        this._J_y = new Vector.<Step>();
        this._T_y = new Sprite();
        this._B_o = new Shape();
        this._break = new Shape();
        super();
        this.gs_ = _arg1;
        for each (_local2 in DataEmbeds._3H_.Step) {
            this._J_y.push(new Step(_local2));
        }
        addChild(this._B_o);
        addChild(this._break);
        _local3 = this._T_y.graphics;
        _local3.clear();
        _local3.beginFill(0, 0.1);
        _local3.drawRect(0, 0, 800, 600);
        _local3.endFill();
        Parameters.data_.needsTutorial = false;
        Parameters.save();
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }
    public var gs_:GameSprite;
    public var _J_y:Vector.<Step>;
    public var _vW_:int = 0;
    private var _T_y:Sprite;
    private var _B_o:Shape;
    private var _break:Shape;
    private var _gH_:_iI_ = null;

    internal function doneAction(_arg1:String):void {
        var _local3:Requirement;
        var _local4:Player;
        var _local5:Boolean;
        var _local6:GameObject;
        var _local7:Number;
        if (this._vW_ >= this._J_y.length) {
            return;
        }
        var _local2:Step = this._J_y[this._vW_];
        if (_arg1 != _local2.action_) {
            return;
        }
        for each (_local3 in _local2._I_2) {
            _local4 = this.gs_.map_.player_;
            switch (_local3.type_) {
                case _67:
                    _local5 = false;
                    for each (_local6 in this.gs_.map_.goDict_) {
                        if (_local6.objectType_ == _local3.objectType_) {
                            _local7 = PointUtil._R_O_(_local6.x_, _local6.y_, _local4.x_, _local4.y_);
                            if (_local7 <= _local3.radius_) {
                                _local5 = true;
                                break;
                            }
                        }
                    }
                    if (!_local5) {
                        return;
                    }
                    break;
                case _B_H_:
                    if (_local4.equipment_[_local3._01U_] != _local3.objectType_) {
                        return;
                    }
                    break;
            }
        }
        this._vW_++;
        this.draw();
    }

    private function draw():void {
        var _local3:UIDrawBox;

    }

    private function onAddedToStage(_arg1:Event):void {
        addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        this.draw();
    }

    private function onRemovedFromStage(_arg1:Event):void {
        removeEventListener(Event.ENTER_FRAME, this.onEnterFrame);
    }

    private function onEnterFrame(_arg1:Event):void {
        var _local4:Step;
        var _local5:Boolean;
        var _local6:Requirement;
        var _local7:int;
        var _local8:UIDrawBox;
        var _local9:UIDrawArrow;
        var _local10:Player;
        var _local11:Boolean;
        var _local12:GameObject;
        var _local13:Number;
        var _local2:Number = Math.abs(Math.sin((getTimer() / 300)));
        this._B_o.filters = [new BlurFilter((5 + (_local2 * 5)), (5 + (_local2 * 5)))];
        this._break.graphics.clear();
        this._B_o.graphics.clear();
        var _local3:int;
        while (_local3 < this._J_y.length) {
            _local4 = this._J_y[_local3];
            _local5 = true;
            for each (_local6 in _local4._I_2) {
                _local10 = this.gs_.map_.player_;
                switch (_local6.type_) {
                    case _67:
                        _local11 = false;
                        for each (_local12 in this.gs_.map_.goDict_) {
                            if (!((!((_local12.objectType_ == _local6.objectType_))) || (((!((_local6._O_w == ""))) && (!((_local12.name_ == _local6._O_w))))))) {
                                _local13 = PointUtil._R_O_(_local12.x_, _local12.y_, _local10.x_, _local10.y_);
                                if (_local13 <= _local6.radius_) {
                                    _local11 = true;
                                    break;
                                }
                            }
                        }
                        if (!_local11) {
                            _local5 = false;
                        }
                        break;
                }
            }
            if (!_local5) {
                _local4._n = 0;
            } else {
                if (_local4._n == 0) {
                    _local4._n = getTimer();
                }
                _local7 = (getTimer() - _local4._n);
                for each (_local8 in _local4._0J_b) {
                    _local8.draw((5 * _local2), this._break.graphics, _local7);
                    _local8.draw((6 * _local2), this._B_o.graphics, _local7);
                }
                for each (_local9 in _local4._06F_) {
                    _local9.draw((5 * _local2), this._break.graphics, _local7);
                    _local9.draw((6 * _local2), this._B_o.graphics, _local7);
                }
            }
            _local3++;
        }
    }

}
}//package com.company.assembleegameclient.tutorial

