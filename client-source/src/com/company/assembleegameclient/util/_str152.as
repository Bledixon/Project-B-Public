/**
 * Created by Thelzar on 7/20/2014.
 */
package com.company.assembleegameclient.util {
import _sp._aJ_;

import flash.display.Sprite;
import flash.events.MouseEvent;

import zerorealms.rotmg.assets.EmbeddedAssets_btnEmbed_;

public class _str152 extends Sprite {

    public static var _str2539:Class = EmbeddedAssets_btnEmbed_;

    public const event:_aJ_ = new _aJ_();

    public var disabled:Boolean = false;

    public function _str152() {
        addChild(new _str2539());
        buttonMode = true;
        addEventListener(MouseEvent.CLICK, this.onButtonClick);
    }
    public function disable():void{
        this.disabled = true;
        removeEventListener(MouseEvent.CLICK, this.onButtonClick);
    }
    private function onButtonClick(_arg1:MouseEvent):void{
        if (!this.disabled) {
            this.event.dispatch();
            removeEventListener(MouseEvent.CLICK, this.onButtonClick);
        }
    }
}
}
