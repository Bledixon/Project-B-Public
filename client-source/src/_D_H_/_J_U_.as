// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_D_H_._J_U_

package _D_H_ {
import flash.display.Sprite;

import flash.display.IGraphicsData;

import com.company.util.GraphicHelper;

import flash.display.BitmapData;
import flash.display.Shape;

import com.company.ui.SimpleText;
import com.company.assembleegameclient.ui._7f;

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

import _0I_r.MultipartURLLoader;

import _qN_.Account;

import _q8._9l;

import flash.utils.ByteArray;

import com.company.assembleegameclient.parameters.Parameters;

import flash.display.Graphics;


public class _J_U_ extends Sprite {

    private static const WIDTH:int = 400;

    public function _J_U_(_arg1:String, _arg2:int, _arg3:String, _arg4:BitmapData, _arg5:Vector.<int>) {
        this.box_ = new Sprite();
        this.outlineFill_ = new GraphicsSolidFill(0xFFFFFF, 1);
        this._0y = new GraphicsStroke(1, false, LineScaleMode.NORMAL, CapsStyle.NONE, JointStyle.ROUND, 3, this.outlineFill_);
        this._vV_ = new GraphicsSolidFill(0x2A2A2A, 1);
        this.path_ = new GraphicsPath(new Vector.<int>(), new Vector.<Number>());
        this.graphicsData_ = new <IGraphicsData>[_0y, _vV_, path_, GraphicHelper.END_FILL, GraphicHelper._H_B_];
        super();
        this.bitmapData_ = _arg4;
        this._P_V_ = new SimpleText(22, 5746018, false, WIDTH, 0, "Myriad Pro");
        this._P_V_.setBold(true);
        this._P_V_.htmlText = '<p align="center">Save</p>';
        this._P_V_.updateMetrics();
        this._P_V_.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8, 1)];
        this._P_V_.y = 4;
        this.box_.addChild(this._P_V_);
        this.nameText_ = new _K_U_(_arg1);
        this.nameText_.x = 20;
        this.nameText_.y = 50;
        this.box_.addChild(this.nameText_);
        this._92 = new _0J_3(_arg3);
        this._92.x = 20;
        this._92.y = 180;
        this.box_.addChild(this._92);
        this._B_k = new _7f(16, "Save", 120);
        this._B_k.x = ((WIDTH - this._B_k.width) - 20);
        this._B_k.y = 330;
        this._B_k.addEventListener(MouseEvent.CLICK, this._U_m);
        this.box_.addChild(this._B_k);
        this._t3 = new _7f(16, "Cancel", 120);
        this._t3.x = (((WIDTH - this._B_k.width) - this._t3.width) - 40);
        this._t3.y = 330;
        this._t3.addEventListener(MouseEvent.CLICK, this._0G_U_);
        this.box_.addChild(this._t3);
        this.errorText_ = new SimpleText(14, 16549442, false, 0, 0, "Myriad Pro");
        this.errorText_.text = "";
        this.errorText_.updateMetrics();
        this.errorText_.x = ((WIDTH / 2) - (this.errorText_.width / 2));
        this.errorText_.y = 290;
        this.errorText_.filters = [new DropShadowFilter(0, 0, 0)];
        this.box_.addChild(this.errorText_);
        this._0H_b = new _2V_(_arg5, _arg2);
        this._0H_b.x = 20;
        this._0H_b.y = 110;
        this.box_.addChild(this._0H_b);
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
    }
    protected var bitmapData_:BitmapData;
    protected var _T_y:Shape;
    protected var box_:Sprite;
    protected var rect_:Shape;
    protected var _P_V_:SimpleText = null;
    protected var nameText_:_K_U_ = null;
    protected var _0H_b:_2V_ = null;
    protected var _92:_0J_3 = null;
    protected var _B_k:_7f = null;
    protected var _t3:_7f = null;
    protected var errorText_:SimpleText;
    private var graphicsData_:Vector.<IGraphicsData>;
    private var outlineFill_:GraphicsSolidFill;
    private var _0y:GraphicsStroke;
    private var _vV_:GraphicsSolidFill;
    private var path_:GraphicsPath;

    private function _0B_T_(_arg1:String):void {
        this.errorText_.text = _arg1;
        this.errorText_.updateMetrics();
        this.errorText_.x = ((WIDTH / 2) - (this.errorText_.width / 2));
    }

    private function _ld():void {
        var _local1:MultipartURLLoader = new MultipartURLLoader();
        _local1._cF_("guid", Account._get().guid());
        _local1._cF_("password", Account._get().password());
        _local1._cF_("secret", Account._get().secret());
        _local1._cF_("name", this.nameText_.text());
        _local1._cF_("dataType", this._0H_b.getType());
        _local1._cF_("tags", this._92.text());
        _local1._cF_("overwrite", "on");
        var _local2:ByteArray = _9l.encode(this.bitmapData_);
        _local1._d(_local2, "Foo.png", "data");
        _local1.addEventListener(Event.COMPLETE, this._053);
        _local1.load((("http://" + Parameters._fK_()) + "/picture/save"));
        this._t3._A_w(false);
        this._B_k._A_w(false);
    }

    private function _0G_U_(_arg1:MouseEvent):void {
        parent.removeChild(this);
    }

    private function _U_m(_arg1:MouseEvent):void {
        if (this.nameText_.text() == "") {
            this._0B_T_("You must set a name");
            return;
        }
        if (this._0H_b.getType() == 0) {
            this._0B_T_("You must select a type");
            return;
        }
        //GA.global().trackEvent("texture", "save", this.nameText_.text());
        this._ld();
    }

    private function _053(_arg1:Event):void {
        parent.removeChild(this);
    }

    private function onAddedToStage(_arg1:Event):void {
        GraphicHelper._0L_6(this.path_);
        GraphicHelper.drawUI(0, 0, WIDTH, (this.box_.height + 20), 4, [1, 1, 1, 1], this.path_);
        this.rect_ = new Shape();
        var _local2:Graphics = this.rect_.graphics;
        _local2.drawGraphicsData(this.graphicsData_);
        this.box_.addChildAt(this.rect_, 0);
        stage;
        this.box_.x = ((800 / 2) - (this.box_.width / 2));
        stage;
        this.box_.y = ((600 / 2) - (this.box_.height / 2));
        this.box_.filters = [new DropShadowFilter(0, 0, 0, 1, 16, 16, 1)];
        addChild(this.box_);
        this._T_y = new Shape();
        _local2 = this._T_y.graphics;
        _local2.clear();
        _local2.beginFill(0, 0.8);
        stage;
        stage;
        _local2.drawRect(0, 0, 800, 600);
        _local2.endFill();
        addChildAt(this._T_y, 0);
        //GA.global().trackPageview("/saveDialog");
    }

}
}//package _D_H_

