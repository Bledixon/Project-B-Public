// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.ui._E_6

package com.company.assembleegameclient.ui {
import com.company.assembleegameclient.net.PacketManager;
import com.company.assembleegameclient.objects.ObjectLibrary;
import com.company.assembleegameclient.objects.Player;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.util.GraphicHelper;

import flash.display.GraphicsSolidFill;
import flash.display.IGraphicsData;
import flash.display.Shape;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.TimerEvent;
import flash.filters.ColorMatrixFilter;
import flash.geom.Point;
import flash.utils.Timer;
import flash.utils.getTimer;

import _E_7.EquipmentToolTip;
import _E_7._aS_;
import _E_7._for_;


import _ke._U_c;

import _vf._5T_;

public class _E_6 extends Slot {

    private static const _0J_o:uint = 250;
    private static const _so:int = -1;
    private static const _L_9:String = "Soulbound Loot Bag";
    private static const _0L_p:String = "Loot Bag";
    private static const _z2:String = "Vault Chest";
    private static const _83:String = "Inventory";
   // private static const BACKPACK_INVETORY:String = "Backpack";
    private static const _01M_:String = "Treasure Chest";
    protected static const _P_r:Array = [new ColorMatrixFilter([0.4, 0, 0, 0, 0, 0, 0.4, 0, 0, 0, 0, 0, 0.4, 0, 0, 0, 0, 0, 1, 0])];

    public static var toolTip_:_for_;

    public function _E_6(_arg1:Inventory, _arg2:int, _arg3:int, _arg4:int, _arg5:Array, _equipment:Boolean = false) {
        super(_arg3, _arg4, _arg5, _equipment);
        this._e9 = _arg1;
        this.id_ = _arg2;
        type_ = _arg3;
        this._D_s = new Shape();
        var _local6:GraphicsSolidFill = new GraphicsSolidFill(9385987, 1);
        GraphicHelper._0L_6(path_);
        var _local7:Vector.<IGraphicsData> = new <IGraphicsData>[_local6, path_, GraphicHelper.END_FILL];
        GraphicHelper.drawUI(0, 0, WIDTH, HEIGHT, 4, _07i, path_);
        this._D_s.graphics.drawGraphicsData(_local7);
        this._D_s.alpha = 0;
        addChild(this._D_s);
        this._lD_ = new Timer(_0J_o, 1);
        this._lD_.addEventListener(TimerEvent.TIMER_COMPLETE, this._W_);
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }
    public var _e9:Inventory;
    public var id_:int;
    public var _cX_:Boolean = false;
    public var _F_t:Boolean = false;
    public var _K_9:int;
    public var objectType_:int = -1;
    public var _X_B_:ui_items = null;
    public var _04q:Boolean = false;
    public var itemData_:Object = null;
    private var _D_s:Shape;
    private var _lD_:Timer;
    private var _O_W_:uint = 0;
    private var _Y_K_:String;
    private var _062:Point;

    public function _t8(_arg1:int):Boolean {
        if (type_ == any_) {
            return (true);
        }
        var _local2:int = ObjectLibrary._gf(_arg1);
        return ((type_ == _local2));
    }

    public function _C_p():Boolean {
        var _local1:Player = (this._e9._iA_ as Player);
        return (((!((_local1 == null))) && ((_local1.MP_ < this._K_9))));
    }

    public function draw(_arg1:int):void {
        if(this._e9 != null && this._e9._iA_ != null) {
            if (this.itemData_ != this._e9._iA_.equipData_[this.id_]) {
                this.itemData_ = this._e9._iA_ != null ? this._e9._iA_.equipData_[this.id_] : null;
            }
        }
        if ((this.objectType_ == _arg1) && (!(this._cX_) || (this._F_t == this._C_p()))) {
            return;
        }
        this.objectType_ = _arg1;
        this._04q = false;
        this._X_6();
        this._0E_J_();
    }

    public function refresh():void {
        this._0E_J_();
    }

    public function _0E_J_():void {
        this._X_6();
        var _local1:XML = ObjectLibrary._Q_F_[this.objectType_];
        if ((((this.objectType_ == -1)) || ((type_ == any_)))) {
            this._cX_ = false;
        } else {
            if (((!((_local1 == null))) && (_local1.hasOwnProperty("Usable")))) {
                this._cX_ = true;
                this._K_9 = int(_local1.MpCost);
            } else {
                this._cX_ = false;
            }
        }
        if (this._X_B_ != null) {
            this._X_B_.parent.removeChild(this._X_B_);
            if (((!((_0H_K_ == null))) && (!(contains(_0H_K_))))) {
                addChild(_0H_K_);
            }
            this._X_B_ = null;
        }
        if ((((this.objectType_ < 0)) || ((_local1 == null)))) {
            return;
        }
        var _local2:int = ObjectLibrary._gf(this.objectType_);
        var _local3:Point = _H_K_(this.objectType_, _local2, false);
        this._X_B_ = new ui_items(this.objectType_, this, this.itemData_);
        this._X_B_.x = ((WIDTH / 2) + _local3.x);
        this._X_B_.y = ((HEIGHT / 2) + _local3.y);
        if (this._cX_) {
            this._F_t = this._C_p();
            if (this._F_t) {
                this._X_B_.filters = _P_r;
            }
        }
        addChild(this._X_B_);
        if (((!((_0H_K_ == null))) && (contains(_0H_K_)))) {
            removeChild(_0H_K_);
        }
        this._X_6();
    }

    public function attemptUse():void {
        var tmp:InvTabs
        var _local1:XML = ObjectLibrary._Q_F_[this.objectType_];
        if (_local1 == null) {
            return;
        }
        var _local2:Player = this._e9.gs_.map_.player_;
        if ((((_local2 == null)) || (_local2.isPaused()))) {
            return;
        };
        trace(_local1.@id);
        var _local3:Boolean = _local1.hasOwnProperty("Consumable");
        var _local4:Boolean = _local1.hasOwnProperty("InvUse");
        if (((!(_local3)) && (!(_local4)))) {
            return;
        }
        if (_local3 && (itemData_ != null ? !itemData_.MultiUse : true)) {
            if (this._04q) {
                return;
            }
            this._04q = true;
        }
        this._e9.gs_.gsc_.useItem(getTimer(), this._e9._iA_.objectId_, this.id_, this.objectType_, 0, 0);
        _5T_.play("use_potion");
        this._X_6();
    }

    private function _X_6():void {
        if (this._e9.gs_ == null) {
            return;
        }
        var _local1:Player = this._e9.gs_.map_.player_;
        var _local2:Boolean = ObjectLibrary._d1(this.objectType_, _local1) && ObjectLibrary.checkLevelRequirement(this.objectType_, _local1);
        if (((((((!((this.objectType_ == -1))) && ((_local2 == false)))) && (!((this._X_B_ == null))))) && ((this._X_B_._e == false)))) {
            this._D_s.alpha = 1;
        } else {
            this._D_s.alpha = 0;
        }
        //this.itemData_ = this._e9._iA_ != null ? this._e9._iA_.equipData_[this.id_] : null;
    }

    private function _5I_():String {
        if (type_ == any_) {
            return (this._e9._A_H_);
        }
        return (_mb(type_));
    }

    private function _c1():void {
        if (this._e9.gs_) {
            if ((this._e9._iA_ is Player)) {
                if (this._e9._iA_ == this._e9.gs_.map_.player_) {
                    this._Y_K_ = _U_c.CURRENT_PLAYER;
                } else {
                    this._Y_K_ = _U_c.OTHER_PLAYER;
                }
            } else {
                this._Y_K_ = _U_c.NPC;
            }
        }
    }

    private function _9():void {
        if (toolTip_ != null) {
            if (toolTip_.parent != null) {
                toolTip_.parent.removeChild(toolTip_);
            }
            toolTip_ = null;
        }
    }

    private function _i9():void {
        toolTip_ = new _aS_(0x2A2A2A, 0x9B9B9B, null, (("Empty " + this._5I_()) + " slot"), 200);
    }

    private function _H_T_():void {
        var _local1:Boolean = this._e9._mK_();
        if (ObjectLibrary._6H_(this.objectType_) != null)
            toolTip_ = new EquipmentToolTip(this.objectType_, (((this._e9.gs_) != null) ? this._e9.gs_.map_.player_ : null), (((this._e9._iA_) != null) ? this._e9._iA_.objectType_ : -1), this._Y_K_, this._X_B_._03f.id_, _local1, this.itemData_);
        else
            this._i9();
    }

    private function _6i():void {
        if (this.objectType_ == -1) {
            this._i9();
        } else {
            this._H_T_();
        }
        stage.addChild(toolTip_);
    }

    private function _V_V_():void {
        if (stage) {
            stage.removeEventListener(MouseEvent.MOUSE_UP, this._0_5);
            stage.removeEventListener(MouseEvent.MOUSE_MOVE, this._dj);
        }
    }

    private function _Y_y():void {
        if (this._e9._A_H_ == _83) { // || this._e9._A_H_ == BACKPACK_INVETORY
            this._V_q();
        } else {
            this._00W_();
        }
    }

    private function _00W_():void {
        var _local1:Player;
        var _local2:Boolean;
        var _local3:XML;
        var _local4:int;
        var _local5:uint;
        var _local6:Inventory;
        var _local7:_E_6;
        if (this._I_N_()) {
            _local1 = this._v5();
            _local2 = ObjectLibrary._01j(this.objectType_, _local1);
            _local3 = ObjectLibrary._Q_F_[this.objectType_];
            _local4 = _local3.SlotType;
            if (_local2) {
                _local5 = 0;
                while (_local5 < 4) {
                    if (_local1._9A_[_local5] == _local4) {
                        _local6 = this._A_P_();
                        _local7 = _local6.slots_[_local5];
                        this._0A_v(_local7);
                        return;
                    }
                    _local5++;
                }
                return;
            }
            this.attemptUse();
        } else {
            if (this._W_4()) {
                this._bL_();
            }
        }
    }

    private function _V_q():void {
        var _local5:uint;
        var _local6:Inventory;
        var _local7:_E_6;
        var _local1:Player = this._v5();
        var _local2:Boolean = ObjectLibrary._01j(this.objectType_, _local1);
        var _local8:Boolean = ObjectLibrary.checkLevelRequirement(this.objectType_, _local1);
        var _local3:XML = ObjectLibrary._Q_F_[this.objectType_];
        var _local4:int = _local3.SlotType;
        if (_local2 && _local8) {
            _local5 = 0;
            while (_local5 < 4) {
                if (_local1._9A_[_local5] == _local4) {
                    _local6 = this._A_P_();
                    _local7 = _local6.slots_[_local5];
                    this._0A_v(_local7);
                    return;
                }
                _local5++;
            }
            return;
        }
        this.attemptUse();
    }

    private function _I_N_():Boolean {
        var _local3:_E_6;
        var _local1:Inventory = this._A_P_();
        var _local2:uint = 4;
        while (_local2 < _local1.slots_.length) {
            _local3 = _local1.slots_[_local2];
            if (_local3.objectType_ == -1) {
                return (false);
            }
            _local2++;
        }
        return (true);
    }

    private function _W_4():Boolean {
        return ((((((((this._e9._A_H_ == _0L_p)) || ((this._e9._A_H_ == _z2)))) || ((this._e9._A_H_ == _L_9)))) || ((this._e9._A_H_ == _01M_))));
    }

    private function _4k():void {
        var _local1:Point;
        var _local2:Point;
        if (((!((this._X_B_ == null))) && (contains(this._X_B_)))) {
            if (((!((_0H_K_ == null))) && (!(contains(_0H_K_))))) {
                addChild(_0H_K_);
            }
            removeChild(this._X_B_);
            _local1 = new Point(this._X_B_.x, this._X_B_.y);
            _local2 = localToGlobal(_local1);
            this._X_B_.startDrag(true);
            this._X_B_._e = true;
            stage.addChild(this._X_B_);
            this._X_B_.x = _local2.x;
            this._X_B_.y = _local2.y;
        }
        this._X_6();
    }

    private function _bL_():void {
        var _local2:_E_6;
        var _local1:Inventory = this._A_P_();
        for each (_local2 in _local1.slots_) {
            if ((((_local2.objectType_ == _so)) && ((_local2.id_ > 3)))) {
                this._0A_v(_local2);
                break;
            }
        }
    }

    private function _0A_v(_arg1:_E_6):void {
        var _local2:int = _arg1._e9.gs_.lastUpdate_;
        var _local3:PacketManager = this._gw();
        var _local4:Player = this._v5();
        //_local3.invSwap(_local2, _local4.x_, _local4.y_, this._e9._iA_.objectId_, this.id_, this.objectType_, _arg1._e9._iA_.objectId_, _arg1.id_, _arg1.objectType_);
        _local3.invSwap(_local4, this._e9._iA_, this.id_, this.objectType_, _arg1._e9._iA_, _arg1.id_, _arg1.objectType_);
        //_5T_.play("inventory_move_item");
        this._X_6();
    }

    private function _gw():PacketManager {
        return (this._e9.gs_.gsc_);
    }

    private function _v5():Player {
        return (this._e9.gs_.map_.player_);
    }

    private function _A_P_():Inventory {
        return (this._e9.gs_._V_1._02y._e9);
    }

    private function equipInv():Inventory {
        return (this._e9.gs_._V_1._02y.equips_);
    }

    private function onAddedToStage(_arg1:Event):void {
        addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
        addEventListener(MouseEvent.MOUSE_OUT, this.onMouseOut);
        if (this._e9.gs_ != null) {
            addEventListener(MouseEvent.MOUSE_DOWN, this.onMouseDown);
        }
        this._X_6();
    }

    private function onRemovedFromStage(_arg1:Event):void {
        if (this._X_B_ != null) {
            this._X_B_.parent.removeChild(this._X_B_);
            this._X_B_ = null;
            this.objectType_ = -1;
        }
        if (toolTip_ != null) {
            if (toolTip_.parent != null) {
                toolTip_.parent.removeChild(toolTip_);
            }
            toolTip_ = null;
        }
        removeEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
        removeEventListener(MouseEvent.MOUSE_OUT, this.onMouseOut);
        if (this._e9.gs_ != null) {
            removeEventListener(MouseEvent.MOUSE_DOWN, this.onMouseDown);
            this._V_V_();
        }
    }

    private function onMouseOver(_arg1:MouseEvent):void {
        this._c1();
        this._9();
        this._6i();
    }

    private function onMouseDown(_arg1:MouseEvent):void {
        if (toolTip_ != null) {
            if (toolTip_.parent != null) {
                toolTip_.parent.removeChild(toolTip_);
            }
            toolTip_ = null;
        }
        if (_arg1.shiftKey) {
            this.attemptUse();
            return;
        }
        this._062 = new Point(_arg1.stageX, _arg1.stageY);
        stage.addEventListener(MouseEvent.MOUSE_MOVE, this._dj, false, 0, true);
        stage.addEventListener(MouseEvent.MOUSE_UP, this._0_5);
        if (this._lD_.running == false) {
            this._O_W_ = 0;
            this._lD_.reset();
            this._lD_.start();
        } else {
            this._O_W_++;
        }
    }

    private function _dj(_arg1:MouseEvent):void {
        var _local2:Number = (_arg1.stageX - this._062.x);
        var _local3:Number = (_arg1.stageY - this._062.y);
        var _local4:Number = Math.sqrt(((_local2 * _local2) + (_local3 * _local3)));
        if (_local4 > 3) {
            this._lD_.reset();
            this._V_V_();
            this._4k();
        }
    }

    private function _0_5(_arg1:Event):void {
        this._V_V_();
        this._062 = null;
    }

    private function _W_(_arg1:TimerEvent):void {
        if (Parameters.data_["contextualClick"] == false) {
            return;
        }
        if (this._O_W_ > 0) {
            if (this._X_B_) {
                this._Y_y();
            }
        }
    }

    private function onMouseOut(_arg1:MouseEvent):void {
        if (toolTip_ != null) {
            if (toolTip_.parent != null) {
                toolTip_.parent.removeChild(toolTip_);
            }
            toolTip_ = null;
        }
    }

}
}//package com.company.assembleegameclient.ui

