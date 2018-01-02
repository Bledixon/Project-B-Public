package _0A_g {
import flash.utils.IDataOutput;

public class MarketTrade extends _R_q {

    public function MarketTrade(_arg1:uint) {
        super(_arg1);
    }

    public var tradeId_:int;

    override public function writeToOutput(_arg1:IDataOutput):void {
        _arg1.writeInt(this.tradeId_);
    }

    override public function toString():String {
        return formatToString("MARKETTRADE", "tradeId_");
    }
}
}
