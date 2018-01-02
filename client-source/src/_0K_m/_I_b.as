// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0K_m._I_b

package _0K_m {

    import com.company.assembleegameclient.map._0D_v;
    import com.company.assembleegameclient.objects.GameObject;

    import flash.display.IGraphicsData;

    public class _I_b extends GameObject {

        public static function _Y_B_(_arg1:_D_J_, _arg2:GameObject):_I_b {
            switch (_arg1.id) {
                case "Healing":
                    return (new _4m(_arg2));
                case "Fountain":
                    return (new FountainEffect(_arg2));
                case "Gas":
                    return (new _B_B_(_arg2, _arg1));
                case "Vent":
                    return (new VentEffect(_arg2));
                case "Bubbles":
                    return (new _0G_P_(_arg2, _arg1));
                case "XMLEffect":
                    return (new XMLEffect(_arg2, _arg1));
                case "CustomParticles":
                    return (_en._rU_(_arg1, _arg2));
                case "CloudParticles":
                    var _local1:_en = _en._rU_(_arg1, _arg2);
                    _local1.cloud_ = true;
                    return _local1;
                case "Orbiting":
                    return (OrbitEffect._rU_(_arg1, _arg2));
            }
            return (null);
        }

        public function _I_b() {
            super(null);
            objectId_ = _7y();
            _P_m = false;
        }

        override public function update(_arg1:int, _arg2:int):Boolean {
            return (false);
        }

        override public function draw(_arg1:Vector.<IGraphicsData>, _arg2:_0D_v, _arg3:int):void {
        }

    }
}//package _0K_m

