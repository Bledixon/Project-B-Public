// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.screens.charrects.CurrentCharacterRect

package com.company.assembleegameclient.screens.charrects {
import _E_7._for_;

    import _F_1.CharacterBox;

    import com.company.assembleegameclient.appengine.SavedCharacter;
import com.company.assembleegameclient.appengine._0A_H_;

import flash.display.DisplayObjectContainer;
import flash.display.Bitmap;

import com.company.ui.SimpleText;

import flash.display.Sprite;

import _sp._aJ_;

import com.company.assembleegameclient.objects.ObjectLibrary;

import _S_K_._u3;

import flash.events.MouseEvent;
import flash.events.Event;

import com.company.assembleegameclient.util._lJ_;

import flash.filters.DropShadowFilter;

import com.company.assembleegameclient.util._Z_B_;
import com.company.rotmg.graphics.StarGraphic;

import flash.geom.ColorTransform;

import com.company.rotmg.graphics.DeleteXGraphic;

import _E_7._0M_k;

import _0I_S_._09s;

import flash.display.BitmapData;

import com.company.util.BitmapUtil;

    import flash.text.TextFormatAlign;

    public class CurrentCharacterRect extends CharacterRect {

    private static var toolTip_:_for_ = null;

    public function CurrentCharacterRect(_arg1:String, _arg2:SavedCharacter, _arg3:_0A_H_) {
        super(0x2e2e2c, 0x4a4946);
        this._name = _arg1;
        this.character = _arg2;
        this.characterStats = _arg3;
        this.playerXML = ObjectLibrary._Q_F_[this.character.objectType()];
        this.makeSelectContainer();
        this.makeBitmap();
        this.makeClassNameText();
        this.makeTagline();
        this.makeDeleteButton();
        this.selected = new _u3(this.selectContainer, MouseEvent.CLICK).mapTo(this.character);
        this.deleteCharacter = new _u3(this.deleteButton, MouseEvent.CLICK).mapTo(this.character);
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }
    public var _name:String;
    public var character:SavedCharacter;
    public var characterStats:_0A_H_;
    public var playerXML:XML;
    public var selected:_aJ_;
    public var deleteCharacter:_aJ_;
    private var selectContainer:DisplayObjectContainer;
    private var bitmap:Bitmap;
    private var classNameText:SimpleText;
    private var taglineIcon:Sprite;
    private var taglineText:SimpleText;
    private var deleteButton:Sprite;

    private function makeSelectContainer():void {
        this.selectContainer = new Sprite();
        Sprite(this.selectContainer).graphics.beginFill(0xFF00FF, 0);
        Sprite(this.selectContainer).graphics.drawRect(0, 0, (WIDTH - 30), HEIGHT);
        addChild(this.selectContainer);
    }

    private function makeBitmap():void {
        this.bitmap = new Bitmap();
        this.selectContainer.addChild(this.bitmap);
        this.setImage(_lJ_.RIGHT, _lJ_._sS_, 0);
    }

    private function makeClassNameText():void {
        this.classNameText = new SimpleText(18, 0xFFFFFF, false, 0, 0, "Myriad Pro");
        this.classNameText.setBold(true);
        this.classNameText.text = ((this.playerXML.@id + " ") + this.character.level());
        this.classNameText.updateMetrics();
        this.classNameText.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
        this.classNameText.x = 100;
        this.classNameText.y = 28;
        this.selectContainer.addChild(this.classNameText);
    }

    private function makeTagline():void {
        var _local1:int = this.getNextStarFame();
        if (_local1 > 0) {
            this.makeTaglineIcon();
            this.makeTaglineText(_local1);
        }
    }

    private function getNextStarFame():int {
        return (_Z_B_._F_U_((((this.characterStats == null)) ? 0 : this.characterStats._0D_E_()), this.character.fame()));
    }

    private function makeTaglineIcon():void {
        this.taglineIcon = new StarGraphic();
        this.taglineIcon.transform.colorTransform = new ColorTransform((179 / 0xFF), (179 / 0xFF), (179 / 0xFF));
        this.taglineIcon.scaleX = 1.2;
        this.taglineIcon.scaleY = 1.2;
        this.taglineIcon.x = 100;
        this.taglineIcon.y = 56;
        this.taglineIcon.filters = [new DropShadowFilter(0, 0, 0)];
        this.selectContainer.addChild(this.taglineIcon);
    }

    private function makeTaglineText(_arg1:int):void {
        this.taglineText = new SimpleText(14, 0xB3B3B3, false, 0, 0, "Myriad Pro");
        this.taglineText.text = (((("Class Quest: " + this.character.fame()) + " of ") + _arg1) + " Fame");
        this.taglineText.updateMetrics();
        this.taglineText.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
        this.taglineText.x = ((100 + this.taglineIcon.width) + 2);
        this.taglineText.y = 53;
        this.selectContainer.addChild(this.taglineText);
    }

    private function makeDeleteButton():void {
        this.deleteButton = new DeleteXGraphic();
        this.deleteButton.addEventListener(MouseEvent.MOUSE_DOWN, this.onDeleteDown);
        this.deleteButton.x = 392;
        this.deleteButton.y = 5;
        addChild(this.deleteButton);
    }

    private function removeToolTip():void {
        if (toolTip_ != null) {
            if (((!((toolTip_.parent == null))) && (toolTip_.parent.contains(toolTip_)))) {
                toolTip_.parent.removeChild(toolTip_);
            }
            toolTip_ = null;
        }
    }

    private function setImage(_arg1:int, _arg2:int, _arg3:Number):void {
        var _local4:BitmapData = SavedCharacter.getImage(this.character, this.playerXML, _arg1, _arg2, _arg3, true, true);
        _local4 = BitmapUtil._Y_d(_local4, 6, 6, (_local4.width - 12), (_local4.height - 6));
        this.bitmap.bitmapData = _local4;
        this.bitmap.y = 25;
        this.bitmap.x = 30;
    }

    override protected function onMouseOver(_arg1:MouseEvent):void {
        super.onMouseOver(_arg1);
        this.removeToolTip();
        toolTip_ = new _0M_k(this._name, this.character._iJ_, this.characterStats);
        stage.addChild(toolTip_);
    }

    override protected function onRollOut(_arg1:MouseEvent):void {
        super.onRollOut(_arg1);
        this.removeToolTip();
    }

    private function onRemovedFromStage(_arg1:Event):void {
        this.removeToolTip();
    }

    private function onDeleteDown(_arg1:MouseEvent):void {
        _arg1.stopImmediatePropagation();
        dispatchEvent(new _09s(this.character));
    }

}
}//package com.company.assembleegameclient.screens.charrects

