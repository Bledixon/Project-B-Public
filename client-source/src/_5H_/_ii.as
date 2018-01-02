// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_5H_._ii

package _5H_ {
import flash.display.Sprite;
import flash.display.Shape;
import flash.display.GraphicsSolidFill;
import flash.display.GraphicsStroke;
import flash.display.LineScaleMode;
import flash.display.CapsStyle;
import flash.display.JointStyle;
import flash.display.GraphicsPath;

import com.company.util.GraphicHelper;

import flash.display.IGraphicsData;

import flash.display.Graphics;


public class _ii extends Sprite {

    private const HEIGHT:int = 28;

    public function _ii() {
        addChild((this._N_X_ = this._0H_g()));
        addChild((this.selected = this._z8()));
        this.setSelected(false);
    }
    private var _N_X_:Shape;
    private var selected:Shape;

    public function setSelected(_arg1:Boolean):void {
        this._N_X_.visible = !(_arg1);
        this.selected.visible = _arg1;
    }

    private function _0H_g():Shape {
        var _local1:Shape = new Shape();
        this._0M_U_(_local1.graphics);
        return (_local1);
    }

    private function _z8():Shape {
        var _local1:Shape = new Shape();
        this._0M_U_(_local1.graphics);
        this._B__(_local1.graphics);
        return (_local1);
    }

    private function _0M_U_(_arg1:Graphics):void {
        var _local2:GraphicsSolidFill = new GraphicsSolidFill(0, 0.01);
        var _local3:GraphicsSolidFill = new GraphicsSolidFill(0xFFFFFF, 1);
        var _local4:GraphicsStroke = new GraphicsStroke(2, false, LineScaleMode.NORMAL, CapsStyle.NONE, JointStyle.ROUND, 3, _local3);
        var _local5:GraphicsPath = new GraphicsPath();
        GraphicHelper.drawUI(0, 0, this.HEIGHT, this.HEIGHT, 4, GraphicHelper._0D_3, _local5);
        var _local6:Vector.<IGraphicsData> = new <IGraphicsData>[_local4, _local2, _local5, GraphicHelper.END_FILL, GraphicHelper._H_B_];
        _arg1.drawGraphicsData(_local6);
    }

    private function _B__(_arg1:Graphics):void {
        var _local2:GraphicsSolidFill = new GraphicsSolidFill(0xFFFFFF, 1);
        var _local3:GraphicsPath = new GraphicsPath();
        GraphicHelper.drawUI(4, 4, (this.HEIGHT - 8), (this.HEIGHT - 8), 2, GraphicHelper._0D_3, _local3);
        var _local4:Vector.<IGraphicsData> = new <IGraphicsData>[_local2, _local3, GraphicHelper.END_FILL];
        _arg1.drawGraphicsData(_local4);
    }

}
}//package _5H_

