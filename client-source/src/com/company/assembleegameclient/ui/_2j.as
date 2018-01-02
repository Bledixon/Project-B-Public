// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.ui._2j

package com.company.assembleegameclient.ui {
import flash.geom.Matrix;
import flash.display.Bitmap;
import flash.display.Shape;
import flash.display.GraphicsSolidFill;
import flash.display.GraphicsStroke;
import flash.display.GraphicsPath;

import flash.display.IGraphicsData;
import flash.display.BitmapData;
import flash.geom.Point;

import com.company.ui.SimpleText;

import flash.display.LineScaleMode;
import flash.display.CapsStyle;
import flash.display.JointStyle;

import com.company.util.GraphicHelper;
import com.company.util._O_m;
import com.company.assembleegameclient.objects.ObjectLibrary;
import com.company.util.MoreColorUtil;


public class _2j extends Slot {

    private static const _1U_:Matrix = function ():Matrix {
        var _local1:* = new Matrix();
        _local1.translate(10, 5);
        return (_local1);
    }();

    public function _2j(_arg1:int, _arg2:Boolean, _arg3:Boolean, _arg4:int, _arg5:int, _arg6:Array, _arg7:uint, _arg8:Object) {
        var _local8:BitmapData;
        var _local9:XML;
        var _local10:Point;
        var _local11:SimpleText;
        this._W_p = new GraphicsSolidFill(16711310, 1);
        this._0y = new GraphicsStroke(2, false, LineScaleMode.NORMAL, CapsStyle.NONE, JointStyle.ROUND, 3, this._W_p);
        this._01a = new GraphicsPath(new Vector.<int>(), new Vector.<Number>());
        this.graphicsData_ = new <IGraphicsData>[this._0y, this._01a, GraphicHelper._H_B_];
        super(_arg4, _arg5, _arg6);
        this.id = _arg7;
        this.item_ = _arg1;
        this._var = _arg2;
        this.included_ = _arg3;
        this.data_ = _arg8;
        if (this.item_ != -1) {
            _O_m._03d(this, _0H_K_);
            _local8 = ObjectLibrary.getRedrawnTextureFromType(this.item_, 80, true);
            if(this.data_ != null && this.data_.hasOwnProperty("TextureFile") && this.data_.TextureFile != "") {
                _local8 = ObjectLibrary.getRedrawnTextureFromTypeCustom(this.item_, 80, true, this.data_);
            }
            _local9 = ObjectLibrary._Q_F_[this.item_];
            if (_local9.hasOwnProperty("Doses")) {
                _local8 = _local8.clone();
                _local11 = new SimpleText(12, 0xFFFFFF, false, 0, 0, "Myriad Pro");
                _local11.text = String(_local9.Doses);
                _local11.updateMetrics();
                _local8.draw(_local11, _1U_);
            }
            _local10 = _H_K_(this.item_, type_, false);
            this._0L_K_ = new Bitmap(_local8);
            this._0L_K_.x = (((WIDTH / 2) - (this._0L_K_.width / 2)) + _local10.x);
            this._0L_K_.y = (((HEIGHT / 2) - (this._0L_K_.height / 2)) + _local10.y);
            _O_m._041(this, this._0L_K_);
        }
        if (!this._var) {
            transform.colorTransform = MoreColorUtil._0t;
        }
        this._k5 = this._U_e();
        addChild(this._k5);
        this.setIncluded(_arg3);
    }
    public var id:uint;
    public var item_:int;
    public var data_:Object;
    public var _var:Boolean;
    public var included_:Boolean;
    public var _0L_K_:Bitmap;
    public var _k5:Shape;
    private var _W_p:GraphicsSolidFill;
    private var _0y:GraphicsStroke;
    private var _01a:GraphicsPath;
    private var graphicsData_:Vector.<IGraphicsData>;

    public function setIncluded(_arg1:Boolean):void {
        this.included_ = _arg1;
        this._k5.visible = this.included_;
        if (this.included_) {
            _04c.color = 16764247;
        } else {
            _04c.color = 0x4C4C4C;
        }
        _rC_();
    }

    private function _U_e():Shape {
        var _local1:Shape = new Shape();
        GraphicHelper._0L_6(this._01a);
        GraphicHelper.drawUI(0, 0, WIDTH, HEIGHT, 4, _07i, this._01a);
        _local1.graphics.drawGraphicsData(this.graphicsData_);
        return (_local1);
    }

}
}//package com.company.assembleegameclient.ui

