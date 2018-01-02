// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_U_5._D_L_

package _U_5 {
import _sp._aJ_;

import _011.MapInfo;

public class _D_L_ extends _aJ_ {

    private static var instance:_D_L_;

    public static function getInstance():_D_L_ {
        if (!instance) {
            instance = new (_D_L_)();
        }
        return (instance);
    }

    public function _D_L_() {
        super(MapInfo);
        instance = this;
    }

}
}//package _U_5

