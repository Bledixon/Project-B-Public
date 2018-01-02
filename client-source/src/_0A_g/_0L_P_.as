// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0A_g._0L_P_

package _0A_g {
  import com.company.assembleegameclient.net.messages.data._Q_0;

  import flash.utils.IDataOutput;

  public class _0L_P_ extends _R_q {

    public function _0L_P_(_arg1:uint) {
      this.startingPos_ = new _Q_0();
      super(_arg1);
    }
    public var time_:int;
    public var bulletId_:uint;
    public var containerType_:int;
    public var startingPos_:_Q_0;
    public var angle_:Number;

    override public function writeToOutput(_arg1:IDataOutput):void {
      _arg1.writeInt(this.time_);
      _arg1.writeByte(this.bulletId_);
      _arg1.writeShort(this.containerType_);
      this.startingPos_.writeToOutput(_arg1);
      _arg1.writeFloat(this.angle_);
    }

    override public function toString():String {
      return (formatToString("PLAYERSHOOT", "time_", "bulletId_", "containerType_", "startingPos_", "angle_"));
    }

  }
}//package _0A_g


