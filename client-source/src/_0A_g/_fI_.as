// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0A_g._fI_

package _0A_g {
import com.company.assembleegameclient.net.messages.data._0_3;
import com.company.assembleegameclient.net.messages.data._Q_0;

import flash.utils.IDataOutput;

public class _fI_ extends _R_q {

    public function _fI_(_arg1:uint) {
        this.slotObject_ = new _0_3();
        this.itemUsePos_ = new _Q_0();
        super(_arg1);
    }
    public var time_:int;
    public var slotObject_:_0_3;
    public var itemUsePos_:_Q_0;

    override public function writeToOutput(_arg1:IDataOutput):void {
        _arg1.writeInt(this.time_);
        this.slotObject_.writeToOutput(_arg1);
        this.itemUsePos_.writeToOutput(_arg1);
    }

    override public function toString():String {
        return (formatToString("USEITEM", "slotObject_", "itemUsePos_"));
    }

}
}//package _0A_g

