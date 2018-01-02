// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_E_7._for_

package _E_7 {
import flash.display.Sprite;

import flash.display.IGraphicsData;

import com.company.util.GraphicHelper;

import flash.display.GraphicsSolidFill;
import flash.display.GraphicsStroke;
import flash.display.GraphicsPath;
import flash.display.LineScaleMode;
import flash.display.CapsStyle;
import flash.display.JointStyle;
import flash.filters.DropShadowFilter;
import flash.events.Event;


public class _for_ extends Sprite {

    public function _for_(_arg1:uint, _arg2:Number, _arg3:uint, _arg4:Number, _arg5:Boolean = true) {
        this._vV_ = new GraphicsSolidFill(0, 1);
        this.outlineFill_ = new GraphicsSolidFill(0xFFFFFF, 1);
        this._0y = new GraphicsStroke(1, false, LineScaleMode.NORMAL, CapsStyle.NONE, JointStyle.ROUND, 3, this.outlineFill_);
        this.path_ = new GraphicsPath(new Vector.<int>(), new Vector.<Number>());
        this.graphicsData_ = new <IGraphicsData>[_0y, _vV_, path_, GraphicHelper.END_FILL, GraphicHelper._H_B_];
        super();
        this.background_ = _arg1;
        this._fP_ = _arg2;
        this._0C_d = _arg3;
        this._069 = _arg4;
        this._J_ = _arg5;
        mouseEnabled = false;
        mouseChildren = false;
        filters = [new DropShadowFilter(0, 0, 0, 1, 16, 16)];
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }
    public var _R_A_:int;
    public var _D_f:int;
    private var graphicsData_:Vector.<IGraphicsData>;
    private var background_:uint;
    private var _fP_:Number;
    private var _0C_d:uint;
    private var _069:Number;
    private var _J_:Boolean;
    private var _vV_:GraphicsSolidFill;
    private var outlineFill_:GraphicsSolidFill;
    private var _0y:GraphicsStroke;
    private var path_:GraphicsPath;

    public function draw():void {
        this._vV_.color = this.background_;
        this._vV_.alpha = this._fP_;
        this.outlineFill_.color = this._0C_d;
        this.outlineFill_.alpha = this._069;
        graphics.clear();
        this._R_A_ = width;
        this._D_f = height;
        GraphicHelper._0L_6(this.path_);
        GraphicHelper.drawUI(-6, -6, (this._R_A_ + 12), (this._D_f + 12), 4, [1, 1, 1, 1], this.path_);
        graphics.drawGraphicsData(this.graphicsData_);
    }

    private function position():void {
        if (stage == null) {
            return;
        }
        stage;
        if (stage.mouseX < (800 / 2)) {
            x = (stage.mouseX + 12);
        } else {
            x = ((stage.mouseX - width) - 1);
        }
        if (x < 12) {
            x = 12;
        }
        stage;
        if (stage.mouseY < (600 / 3)) {
            y = (stage.mouseY + 12);
        } else {
            y = ((stage.mouseY - height) - 1);
        }
        if (y < 12) {
          //  y = 12;
        }
    }

    private function onAddedToStage(_arg1:Event):void {
        this.draw();
        if (this._J_) {
            this.position();
            addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        }
    }

    private function onRemovedFromStage(_arg1:Event):void {
        if (this._J_) {
            removeEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        }
    }

    private function onEnterFrame(_arg1:Event):void {
        this.position();
    }

}
}//package _E_7

