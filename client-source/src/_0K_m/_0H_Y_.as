// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0K_m._0H_Y_

package _0K_m {

  import com.company.assembleegameclient.parameters.Parameters;

  public class _0H_Y_ {

    public static const _020:Object = {};

    public static function _nY_(_arg1:XML):void {
        var _local2:XML;
        for each (_local2 in _arg1.Particle) {
          if (!Parameters.data_["disableParticles"]) {
            _020[_local2.@id] = new _7g(_local2);
          }
        }
    }

}
}//package _0K_m

