// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.map._3m

package com.company.assembleegameclient.map {
import flash.display.Shape;
import flash.display.GraphicsGradientFill;
import flash.display.GradientType;

import com.company.util.GraphicHelper;

import flash.display.GraphicsPath;

import flash.display.IGraphicsData;


public class _3m extends Shape {

    private const _U_G_:GraphicsGradientFill = new GraphicsGradientFill(GradientType.LINEAR, [0, 0], [0, 1], [0, 0xFF], GraphicHelper._0L_0(10, 600));
    private const _006:GraphicsPath = GraphicHelper._wj(0, 0, 10, 600);

    public function _3m() {
        this._0B_Y_ = new <IGraphicsData>[_U_G_, _006, GraphicHelper.END_FILL];
        graphics.drawGraphicsData(this._0B_Y_);
        visible = false;
    }
    private var _0B_Y_:Vector.<IGraphicsData>;
}
}//package com.company.assembleegameclient.map

