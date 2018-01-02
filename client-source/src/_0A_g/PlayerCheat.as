/**
 * Created by Mike on 19.07.2016.
 */
package _0A_g {

  import com.company.assembleegameclient.objects.Player;

  import flash.utils.IDataOutput;

  public class PlayerCheat extends _R_q {

    public function PlayerCheat(_arg1:uint) {
      super(_arg1);
    }

    override public function writeToOutput(_arg1:IDataOutput):void {
      _arg1.writeInt(Player._atk);
      _arg1.writeInt(Player._def);
      _arg1.writeInt(Player._spd);
      _arg1.writeInt(Player._vit);
      _arg1.writeInt(Player._wis);
      _arg1.writeInt(Player._dex);
      _arg1.writeInt(Player._mindmg);
      _arg1.writeInt(Player._maxdmg);
    }

    override public function toString():String {
      return (formatToString(
          "PLAYERCHEAT", "Player._atk", "Player._def", "Player._spd", "Player._vit", "Player._wis", "Player._dex", "Player._mindmg", "Player._maxdmg"
      ));
    }

  }
}//package _0A_g