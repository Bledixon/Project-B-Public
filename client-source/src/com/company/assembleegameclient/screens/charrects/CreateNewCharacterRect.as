// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.screens.charrects.CreateNewCharacterRect

package com.company.assembleegameclient.screens.charrects {
import com.company.assembleegameclient.appengine.Server_list;

import flash.display.Bitmap;

import com.company.ui.SimpleText;

import flash.display.Sprite;

import _sp._aJ_;

import com.company.assembleegameclient.objects.ObjectLibrary;
import com.company.assembleegameclient.appengine.SavedCharacter;
import com.company.assembleegameclient.util._lJ_;

import flash.display.BitmapData;

import com.company.util.BitmapUtil;

import flash.filters.DropShadowFilter;

import com.company.assembleegameclient.util._Z_B_;
import com.company.rotmg.graphics.StarGraphic;

import flash.geom.ColorTransform;

public class CreateNewCharacterRect extends CharacterRect {

    public function CreateNewCharacterRect(_arg1:Server_list) {
        super(0x4C4C4C, 0x606060);
        this.charList_ = _arg1;
        var _local2:XML = ObjectLibrary._tj[int((ObjectLibrary._tj.length * Math.random()))];
        var _local3:BitmapData = SavedCharacter.getImage(null, _local2, _lJ_.RIGHT, _lJ_._sS_, 0, false, false);
        _local3 = BitmapUtil._Y_d(_local3, 6, 6, (_local3.width - 12), (_local3.height - 6));
        this.bitmap_ = new Bitmap();
        this.bitmap_.bitmapData = _local3;
        this.bitmap_.x = 0;
        addChild(this.bitmap_);
        this.classNameText_ = new SimpleText(18, 0xFFFFFF, false, 0, 0, "Myriad Pro");
        this.classNameText_.setBold(true);
        this.classNameText_.text = "New Character";
        this.classNameText_.updateMetrics();
        this.classNameText_.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
        this.classNameText_.x = 58;
        addChild(this.classNameText_);
        if (this.charList_.numStars_ != _Z_B_._5e()) {
            this.taglineIcon_ = new StarGraphic();
            this.taglineIcon_.transform.colorTransform = new ColorTransform((179 / 0xFF), (179 / 0xFF), (179 / 0xFF));
            this.taglineIcon_.scaleX = 1.2;
            this.taglineIcon_.scaleY = 1.2;
            this.taglineIcon_.x = 58;
            this.taglineIcon_.y = 26;
            this.taglineIcon_.filters = [new DropShadowFilter(0, 0, 0)];
            addChild(this.taglineIcon_);
            this.taglineText_ = new SimpleText(14, 0xB3B3B3, false, 0, 0, "Myriad Pro");
            this.taglineText_.text = ((_Z_B_._5e() - this.charList_.numStars_) + " Class quests not yet completed");
            this.taglineText_.updateMetrics();
            this.taglineText_.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
            this.taglineText_.x = ((58 + this.taglineIcon_.width) + 2);
            this.taglineText_.y = 24;
            addChild(this.taglineText_);
        }
    }
    public var newCharacter:_aJ_;
    private var charList_:Server_list;
    private var bitmap_:Bitmap;
    private var classNameText_:SimpleText;
    private var taglineIcon_:Sprite;
    private var taglineText_:SimpleText;
}
}//package com.company.assembleegameclient.screens.charrects

