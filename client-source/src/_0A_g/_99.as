// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0A_g._99

package _0A_g {
import com.company.assembleegameclient.net.messages.data._Q_0;
import com.company.assembleegameclient.net.messages.data._0_3;

import flash.utils.IDataOutput;

public class _99 extends _R_q {

    public function _99(_arg1:uint) {
        this.position_ = new _Q_0();
        this.slotObject1_ = new _0_3();
        this.slotObject2_ = new _0_3();
        super(_arg1);
    }
    public var time_:int;
    public var position_:_Q_0;
    public var slotObject1_:_0_3;
    public var slotObject2_:_0_3;

    override public function writeToOutput(_arg1:IDataOutput):void {
        _arg1.writeInt(this.time_);
        this.position_.writeToOutput(_arg1);
        this.slotObject1_.writeToOutput(_arg1);
        this.slotObject2_.writeToOutput(_arg1);
    }

    override public function toString():String {
        return (formatToString("INVSWAP", "time_", "position_", "slotObject1_", "slotObject2_"));
    }

}
}//package _0A_g

