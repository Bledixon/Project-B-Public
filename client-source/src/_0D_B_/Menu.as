// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0D_B_.Menu

package _0D_B_ {
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
import flash.events.MouseEvent;
import flash.geom.Rectangle;

import com.company.util._E_I_;


public class Menu extends Sprite {

    public function Menu(_arg1:uint, _arg2:uint) {
        this._vV_ = new GraphicsSolidFill(0, 1);
        this.outlineFill_ = new GraphicsSolidFill(0, 1);
        this._0y = new GraphicsStroke(1, false, LineScaleMode.NORMAL, CapsStyle.NONE, JointStyle.ROUND, 3, this.outlineFill_);
        this.path_ = new GraphicsPath(new Vector.<int>(), new Vector.<Number>());
        this.graphicsData_ = new <IGraphicsData>[_0y, _vV_, path_, GraphicHelper.END_FILL, GraphicHelper._H_B_];
        super();
        this.background_ = _arg1;
        this._0C_d = _arg2;
        this._02N_ = 40;
        filters = [new DropShadowFilter(0, 0, 0, 1, 16, 16)];
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }
    private var graphicsData_:Vector.<IGraphicsData>;
    private var background_:uint;
    private var _0C_d:uint;
    private var _02N_:int;
    private var _vV_:GraphicsSolidFill;
    private var outlineFill_:GraphicsSolidFill;
    private var _0y:GraphicsStroke;
    private var path_:GraphicsPath;

    protected function _yZ_(_arg1:_0K_G_):void {
        _arg1.x = 8;
        _arg1.y = this._02N_;
        addChild(_arg1);
        this._02N_ = (this._02N_ + 28);
    }

    protected function remove():void {
        if (parent != null) {
            parent.removeChild(this);
        }
    }

    protected function draw():void {
        this._vV_.color = this.background_;
        this.outlineFill_.color = this._0C_d;
        graphics.clear();
        GraphicHelper._0L_6(this.path_);
        GraphicHelper.drawUI(-6, -6, Math.max(154, (width + 12)), (height + 12), 4, [1, 1, 1, 1], this.path_);
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
            //y = 12;
        }
    }

    protected function onAddedToStage(_arg1:Event):void {
        this.draw();
        this.position();
        addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        addEventListener(MouseEvent.ROLL_OUT, this.onRollOut);
    }

    protected function onRemovedFromStage(_arg1:Event):void {
        removeEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        removeEventListener(MouseEvent.ROLL_OUT, this.onRollOut);
    }

    protected function onEnterFrame(_arg1:Event):void {
        if (stage == null) {
            return;
        }
        var _local2:Rectangle = getRect(stage);
        var _local3:Number = _E_I_._1K_(_local2, stage.mouseX, stage.mouseY);
        if (_local3 > 40) {
            this.remove();
        }
    }

    protected function onRollOut(_arg1:Event):void {
        this.remove();
    }

}
}//package _0D_B_

