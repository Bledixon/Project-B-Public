// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.map._M_9

package com.company.assembleegameclient.map {
import flash.display.Shape;
import flash.display.GraphicsGradientFill;
import flash.display.GradientType;

import com.company.util.GraphicHelper;

import flash.display.GraphicsPath;

import flash.display.IGraphicsData;


public class _M_9 extends Shape {

    private const s:Number = (600 / Math.sin((Math.PI / 4)));
    private const _U_G_:GraphicsGradientFill = new GraphicsGradientFill(GradientType.RADIAL, [0xFFFFFF, 0xFFFFFF, 0xFFFFFF], [0, 0, 0.92], [0, 155, 0xFF], GraphicHelper._0L_0(s, s, 0, ((600 - s) / 2), ((600 - s) / 2)));
    private const _006:GraphicsPath = GraphicHelper._wj(0, 0, 600, 600);

    public function _M_9() {
        this._0B_Y_ = new <IGraphicsData>[_U_G_, _006, GraphicHelper.END_FILL];
        graphics.drawGraphicsData(this._0B_Y_);
        visible = false;
    }
    private var _0B_Y_:Vector.<IGraphicsData>;
}
}//package com.company.assembleegameclient.map

