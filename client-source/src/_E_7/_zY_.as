// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_E_7._zY_

package _E_7 {

import com.company.assembleegameclient.objects.Player;
import com.company.assembleegameclient.ui.ui_playerslist;
import com.company.ui.SimpleText;

import flash.filters.DropShadowFilter;


public class _zY_ extends _for_ {

    public function _zY_(_arg1:Vector.<Player>, _arg2:Boolean = true) {
        this._o2 = new Vector.<ui_playerslist>();
        super(0x2A2A2A, 0.5, 0xFFFFFF, 1, _arg2);
        this._xi = new SimpleText(12, 0xB3B3B3, false, 0, 0, "Myriad Pro");
        this._xi.text = "(Click to open menu)";
        this._xi.updateMetrics();
        this._xi.filters = [new DropShadowFilter(0, 0, 0)];
        addChild(this._xi);
        this._09B_(_arg1);
        if (!_arg2) {
            filters = [];
        }
    }
    public var _nC_:Vector.<Player> = null;
    private var _o2:Vector.<ui_playerslist>;
    private var _xi:SimpleText;

    public function _09B_(_arg1:Vector.<Player>):void {
        var _local3:Player;
        var _local4:ui_playerslist;
        this.clear();
        this._nC_ = _arg1.slice();
        if ((((this._nC_ == null)) || ((this._nC_.length == 0)))) {
            return;
        }
        var _local2:int;
        for each (_local3 in _arg1) {
            _local4 = new ui_playerslist(0xB3B3B3, true, _local3);
            _local4.x = 0;
            _local4.y = _local2;
            addChild(_local4);
            this._o2.push(_local4);
            _local2 = (_local2 + 32);
        }
        this._xi.x = ((width / 2) - (this._xi.width / 2));
        this._xi.y = _local2;
        draw();
    }

    private function clear():void {
        var _local1:ui_playerslist;
        graphics.clear();
        for each (_local1 in this._o2) {
            removeChild(_local1);
        }
        this._o2.length = 0;
    }

}
}//package _E_7

