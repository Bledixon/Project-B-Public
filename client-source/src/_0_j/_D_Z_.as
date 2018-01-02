// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0_j._D_Z_

package _0_j {


public class _D_Z_ {

    public static const INVALID:int = 0;
    public static const _04B_:int = 1;
    public static const _tA_:int = 2;
    public static const _U_a:int = 3;
    public static const _yX_:int = 4;
    public static const _xU_:int = 5;
    public static const _each:int = 6;
    public static const _00i:int = 7;
    public static const _E_M_:Vector.<_D_Z_> = new <_D_Z_>[new _D_Z_("Any Type", ""), new _D_Z_("Character", "(e.g. humans, orcs, slimes, etc.)"), new _D_Z_("Item", "(e.g. swords, armor, rings, etc.)"), new _D_Z_("Environment", "(e.g. trees, rocks, portals, etc.)"), new _D_Z_("Projectile", "(e.g. arrows, magic bolts, etc.)"), new _D_Z_("Textile", "(clothing for players)"), new _D_Z_("Interface", "(e.g. icons, etc.)"), new _D_Z_("Miscellaneous", "(anything else)")];

    public static function _07n(_arg1:String):int {
        var _local2:int;
        while (_local2 < _E_M_.length) {
            if (_E_M_[_local2].name_ == _arg1) {
                return (_local2);
            }
            _local2++;
        }
        return (INVALID);
    }

    public function _D_Z_(_arg1:String, _arg2:String) {
        this.name_ = _arg1;
        this.examples_ = _arg2;
    }
    public var name_:String;
    public var examples_:String;

}
}//package _0_j

