/**
 * Created by Thelzar on 7/20/2014.
 */
package com.company.assembleegameclient.util {
import _S_K_._u1;

import _sp._aJ_;

import com.company.assembleegameclient.game.GameSprite;

import com.company.assembleegameclient.objects.ObjectLibrary;

import com.company.assembleegameclient.objects.SellableObject;
import com.company.assembleegameclient.ui._u5;
import com.company.ui.SimpleText;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormatAlign;

public class Modal extends Sprite {

    public static const WIDTH:int = 280;
    public static const HEIGH:int = 185;
    public static var isClosed:Boolean = true;

    private const closeButton:_str152 = ObjectLibrary._str2799(Modal.WIDTH);
    private const buyButton:_u5 = new _u5("Buy for ", 16, 0, Currency.INVALID);

    private var _str8496:_u1;
    private var object:SellableObject;
    public var event:_aJ_;
    public var open:Boolean;
    public var _str8497:int;

    public var gs_:GameSprite;

    public function Modal(_arg1:_aJ_, _arg2:SellableObject, _arg3:Number, _arg4:GameSprite) {
        Modal.isClosed = false;
        this.event = _arg1;
        this.object = _arg2;
        this._str8497 = _arg3;
        this.gs_ = _arg4;
        this.events();
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
        this._str4865();
        this._str1776();
        this.buyButton.setPrice(this.object.price_, this.object.currency_);
        var _local4:String = this.object.soldObjectName();
        addChild(this._str2928("Confirm Purchase", 20, 5, 0x57AD62));
        addChild(this._str2928("Are you sure that you want to buy this item?", 20, 40, 0xFFFFFF));
        addChild(this._str2928(_local4, 20, 100, 0xFFFFFF));
        this.open = true;
    }
    private static function makeModalBackground(_arg1, _arg2):ModalBackground{
        var _local3:ModalBackground = new ModalBackground();
        _local3.draw(_arg1, _arg2);
        _local3._str2638("HORIZONTAL_DIVISION", 30);
        return (_local3);
    }

    public function _str2928(_arg1:String, _arg2:int, _arg3:int, _arg4:uint):SimpleText{
        var _local4:SimpleText;
        _local4 = new SimpleText(16, _arg4, false, (WIDTH - (20 * 2)), (WIDTH - (20 * 2)), "Myriad Pro");
        _local4.text = _arg1;
        _local4.setBold(true);
        _local4.wordWrap = true;
        _local4.multiline = true;
        _local4.autoSize = TextFieldAutoSize.CENTER;
        _local4.setAlign(TextFormatAlign.CENTER);
        _local4.filters = [new DropShadowFilter(0, 0, 0)];
        _local4.x = _arg2;
        _local4.y = _arg3;
        return (_local4);
    }
    private function _str4865():void{
        var _local2:int;
        var _local1 = -300;
        _local2 = -200;
        this.x = (_local1 + ((-1 * Modal.WIDTH) * 0.5));
        this.y = (_local2 + ((-1 * Modal.HEIGH) * 0.5));
        this.buyButton.x = (this.buyButton.x + 35);
        this.buyButton.y = (this.buyButton.y + 142);
        this.buyButton.x = ((WIDTH / 2) - (this._str8497 / 2));
    }
    private function events():void{
        this.closeButton.event.add(this.onCloseClick);
        this._str8496 = new _u1(this.buyButton, MouseEvent.CLICK, MouseEvent);
        this._str8496.add(this._str8498);;
    }
    private function _str1776():void{
        addChild(makeModalBackground(Modal.WIDTH, Modal.HEIGH));
        addChild(this.closeButton);
        addChild(this.buyButton);
    }
    public function onCloseClick():void{
        this.close();
    }
    public function _str8498(_arg1:MouseEvent):void{
        gs_.gsc_.buy(this.object.objectId_);
        //this.event.dispatch(this.object);
        this.close();
    }
    private function close():void{
        Modal.isClosed = true;
        this.open = false;
        stage.focus = null;
        parent.removeChild(this);
    }
    private function onRemovedFromStage(_arg1:Event):void{
        Modal.isClosed = true;
        this.open = false;
    }
}
}
