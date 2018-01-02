package com.company.assembleegameclient.ui {
import com.company.assembleegameclient.util.TextureRedrawer;
import com.company.ui.SimpleText;
import com.company.util.AssetLibrary;

import flash.display.Bitmap;
import flash.display.BitmapData;

import flash.display.Sprite;
import flash.filters.DropShadowFilter;

public class _1B_v extends Sprite {

    private static const _Y_J_:int = 18;

    public function _1B_v() {
        this._Zx_ = new SimpleText(_Y_J_, 0xFFFFFF, false, 0, 0, "Myriad Pro");
        this._Zx_.filters = [new DropShadowFilter(0, 0, 0, 1, 4, 4, 2)];
       addChild(_Zx_);
        var _local2:BitmapData = AssetLibrary._xK_("lofiObj3", 182);
        _local2 = TextureRedrawer.redraw(_local2, 40, true, 0, 0);
        this._3q = new Bitmap(_local2);
        addChild(_3q);
        this.draw(0);
        mouseEnabled = false;
        doubleClickEnabled = false;
    }

    private var _Zx_:SimpleText;
    private var _3q:Bitmap;
    private var keys_:int = -1;

    public function draw(_arg1:int):void {
        if ((_arg1 === this.keys_)){
            return;
        }
        this.keys_ = _arg1;
        this._3q.x = -(this._3q.width);
        this._Zx_.text = this.keys_.toString();
        this._Zx_.updateMetrics();
        this._Zx_.x = ((this._3q.x - this._Zx_.width) + 8);
        this._Zx_.y = ((this._3q.height / 2) - (this._Zx_.height / 2));
    }
}
}
