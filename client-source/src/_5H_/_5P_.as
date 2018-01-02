// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_5H_._5P_

package _5H_ {


public class _5P_ {

    public function _5P_(_arg1:Vector.<_xY_>) {
        this._05t = _arg1;
    }
    private var _05t:Vector.<_xY_>;
    private var selected:_xY_;

    public function setSelected(_arg1:String):void {
        var _local2:_xY_;
        for each (_local2 in this._05t) {
            if (_local2.getValue() == _arg1) {
                this._0H_V_(_local2);
                return;
            }
        }
    }

    public function _rq():_xY_ {
        return (this.selected);
    }

    private function _0H_V_(_arg1:_xY_):void {
        if (this.selected != null) {
            this.selected.setSelected(false);
        }
        this.selected = _arg1;
        this.selected.setSelected(true);
    }

}
}//package _5H_

