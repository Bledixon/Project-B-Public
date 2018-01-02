// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_F_1.News

package _F_1 {
import flash.display.Sprite;

import com.company.assembleegameclient.appengine._vt;
import com.company.assembleegameclient.appengine.Server_list;


public class News extends Sprite {

    public function News(_arg1:Server_list, _arg2:int) {
        var _local2:_vt;
        this._dL_ = new Vector.<_0B_m>();
        super();
        for each (_local2 in _arg1._tZ_) {
            switch (_arg2) {
                case 1:
                    if (!_local2.isDeath()) {
                        this._yQ_(new _0B_m(_local2.getIcon(), _local2._O_k, _local2._03P_, _local2._qh, _local2._W_e, _arg1.accountId_, _arg2));
                    }
                    break;
                case 2:
                    if (_local2.isDeath()) {
                        this._yQ_(new _0B_m(_local2.getIcon(), _local2._O_k, _local2._03P_, _local2._qh, _local2._W_e, _arg1.accountId_, _arg2));
                        this._b = true;
                    }
                    break;
                default:
                    break;
            }
            if (_local2.isDeath()) {

            }
        }
    }
    public function isDeath():Boolean{
        return (this._b);
    }

    private var _dL_:Vector.<_0B_m>;
    private var _b:Boolean = false;

    public function _yQ_(_arg1:_0B_m):void {
        _arg1.y = (4 + (this._dL_.length * (_0B_m.HEIGHT + 4)));
        this._dL_.push(_arg1);
        addChild(_arg1);
    }

}
}//package _F_1

