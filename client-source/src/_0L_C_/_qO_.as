// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0L_C_._qO_

package _0L_C_ {
import com.company.assembleegameclient.util.Dispatcher;

import flash.display.Sprite;

import flash.display.IGraphicsData;

import com.company.util.GraphicHelper;

import flash.display.Shape;

import com.company.ui.SimpleText;
import com.company.assembleegameclient.ui._7f;

import flash.display.GraphicsSolidFill;
import flash.display.GraphicsStroke;
import flash.display.GraphicsPath;
import flash.display.LineScaleMode;
import flash.display.CapsStyle;
import flash.display.JointStyle;
import flash.text.TextFieldAutoSize;
import flash.filters.DropShadowFilter;
import flash.events.MouseEvent;
import flash.events.Event;
import flash.display.Graphics;

import com.company.googleanalytics.GA;


public class _qO_ extends Sprite {

    public static const BUTTON1_EVENT:String = "DIALOG_BUTTON1";
    public static const BUTTON2_EVENT:String = "DIALOG_BUTTON2";
    private static const WIDTH:int = 300;

    public function _qO_(_arg1:String, _arg2:String, _arg3:String, _arg4:String, _arg5:String) {
        this.box_ = new Sprite();
        this.outlineFill_ = new GraphicsSolidFill(0xFFFFFF, 1);
        this._0y = new GraphicsStroke(1, false, LineScaleMode.NORMAL, CapsStyle.NONE, JointStyle.ROUND, 3, this.outlineFill_);
        this._vV_ = new GraphicsSolidFill(0x2A2A2A, 1);
        this.path_ = new GraphicsPath(new Vector.<int>(), new Vector.<Number>());
        this.graphicsData_ = new <IGraphicsData>[_0y, _vV_, path_, GraphicHelper.END_FILL, GraphicHelper._H_B_];
        super();
        this._J_O_ = _arg5;
        this._p = new SimpleText(14, 0xB3B3B3, false, (WIDTH - 40), 0, "Myriad Pro");
        this._p.x = 20;
        this._p.multiline = true;
        this._p.wordWrap = true;
        this._p.htmlText = (('<p align="center">' + _arg1) + "</p>");
        this._p.autoSize = TextFieldAutoSize.CENTER;
        this._p.mouseEnabled = true;
        this._p.updateMetrics();
        this._p.filters = [new DropShadowFilter(0, 0, 0, 1, 6, 6, 1)];
        if (_arg2 != null) {
            this._P_V_ = new SimpleText(18, 5746018, false, WIDTH, 0, "Myriad Pro");
            this._P_V_.setBold(true);
            this._P_V_.htmlText = (('<p align="center">' + _arg2) + "</p>");
            this._P_V_.updateMetrics();
            this._P_V_.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8, 1)];
        }
        if (_arg3 != null) {
            this.button1_ = new _7f(16, _arg3, 120);
            this.button1_.addEventListener(MouseEvent.CLICK, this.onButton1Click);
        }
        if (_arg4 != null) {
            this.button2_ = new _7f(16, _arg4, 120);
            this.button2_.addEventListener(MouseEvent.CLICK, this.onButton2Click);
        }
        this.draw();
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }
    protected var _T_y:Shape;
    protected var box_:Sprite;
    protected var rect_:Shape;
    protected var _p:SimpleText;
    protected var _P_V_:SimpleText = null;
    protected var button1_:_7f = null;
    protected var button2_:_7f = null;
    protected var _J_O_:String = null;
    private var graphicsData_:Vector.<IGraphicsData>;
    private var outlineFill_:GraphicsSolidFill;
    private var _0y:GraphicsStroke;
    private var _vV_:GraphicsSolidFill;
    private var path_:GraphicsPath;
    public var eventDispatch:Dispatcher;

    private function draw():void {
        var _local2:int;
        if (this._P_V_ != null) {
            this._P_V_.y = 2;
            this.box_.addChild(this._P_V_);
            this._p.y = (this.box_.height + 8);
        } else {
            this._p.y = 4;
        }
        this.box_.addChild(this._p);
        if (this.button1_ != null) {
            _local2 = (this.box_.height + 16);
            this.box_.addChild(this.button1_);
            this.button1_.y = _local2;
            if (this.button2_ == null) {
                this.button1_.x = ((WIDTH / 2) - (this.button1_.width / 2));
            } else {
                this.button1_.x = ((WIDTH / 4) - (this.button1_.width / 2));
                this.box_.addChild(this.button2_);
                this.button2_.x = (((3 * WIDTH) / 4) - (this.button2_.width / 2));
                this.button2_.y = _local2;
            }
        }
        GraphicHelper._0L_6(this.path_);
        GraphicHelper.drawUI(0, 0, WIDTH, (this.box_.height + 10), 4, [1, 1, 1, 1], this.path_);
        this.rect_ = new Shape();
        var _local1:Graphics = this.rect_.graphics;
        _local1.drawGraphicsData(this.graphicsData_);
        this.box_.addChildAt(this.rect_, 0);
        this.box_.filters = [new DropShadowFilter(0, 0, 0, 1, 16, 16, 1)];
        addChild(this.box_);
        this._T_y = new Shape();
    }

    private function onAddedToStage(_arg1:Event):void {
        stage;
        this.box_.x = ((800 / 2) - (this.box_.width / 2));
        stage;
        this.box_.y = ((600 / 2) - (this.box_.height / 2));
        var _local2:Graphics = this._T_y.graphics;
        _local2.clear();
        _local2.beginFill(0, 0.8);
        stage;
        stage;
        _local2.drawRect(0, 0, 800, 600);
        _local2.endFill();
        addChildAt(this._T_y, 0);
        /*if (this._J_O_ != null) {
            GA.global().trackPageview(this._J_O_);
        }*/
    }

    private function onRemovedFromStage(_arg1:Event):void {
    }

    private function onButton1Click(_arg1:MouseEvent):void {
        dispatchEvent(new Event(BUTTON1_EVENT));
    }

    private function onButton2Click(_arg1:MouseEvent):void {
        dispatchEvent(new Event(BUTTON2_EVENT));
    }

}
}//package _0L_C_

