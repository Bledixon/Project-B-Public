// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_panels._X_i

package _panels {
import com.company.ui.SimpleText;
import com.company.assembleegameclient.ui._7f;

import flash.text.TextFieldAutoSize;
import flash.filters.DropShadowFilter;
import flash.events.MouseEvent;

import com.company.assembleegameclient.game.GameSprite;

public class _X_i extends Panel {

    public function _X_i(_arg1:GameSprite, _arg2:String, _arg3:String) {
        super(_arg1);
        this._P_V_ = new SimpleText(18, 0xFFFFFF, false, WIDTH, 0, "Myriad Pro");
        this._P_V_.setBold(true);
        this._P_V_.htmlText = (('<p align="center">' + _arg2) + "</p>");
        this._P_V_.wordWrap = true;
        this._P_V_.multiline = true;
        this._P_V_.autoSize = TextFieldAutoSize.CENTER;
        this._P_V_.filters = [new DropShadowFilter(0, 0, 0)];
        this._P_V_.y = 6;
        addChild(this._P_V_);
        this._ek = new _7f(16, _arg3);
        this._ek.addEventListener(MouseEvent.CLICK, this.onButtonClick);
        this._ek.x = ((WIDTH / 2) - (this._ek.width / 2));
        this._ek.y = ((HEIGHT - this._ek.height) - 4);
        addChild(this._ek);
    }
    protected var _ek:_7f;
    private var _P_V_:SimpleText;

    protected function onButtonClick(_arg1:MouseEvent):void {
    }

}
}//package _panels

