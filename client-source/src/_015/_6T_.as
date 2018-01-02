// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_015._6T_

package _015 {
import flash.display.Sprite;

import flash.display.IGraphicsData;

import com.company.util.GraphicHelper;
import com.company.assembleegameclient.objects.GameObject;

import flash.geom.Point;
import flash.text.TextField;
import flash.display.GraphicsSolidFill;
import flash.display.GraphicsStroke;
import flash.display.GraphicsPath;
import flash.display.LineScaleMode;
import flash.display.CapsStyle;
import flash.display.JointStyle;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;
import flash.display.GraphicsPathCommand;
import flash.filters.DropShadowFilter;

import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.map._0D_v;


public class _6T_ extends Sprite implements _0J_p {

    public function _6T_(_arg1:GameObject, _arg2:String, _arg3:uint, _arg4:Number, _arg5:uint, _arg6:Number, _arg7:uint, _arg8:int, _arg9:Boolean, _arg10:Boolean) {
        this._9U_ = new Point();
        this._vV_ = new GraphicsSolidFill(0, 1);
        this.outlineFill_ = new GraphicsSolidFill(0xFFFFFF, 1);
        this._0y = new GraphicsStroke(2, false, LineScaleMode.NORMAL, CapsStyle.NONE, JointStyle.ROUND, 3, this.outlineFill_);
        this.path_ = new GraphicsPath(new Vector.<int>(), new Vector.<Number>());
        this.graphicsData_ = new <IGraphicsData>[_0y, _vV_, path_, GraphicHelper.END_FILL, GraphicHelper._H_B_];
        super();
        mouseEnabled = false;
        mouseChildren = false;
        this.go_ = _arg1;
        this.lifetime_ = (_arg8 * 1000);
        this._vF_ = _arg10;
        this.text_ = new TextField();
        this.text_.autoSize = TextFieldAutoSize.LEFT;
        this.text_.embedFonts = true; // CHANGED - was true, changed to false so that text shows (there is a problem with embeded fonts)
        this.text_.width = 150;
        var _local11:TextFormat = new TextFormat();
        _local11.font = "Myriad Pro";
        _local11.size = 14;
        _local11.bold = _arg9;
        _local11.color = _arg7;
        this.text_.defaultTextFormat = _local11;
        this.text_.selectable = false;
        this.text_.mouseEnabled = false;
        this.text_.multiline = true;
        this.text_.wordWrap = true;
        this.text_.text = _arg2;
        addChild(this.text_);
        var _local12:int = (this.text_.textWidth + 4);
        this._9U_.x = (-(_local12) / 2);
        this._vV_.color = _arg3;
        this._vV_.alpha = _arg4;
        this.outlineFill_.color = _arg5;
        this.outlineFill_.alpha = _arg6;
        graphics.clear();
        GraphicHelper._0L_6(this.path_);
        GraphicHelper.drawUI(-6, -6, (_local12 + 12), (height + 12), 4, [1, 1, 1, 1], this.path_);
        this.path_.commands.splice(6, 0, GraphicsPathCommand.LINE_TO, GraphicsPathCommand.LINE_TO, GraphicsPathCommand.LINE_TO);
        var _local13:int = height;
        this.path_.data.splice(12, 0, ((_local12 / 2) + 8), (_local13 + 6), (_local12 / 2), (_local13 + 18), ((_local12 / 2) - 8), (_local13 + 6));
        graphics.drawGraphicsData(this.graphicsData_);
        filters = [new DropShadowFilter(0, 0, 0, 1, 16, 16)];
        this._9U_.y = ((-(height) - ((this.go_.texture_.height * (_arg1.size_ / 100)) * 5)) - 2);
        visible = false;
    }
    public var go_:GameObject;
    public var lifetime_:int;
    public var _vF_:Boolean;
    public var _9U_:Point;
    public var text_:TextField;
    private var graphicsData_:Vector.<IGraphicsData>;
    private var _vV_:GraphicsSolidFill;
    private var outlineFill_:GraphicsSolidFill;
    private var _0y:GraphicsStroke;
    private var path_:GraphicsPath;
    private var startTime_:int = 0;

    public function draw(_arg1:_0D_v, _arg2:int):Boolean {
        if (this.startTime_ == 0) {
            this.startTime_ = _arg2;
        }
        var _local3:int = (_arg2 - this.startTime_);
        if ((((_local3 > this.lifetime_)) || (((!((this.go_ == null))) && ((this.go_.map_ == null)))))) {
            return (false);
        }
        if ((((this.go_ == null)) || (!(this.go_._1D_)))) {
            visible = false;
            return (true);
        }
        if (((this._vF_) && (!(Parameters.data_.textBubbles)))) {
            visible = false;
            return (true);
        }
        visible = true;
        x = int((this.go_._bY_[0] + this._9U_.x));
        y = int((this.go_._bY_[1] + this._9U_.y));
        return (true);
    }

}
}//package _015

