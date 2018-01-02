// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.ui._Q_y

package com.company.assembleegameclient.ui {


import com.company.assembleegameclient.objects.ObjectLibrary;
import com.company.assembleegameclient.util.TextureRedrawer;
import com.company.assembleegameclient.util._0B_c;
import com.company.assembleegameclient.util._J_H_;
import com.company.assembleegameclient.util._lJ_;
import com.company.ui.SimpleText;
import com.company.util.AssetLibrary;
import com.company.util.BitmapUtil;
import com.company.util.ConversionUtil;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;

public class _Q_y extends Sprite {

    public static const WIDTH:int = 756;
    public static const HEIGHT:int = 56;

    public function _Q_y(_arg1:Boolean, _arg2:int, _arg3:XML) {
        var _local5:XML;
        super();
        this.accountId_ = _arg3.@accountId;
        this.charId_ = _arg3.@charId;
        var _local4:uint = 0xFFFFFF;
        if (_arg1) {
            _local4 = 16564761;
        } else {
            if (_arg2 == 1) {
                _local4 = 16646031;
            }
        }
        this._30 = new SimpleText(22, _local4, false, 0, 0, "Myriad Pro");
        this._30.setBold(!((_arg2 == -1)));
        this._30.text = (((_arg2) == -1) ? "---" : (_arg2.toString() + "."));
        this._30._08S_();
        this._30.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
        this._30.x = (82 - this._30.width);
        this._30.y = ((HEIGHT / 2) - (this._30.height / 2));
        addChild(this._30);
        _local5 = ObjectLibrary._Q_F_[int(_arg3.ObjectType)];
        //var _local6:_lJ_ = _0B_c._J_v(String(_local5.AnimatedTexture.File), int(_local5.AnimatedTexture.Index));
        //var _local7:_J_H_ = _local6.imageFromDir(_lJ_.RIGHT, _lJ_._sS_, 0);
        var _local8:int = ((_arg3.hasOwnProperty("Tex1")) ? _arg3.Tex1 : 0);
        var _local9:int = ((_arg3.hasOwnProperty("Tex2")) ? _arg3.Tex2 : 0);
        var _skin:int = (_arg3.hasOwnProperty("Skin") ? _arg3.Skin : -1);
        var _local6:_lJ_;
        if (_skin == -1) {
            _local6 = _0B_c._J_v(String(_local5.AnimatedTexture.File), int(_local5.AnimatedTexture.Index));
        } else {
            var _skinx:XML = ObjectLibrary._Q_F_[_skin];
            if (_skinx == null) {
                _local6 = _0B_c._J_v(String(_local5.AnimatedTexture.File), int(_local5.AnimatedTexture.Index));
            } else {
                _local6 = _0B_c._J_v(String(_skinx.AnimatedTexture.File), int(_skinx.AnimatedTexture.Index));
            }
        }
        var _local7:_J_H_ = _local6.imageFromDir(_lJ_.RIGHT, _lJ_._sS_, 0);
        var _local10:BitmapData = TextureRedrawer.resize(_local7.image_, _local7.mask_, 100, false, _local8, _local9);
        _local10 = TextureRedrawer.outlineGlow(_local10, 0, 0);
        _local10 = BitmapUtil._Y_d(_local10, 6, 6, (_local10.width - 12), (_local10.height - 6));
        this.bitmap_ = new Bitmap(_local10);
        this.bitmap_.x = 104;
        this.bitmap_.y = (((HEIGHT / 2) - (this.bitmap_.height / 2)) - 2);
        addChild(this.bitmap_);
        this.nameText_ = new SimpleText(22, _local4, false, 0, 0, "Myriad Pro");
        this.nameText_.setBold(true);
        this.nameText_.text = _arg3.Name;
        this.nameText_._08S_();
        this.nameText_.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
        this.nameText_.x = 170;
        this.nameText_.y = ((HEIGHT / 2) - (this.nameText_.height / 2));
        addChild(this.nameText_);
        this._4N_ = ConversionUtil._04n(_arg3.Equipment);
        this._4N_.length = 4;
        var _local11:Vector.<int> = ConversionUtil._04n(_local5.SlotTypes);
        _local11.length = 4;
        this._e9 = new Inventory(null, null, "Inventory", _local11, 4, false);
        this._e9.x = 400;
        this._e9.y = ((HEIGHT / 2) - (Slot.HEIGHT / 2));
        addChild(this._e9);
        this._D_a = new SimpleText(22, _local4, false, 0, 0, "Myriad Pro");
        this._D_a.setBold(true);
        this._D_a.text = _arg3.TotalFame;
        this._D_a._08S_();
        this._D_a.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
        this._D_a.x = (660 - this._D_a.width);
        this._D_a.y = ((HEIGHT / 2) - (this._D_a.height / 2));
        addChild(this._D_a);
        var _local12:BitmapData = AssetLibrary._xK_("lofiObj3", 224);
        this._0H_ = new Bitmap(TextureRedrawer.redraw(_local12, 40, true, 0, 0));
        this._0H_.x = 652;
        this._0H_.y = ((HEIGHT / 2) - (this._0H_.height / 2));
        addChild(this._0H_);
        this.draw();
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
        addEventListener(MouseEvent.ROLL_OUT, this.onRollOut);
    }
    public var accountId_:int;
    public var charId_:int;
    private var _30:SimpleText;
    private var bitmap_:Bitmap;
    private var nameText_:SimpleText;
    private var _e9:Inventory;
    private var _D_a:SimpleText;
    private var _0H_:Bitmap;
    private var over_:Boolean = false;
    private var _4N_:Vector.<int>;

    private function draw():void {
        graphics.clear();
        graphics.beginFill(0, ((this.over_) ? 0.4 : 0.001));
        graphics.drawRect(0, 0, WIDTH, HEIGHT);
        graphics.endFill();
    }

    private function onAddedToStage(_arg1:Event):void {
        this._e9.draw(this._4N_);
    }

    private function onMouseOver(_arg1:MouseEvent):void {
        this.over_ = true;
        this.draw();
    }

    private function onRollOut(_arg1:MouseEvent):void {
        this.over_ = false;
        this.draw();
    }

}
}//package com.company.assembleegameclient.ui

