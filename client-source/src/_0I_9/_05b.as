// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0I_9._05b

package _0I_9 {
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFormat;

public class _05b extends Sprite {

    private static const _0U_:String = ((('<p align="center"><font color="#FFFFFF">Play at: ' + '<br/></font><font color="#7777EE">') + '<a href="http://realm.kithio.com/">') + "realm.kithio.com</font></a></p>");

    public function _05b() {
        var _local1:TextField = new TextField();
        _local1.selectable = false;
        var _local2:TextFormat = new TextFormat();
        _local2.size = 20;
        _local1.defaultTextFormat = _local2;
        _local1.htmlText = _0U_;
        _local1.width = 800;
        _local1.y = ((600 / 2) - (_local1.height / 2));
        addChild(_local1);
    }
}
}//package _0I_9

