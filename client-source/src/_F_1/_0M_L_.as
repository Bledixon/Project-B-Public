// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_F_1._0M_L_

package _F_1 {
import flash.display.Sprite;

import com.company.assembleegameclient.net.Server;

import flash.events.MouseEvent;

import com.company.assembleegameclient.parameters.Parameters;


public class _0M_L_ extends Sprite {

    public function _0M_L_(_arg1:Vector.<Server>) {
        var _local4:Server;
        this._break = new Vector.<_0D_k>();
        super();
        var _local2:_0D_k = new _0D_k(null);
        _local2.setSelected(true);
        _local2.x = ((_0D_k.WIDTH / 2) + 2);
        _local2.addEventListener(MouseEvent.MOUSE_DOWN, this.onMouseDown);
        addChild(_local2);
        this._break.push(_local2);
        var _local3:int = 2;
        for each (_local4 in _arg1) {
            _local2 = new _0D_k(_local4);
            if (_local4.name_ == Parameters.data_.preferredServer) {
                this.setSelected(_local2);
            }
            _local2.x = ((_local3 % 2) * (_0D_k.WIDTH + 4));
            _local2.y = (int((_local3 / 2)) * (_0D_k.HEIGHT + 4));
            _local2.addEventListener(MouseEvent.MOUSE_DOWN, this.onMouseDown);
            addChild(_local2);
            this._break.push(_local2);
            _local3++;
        }
    }
    private var _break:Vector.<_0D_k>;

    private function setSelected(_arg1:_0D_k):void {
        var _local2:_0D_k;
        for each (_local2 in this._break) {
            _local2.setSelected(false);
        }
        _arg1.setSelected(true);
    }

    private function onMouseDown(_arg1:MouseEvent):void {
        var _local2:_0D_k = (_arg1.target as _0D_k);
        this.setSelected(_local2);
        Parameters.data_.preferredServer = _local2.value_;
        Parameters.save();
    }

}
}//package _F_1

