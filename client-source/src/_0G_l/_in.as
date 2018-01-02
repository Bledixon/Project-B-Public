// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0G_l._in

package _0G_l {
import com.company.assembleegameclient.util.Dispatcher;

import flash.display.Sprite;

import _0_j._D_Z_;

import flash.display.IGraphicsData;

import com.company.util.GraphicHelper;

import flash.display.Shape;

import com.company.ui.SimpleText;
import com.company.rotmg.graphics.DeleteXGraphic;
import com.company.assembleegameclient.ui._7f;
import com.company.assembleegameclient.ui.TextButton;

import _zm._01c;

import flash.display.GraphicsSolidFill;
import flash.display.GraphicsStroke;
import flash.display.GraphicsPath;
import flash.display.LineScaleMode;
import flash.display.CapsStyle;
import flash.display.JointStyle;
import flash.filters.DropShadowFilter;
import flash.events.MouseEvent;
import flash.events.Event;

import com.company.googleanalytics.GA;
import com.company.assembleegameclient.appengine._0B_u;
import com.company.assembleegameclient.parameters.Parameters;

import _zo._8C_;
import _zo._mS_;

import _qN_.Account;

import _tg._07k;
import _tg._32;
import _tg._E_C_;

import _0L_C_._qO_;

import flash.utils.ByteArray;
import flash.net.FileReference;

import com.company.util._H_U_;

import flash.display.Graphics;


public class _in extends Sprite {

    private static const WIDTH:int = 640;
    private static const HEIGHT:int = 540;
    private static const _H_7:int = 6;
    private static const _dh:int = 4;
    private static const _E_M_:Vector.<int> = new <int>[_D_Z_.INVALID, _D_Z_._04B_, _D_Z_._tA_, _D_Z_._U_a, _D_Z_._yX_, _D_Z_._xU_, _D_Z_._each, _D_Z_._00i];

    public function _in() {
        var _local2:int;
        this.box_ = new Sprite();
        this.outlineFill_ = new GraphicsSolidFill(0xFFFFFF, 1);
        this._0y = new GraphicsStroke(1, false, LineScaleMode.NORMAL, CapsStyle.NONE, JointStyle.ROUND, 3, this.outlineFill_);
        this._vV_ = new GraphicsSolidFill(0x2A2A2A, 1);
        this.path_ = new GraphicsPath(new Vector.<int>(), new Vector.<Number>());
        this.graphicsData_ = new <IGraphicsData>[_0y, _vV_, path_, GraphicHelper.END_FILL, GraphicHelper._H_B_];
        super();
        this._P_V_ = new SimpleText(22, 5746018, false, WIDTH, 0, "Myriad Pro");
        this._P_V_.setBold(true);
        this._P_V_.htmlText = '<p align="center">Load</p>';
        this._P_V_.updateMetrics();
        this._P_V_.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8, 1)];
        this._P_V_.y = 4;
        this.box_.addChild(this._P_V_);
        this._t3 = new DeleteXGraphic();
        this._t3.addEventListener(MouseEvent.CLICK, this._0G_U_);
        this._t3.x = ((WIDTH - this._t3.width) - 10);
        this._t3.y = 10;
        this.box_.addChild(this._t3);
        this._wu = new _7f(16, "Search", 120);
        this._wu.x = ((WIDTH - this._wu.width) - 20);
        this._wu.y = 40;
        this._wu.addEventListener(MouseEvent.CLICK, this._zJ_);
        this.box_.addChild(this._wu);
        this._0B_e = new TextButton(16, true, "Previous");
        this._0B_e.visible = false;
        this._0B_e.x = 20;
        this._0B_e.y = (HEIGHT - 50);
        this._0B_e.addEventListener(MouseEvent.CLICK, this._hd);
        this.box_.addChild(this._0B_e);
        this._07v = new TextButton(16, true, "Next");
        this._07v.visible = false;
        this._07v.x = ((WIDTH - this._07v.width) - 20);
        this._07v.y = (HEIGHT - 50);
        this._07v.addEventListener(MouseEvent.CLICK, this._0B_7);
        this.box_.addChild(this._07v);
        this._uv = new _01c(new <String>["Mine", "All", "Wild Shadow"], 120, 30);
        this._uv.x = 20;
        this._uv.y = 40;
        this.box_.addChild(this._uv);
        var _local1:Vector.<String> = new Vector.<String>();
        for each (_local2 in _E_M_) {
            _local1.push(_D_Z_._E_M_[_local2].name_);
        }
        this.__var = new _01c(_local1, 120, 30);
        this.__var.x = ((this._uv.x + this._uv.width) + 10);
        this.__var.y = 40;
        this.box_.addChild(this.__var);
        this._p2 = new _0G_s();
        this._p2.x = ((this.__var.x + this.__var.width) + 10);
        this._p2.y = 40;
        this.box_.addChild(this._p2);
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
    }
    protected var _T_y:Shape;
    protected var box_:Sprite;
    protected var rect_:Shape;
    protected var _P_V_:SimpleText = null;
    protected var _g5:_T_C_ = null;
    protected var _t3:DeleteXGraphic = null;
    protected var _wu:_7f;
    protected var _0B_e:TextButton;
    protected var _07v:TextButton;
    protected var _p2:_0G_s;
    protected var _uv:_01c;
    protected var __var:_01c;
    protected var _09Y_:_X_R_ = null;
    protected var _A_9:SimpleText = null;
    protected var _T_l:TextButton = null;
    protected var _4M_:Sprite = null;
    private var graphicsData_:Vector.<IGraphicsData>;
    private var outlineFill_:GraphicsSolidFill;
    private var _0y:GraphicsStroke;
    private var _vV_:GraphicsSolidFill;
    private var path_:GraphicsPath;
    private var _1D_:Boolean = false;
    public var eventDispatch:Dispatcher;

    private function search(_arg1:int):void {
        var _local2:_0B_u = new _0B_u(Parameters._fK_(), "/picture", false);
        _local2.addEventListener(_8C_.GENERIC_DATA, this._0C_0);
        _local2.addEventListener(_mS_.TEXT_ERROR, this._J_m);
        var _local3:Object = {};
        _local3["myGUID"] = Account._get().guid();
        if (this._uv.getValue() == "Mine") {
            _local3["guid"] = Account._get().guid();
        } else {
            if (this._uv.getValue() == "Wild Shadow") {
                _local3["guid"] = "administrator@wildshadow.com";
            }
        }
        var _local4:String = this.__var.getValue();
        var _local5:int = _D_Z_._07n(_local4);
        if (_local5 != 0) {
            _local3["dataType"] = _local5.toString();
        }
        var _local6:String = this._p2._03h();
        if (_local6 != "") {
            _local3["tags"] = _local6;
        }
        if (_arg1 != 0) {
            _local3["offset"] = _arg1;
        }
        _local3["num"] = (_dh * _H_7);
        _local2.sendRequest("list", _local3);
        this._wu._A_w(false);
    }

    private function _F_Z_():void {
        if (this._4M_ == null) {
            this._4M_ = new Sprite();
            this._A_9 = new SimpleText(16, 0xB3B3B3, false, 0, 0, "Myriad Pro");
            this._A_9.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8, 1)];
            this._A_9.y = (HEIGHT - 50);
            this._4M_.addChild(this._A_9);
            this._T_l = new TextButton(16, true, "download");
            this._T_l.y = (HEIGHT - 50);
            this._T_l.addEventListener(MouseEvent.CLICK, this._R_T_);
            this._4M_.addChild(this._T_l);
            this.box_.addChild(this._4M_);
        }
        this._A_9.text = (this._09Y_._yA_.length.toString() + " bitmaps - ");
        this._A_9.updateMetrics();
        this._A_9.x = ((WIDTH / 2) - ((this._A_9.width + this._T_l.width) / 2));
        this._T_l.x = (this._A_9.x + this._A_9.width);
    }

    private function draw():void {
        var _local1:Graphics;
        GraphicHelper._0L_6(this.path_);
        GraphicHelper.drawUI(0, 0, WIDTH, HEIGHT, 4, [1, 1, 1, 1], this.path_);
        this.rect_ = new Shape();
        _local1 = this.rect_.graphics;
        _local1.drawGraphicsData(this.graphicsData_);
        this.box_.addChildAt(this.rect_, 0);
        stage;
        this.box_.x = ((800 / 2) - (this.box_.width / 2));
        stage;
        this.box_.y = ((600 / 2) - (this.box_.height / 2));
        this.box_.filters = [new DropShadowFilter(0, 0, 0, 1, 16, 16, 1)];
        addChild(this.box_);
        this._T_y = new Shape();
        _local1 = this._T_y.graphics;
        _local1.clear();
        _local1.beginFill(0, 0.8);
        stage;
        stage;
        _local1.drawRect(0, 0, 800, 600);
        _local1.endFill();
        addChildAt(this._T_y, 0);
        this.search(0);
    }

    private function _0G_U_(_arg1:MouseEvent):void {
        parent.removeChild(this);
    }

    private function _zJ_(_arg1:MouseEvent):void {
        //GA.global().trackEvent("texture", "search", this._p2._03h());
        this.search(0);
    }

    private function _hd(_arg1:MouseEvent):void {
        if ((((this._g5 == null)) || ((this._g5._9U_ <= 0)))) {
            return;
        }
        this.search(Math.max(0, (this._g5._9U_ - (_dh * _H_7))));
    }

    private function _0B_7(_arg1:MouseEvent):void {
        if ((((this._g5 == null)) || ((this._g5._09O_ < (_dh * _H_7))))) {
            return;
        }
        this.search((this._g5._9U_ + (_dh * _H_7)));
    }

    private function _0C_0(_arg1:_8C_):void {
        if (((!((this._g5 == null))) && (this.box_.contains(this._g5)))) {
            this.box_.removeChild(this._g5);
        }
        var _local2:XML = new XML(_arg1.data_);
        this._g5 = new _T_C_(_local2, _H_7, _dh);
        this._g5.x = 20;
        this._g5.y = 80;
        this._g5.addEventListener(_07k.LOAD_COMPLETE_EVENT, this._set_);
        this._g5.addEventListener(_32.DELETE_PICTURE_EVENT, this._fs);
        this._g5.addEventListener(_E_C_.ADD_PICTURE_EVENT, this._0M_u);
        this.box_.addChildAt(this._g5, 1);
        this._wu._A_w(true);
        this._07v.visible = (this._g5._09O_ >= (_dh * _H_7));
        this._0B_e.visible = !((this._g5._9U_ == 0));
    }

    private function _J_m(_arg1:_mS_):void {
    }

    private function _set_(_arg1:_07k):void {
        //GA.global().trackEvent("texture", "load", _arg1.name_);
        dispatchEvent(_arg1.clone());
        parent.removeChild(this);
    }

    private function _fs(_arg1:_32):void {
        var _local2:_r4 = new _r4(_arg1.name_, _arg1.id_);
        _local2.addEventListener(_qO_.BUTTON1_EVENT, this._0B_L_);
        _local2.addEventListener(_qO_.BUTTON2_EVENT, this.onDelete);
        addChild(_local2);
    }

    private function _0M_u(_arg1:_E_C_):void {
        if (this._09Y_ == null) {
            this._09Y_ = new _X_R_();
        }
        this._09Y_._io(_arg1.bitmapData_);
        this._F_Z_();
    }

    private function _R_T_(_arg1:MouseEvent):void {
        var _local2:ByteArray = this._09Y_._05W_();
        var _local3:FileReference = new FileReference();
        _local3.save(_local2, "spritesheet.png");
        this.box_.removeChild(this._4M_);
        this._09Y_ = null;
        this._4M_ = null;
        this._A_9 = null;
        this._T_l = null;
    }

    private function _0B_L_(_arg1:Event):void {
        var _local2:_qO_ = (_arg1.target as _r4);
        _local2.parent.removeChild(_local2);
    }

    private function onDelete(_arg1:Event):void {
        var _local2:_r4 = (_arg1.target as _r4);
        _local2.parent.removeChild(_local2);
        this._g5.visible = false;
        var _local3:_0B_u = new _0B_u(Parameters._fK_(), "/picture", false);
        _local3.addEventListener(_8C_.GENERIC_DATA, this._Q_M_);
        var _local4:Object = {"id": _local2.id_.toString()};
        _H_U_._t2(_local4, Account._get().credentials());
        _local3.sendRequest("delete", _local4);
    }

    private function _Q_M_(_arg1:_8C_):void {
        this.search(this._g5._9U_);
    }

    private function onAddedToStage(_arg1:Event):void {
        if (!this._1D_) {
            this.draw();
            this._1D_ = true;
        }
        //GA.global().trackPageview("/loadDialog");
    }

}
}//package _0G_l

