// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0A_g._bG_

package _0A_g {
import com.company.assembleegameclient.net.messages.data._Q_0;

import flash.utils.IDataOutput;

public class _bG_ extends _R_q {

    public function _bG_(_arg1:uint) {
        this.position_ = new _Q_0();
        super(_arg1);
    }
    public var time_:int;
    public var position_:_Q_0;

    override public function writeToOutput(_arg1:IDataOutput):void {
        _arg1.writeInt(this.time_);
        this.position_.writeToOutput(_arg1);
    }

    override public function toString():String {
        return (formatToString("AOEACK", "time_", "position_"));
    }

}
}//package _0A_g

