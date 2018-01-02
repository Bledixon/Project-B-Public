// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_D_d._E_m

package _D_d {
import flash.display.Sprite;

import flash.display.IGraphicsData;

import com.company.util.GraphicHelper;

import _D_d._P_u;

import com.company.assembleegameclient.ui._0K_B_;

import flash.display.Shape;
import flash.display.GraphicsSolidFill;
import flash.display.GraphicsStroke;
import flash.display.GraphicsPath;
import flash.display.LineScaleMode;
import flash.display.CapsStyle;
import flash.display.JointStyle;
import flash.events.Event;
import flash.events.MouseEvent;

import _D_d.*;

internal class _E_m extends Sprite {

    public static const WIDTH:int = 136;
    public static const HEIGHT:int = 480;
    private static const _xo:int = 20;

    public function _E_m(_arg1:int) {
        this._oX_ = new Vector.<_P_u>();
        this.outlineFill_ = new GraphicsSolidFill(0xFFFFFF, 1);
        this._0y = new GraphicsStroke(1, false, LineScaleMode.NORMAL, CapsStyle.NONE, JointStyle.ROUND, 3, this.outlineFill_);
        this._vV_ = new GraphicsSolidFill(0x363636, 1);
        this.path_ = new GraphicsPath(new Vector.<int>(), new Vector.<Number>());
        this.graphicsData_ = new <IGraphicsData>[_0y, _vV_, path_, GraphicHelper.END_FILL, GraphicHelper._H_B_];
        super();
        this._09V_ = _arg1;
        this._rC_();
        this._Y_i = new Sprite();
        this._Y_i.x = 4;
        this._Y_i.y = 6;
        addChild(this._Y_i);
        this._E_k = new _0K_B_(_xo, (HEIGHT - 8));
        this._E_k.x = ((WIDTH - _xo) - 6);
        this._E_k.y = 4;
        this._E_k.addEventListener(Event.CHANGE, this._A_E_);
        var _local2:Shape = new Shape();
        _local2.graphics.beginFill(0);
        _local2.graphics.drawRect(0, 2, ((_E_m.WIDTH - _xo) - 4), (_E_m.HEIGHT - 4));
        addChild(_local2);
        this._Y_i.mask = _local2;
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }
    public var _09V_:int;
    public var selected_:_P_u;
    private var graphicsData_:Vector.<IGraphicsData>;
    private var _Y_i:Sprite;
    private var _E_k:_0K_B_;
    private var mask_:Shape;
    private var _oX_:Vector.<_P_u>;
    private var outlineFill_:GraphicsSolidFill;
    private var _0y:GraphicsStroke;
    private var _vV_:GraphicsSolidFill;
    private var path_:GraphicsPath;

    public function _N_T_():int {
        return (this.selected_.type_);
    }

    public function _mB_(_arg1:int):void {
        var _local2:_P_u;
        for each (_local2 in this._oX_) {
            if (_local2.type_ == _arg1) {
                this.setSelected(_local2);
                return;
            }
        }
    }

    protected function _08M_(_arg1:_P_u):void {
        var _local2:int;
        _local2 = this._oX_.length;
        _arg1.x = ((((_local2 % 2)) == 0) ? 0 : (2 + _P_u.WIDTH));
        _arg1.y = ((int((_local2 / 2)) * _P_u.HEIGHT) + 6);
        this._Y_i.addChild(_arg1);
        if (_local2 == 0) {
            this.setSelected(_arg1);
        }
        _arg1.addEventListener(MouseEvent.MOUSE_DOWN, this.onMouseDown);
        this._oX_.push(_arg1);
    }

    protected function setSelected(_arg1:_P_u):void {
        if (this.selected_ != null) {
            this.selected_.setSelected(false);
        }
        this.selected_ = _arg1;
        this.selected_.setSelected(true);
    }

    private function _rC_():void {
        GraphicHelper._0L_6(this.path_);
        GraphicHelper.drawUI(0, 0, WIDTH, HEIGHT, 4, [1, 1, 1, 1], this.path_);
        graphics.drawGraphicsData(this.graphicsData_);
    }

    protected function onMouseDown(_arg1:MouseEvent):void {
        var _local2:_P_u = (_arg1.currentTarget as _P_u);
        this.setSelected(_local2);
    }

    protected function _A_E_(_arg1:Event):void {
        this._Y_i.y = (6 - (this._E_k._Q_D_() * ((this._Y_i.height + 12) - HEIGHT)));
    }

    protected function onAddedToStage(_arg1:Event):void {
        addEventListener(MouseEvent.MOUSE_WHEEL, this._lb);
        this._E_k._fA_(HEIGHT, this._Y_i.height);
        addChild(this._E_k);
    }

    protected function onRemovedFromStage(_arg1:Event):void {
        removeEventListener(MouseEvent.MOUSE_WHEEL, this._lb);
    }

    protected function _lb(_arg1:MouseEvent):void {
        if (_arg1.delta > 0) {
            this._E_k._d9();
        } else {
            if (_arg1.delta < 0) {
                this._E_k._tE_();
            }
        }
    }

}
}//package _D_d

