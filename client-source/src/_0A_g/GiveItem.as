// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0A_g.Teleport

package _0A_g {
  import flash.utils.IDataOutput;

  public class GiveItem extends _R_q {

    public function GiveItem(_arg1:uint) {
      super(_arg1);
    }
    public var itemType_:int;
    public var itemData_:Object;

    override public function writeToOutput(_arg1:IDataOutput):void {
      _arg1.writeInt(this.itemType_);
      _arg1.writeUTF(JSON.stringify(itemData_));
    }

    override public function toString():String {
      return (formatToString("GIVEITEM", "itemType_", "itemData_"));
    }

  }
}//package _0A_g
