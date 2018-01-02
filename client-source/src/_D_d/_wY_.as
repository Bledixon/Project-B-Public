// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_D_d._wY_

package _D_d {
import flash.display.Sprite;

import flash.display.IGraphicsData;

import com.company.util.GraphicHelper;
import com.company.ui.SimpleText;

import flash.display.GraphicsSolidFill;
import flash.display.GraphicsStroke;
import flash.display.GraphicsPath;
import flash.display.LineScaleMode;
import flash.display.CapsStyle;
import flash.display.JointStyle;
import flash.filters.DropShadowFilter;
import flash.text.StyleSheet;
import flash.events.Event;
import flash.geom.Rectangle;

import com.company.assembleegameclient.map._pf;
import com.company.assembleegameclient.objects.ObjectLibrary;
import com.company.assembleegameclient.map._sn;


public class _wY_ extends Sprite {

    public static const WIDTH:int = 134;
    public static const HEIGHT:int = 150;
    private static const _K_z:String = ".in { margin-left:10px; text-indent: -10px; }";

    public function _wY_(_arg1:_N_g) {
        this.outlineFill_ = new GraphicsSolidFill(0xFFFFFF, 1);
        this._0y = new GraphicsStroke(1, false, LineScaleMode.NORMAL, CapsStyle.NONE, JointStyle.ROUND, 3, this.outlineFill_);
        this._vV_ = new GraphicsSolidFill(0x2A2A2A, 1);
        this.path_ = new GraphicsPath(new Vector.<int>(), new Vector.<Number>());
        this.graphicsData_ = new <IGraphicsData>[_0y, _vV_, path_, GraphicHelper.END_FILL, GraphicHelper._H_B_];
        super();
        this._09l = _arg1;
        this._rC_();
        this._01h = new SimpleText(12, 0xFFFFFF, false, (WIDTH - 10), 0, "Myriad Pro");
        this._01h.filters = [new DropShadowFilter(0, 0, 0)];
        this._01h.y = 4;
        this._01h.x = 4;
        addChild(this._01h);
        var _local2:StyleSheet = new StyleSheet();
        _local2.parseCSS(_K_z);
        this._Y_W_ = new SimpleText(12, 0xFFFFFF, false, (WIDTH - 10), 0, "Myriad Pro");
        this._Y_W_.styleSheet = _local2;
        this._Y_W_.wordWrap = true;
        this._Y_W_.filters = [new DropShadowFilter(0, 0, 0)];
        this._Y_W_.x = 4;
        this._Y_W_.y = 36;
        addChild(this._Y_W_);
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }
    private var graphicsData_:Vector.<IGraphicsData>;
    private var _09l:_N_g;
    private var _01h:SimpleText;
    private var _Y_W_:SimpleText;
    private var outlineFill_:GraphicsSolidFill;
    private var _0y:GraphicsStroke;
    private var _vV_:GraphicsSolidFill;
    private var path_:GraphicsPath;

    private function _rC_():void {
        GraphicHelper._0L_6(this.path_);
        GraphicHelper.drawUI(0, 0, WIDTH, HEIGHT, 4, [1, 1, 1, 1], this.path_);
        graphics.drawGraphicsData(this.graphicsData_);
    }

    private function onAddedToStage(_arg1:Event):void {
        addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
    }

    private function onRemovedFromStage(_arg1:Event):void {
        addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
    }

    private function onEnterFrame(_arg1:Event):void {
        var _local2:Rectangle = this._09l._bO_();
        this._01h.text = ((("Position: " + _local2.x) + ", ") + _local2.y);
        if ((((_local2.width > 1)) || ((_local2.height > 1)))) {
            this._01h.text = (this._01h.text + ((("\nRect: " + _local2.width) + ", ") + _local2.height));
        }
        this._01h._08S_();
        var _local3:_11 = this._09l._p_(_local2.x, _local2.y);
        var _local4:Vector.<int> = (((_local3 == null)) ? _M_u._0K_Q_ : _local3._5F_);
        var _local5:String = (((_local4[_M_u._6h] == -1)) ? "None" : _pf._6H_(_local4[_M_u._6h]));
        var _local6:String = (((_local4[_M_u._S_E_] == -1)) ? "None" : ObjectLibrary._6H_(_local4[_M_u._S_E_]));
        var _local7:String = (((_local4[_M_u._0G_m] == -1)) ? "None" : _sn._6H_(_local4[_M_u._0G_m]));
        this._Y_W_.text = (((((((("<span class='in'>" + "Ground: ") + _local5) + "\nObject: ") + _local6) + (((((_local3 == null)) || ((_local3._fi == null)))) ? "" : ((" (" + _local3._fi) + ")"))) + "\nRegion: ") + _local7) + "</span>");
        this._Y_W_._08S_();
    }

}
}//package _D_d

