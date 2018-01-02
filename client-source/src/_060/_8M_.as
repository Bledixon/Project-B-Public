// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_060._8M_

package _060 {


public class _8M_ {

    public function _8M_() {
        this._kY_ = new Vector.<_P_2>();
        super();
    }
    private var _kY_:Vector.<_P_2>;

    public function _0D_J_():Boolean {
        return ((this._kY_.length == 0));
    }

    public function _0_h(_arg1:_P_2):void {
        this._kY_.push(_arg1);
    }

    public function execute():void {
        var _local1:_P_2;
        for each (_local1 in this._kY_) {
            _local1.execute();
        }
    }

    public function unexecute():void {
        var _local1:_P_2;
        for each (_local1 in this._kY_) {
            _local1.unexecute();
        }
    }

}
}//package _060

