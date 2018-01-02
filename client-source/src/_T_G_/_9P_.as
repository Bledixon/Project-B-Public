// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_T_G_._9P_

package _T_G_ {
import _E_x._K_T_;

public class _9P_ {

    protected var _0J_y:_K_T_;

    public function get _G_W_():_K_T_ {
        return (this._0J_y);
    }

    public function set _G_W_(_arg1:_K_T_):void {
        if (_arg1 !== this._0J_y) {
            this._0J_y = _arg1;
        }
    }

    public function get _U_H_():_K_T_ {
        if (!this._0J_y) {
            return (null);
        }
        var _local1:_K_T_ = this._0J_y;
        while (_local1.next) {
            _local1 = _local1.next;
        }
        return (_local1);
    }

    public function remove(_arg1:_K_T_):void {
        var _local2:_K_T_ = this._0J_y;
        if (_local2 == _arg1) {
            this._0J_y = _arg1.next;
        }
        while (_local2) {
            if (_local2.next == _arg1) {
                _local2.next = _arg1.next;
            }
            _local2 = _local2.next;
        }
    }

}
}//package _T_G_

