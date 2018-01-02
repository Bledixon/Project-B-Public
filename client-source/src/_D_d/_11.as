// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_D_d._11

package _D_d {


public class _11 {

    public function _11() {
        this._5F_ = new <int>[-1, -1, -1];
        super();
    }
    public var _5F_:Vector.<int>;
    public var _fi:String = null;

    public function clone():_11 {
        var _local1:_11 = new _11();
        _local1._5F_ = this._5F_.concat();
        _local1._fi = this._fi;
        return (_local1);
    }

    public function isEmpty():Boolean {
        var _local1:int;
        while (_local1 < _M_u._0G_D_) {
            if (this._5F_[_local1] != -1) {
                return (false);
            }
            _local1++;
        }
        return (true);
    }

}
}//package _D_d

