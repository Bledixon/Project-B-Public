package com.company.assembleegameclient.ui {
import com.company.util.GraphicHelper;

import flash.display.DisplayObject;
import flash.display.GraphicsPath;
import flash.display.GraphicsSolidFill;
import flash.display.IGraphicsData;
import flash.display.Sprite;

public class TabBackground extends Sprite {
    public function TabBackground(_width:int, _height:int) {
        this.fill_ = new GraphicsSolidFill(0x191919, 1);
        this.path_ = new GraphicsPath(new Vector.<int>(), new Vector.<Number>());
        this.graphicsData_ = new <IGraphicsData>[this.fill_, this.path_, GraphicHelper.END_FILL];
        super();
        this.width_ = _width;
        this.height_ = _height;
    }
    public var width_:int;
    public var height_:int;
    protected var fill_:GraphicsSolidFill;
    protected var path_:GraphicsPath;
    private var graphicsData_:Vector.<IGraphicsData>;

    public function draw(_firstTab:Boolean) {
        GraphicHelper._0L_6(this.path_);
        GraphicHelper.drawUI(0, 0, this.width_, this.height_, 6, [_firstTab ? 0 : 1, 1, 1, 1], this.path_);
        this.graphics.clear();
        this.graphics.drawGraphicsData(this.graphicsData_);
    }
}
}