// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0K_m._D_J_

package _0K_m {
    public class _D_J_ {

        public function _D_J_(_arg1:XML) {
            this.id = _arg1.toString();
            this.particle = _arg1.@particle;
            this.cooldown = _arg1.@cooldown;
            this.color = _arg1.@color;
            this.rate = ((_arg1.@rate) || (5));
            this.speed = ((_arg1.@speed) || (0));
            if(_arg1.hasOwnProperty("@speedVariance")) {
                this.speedVariance = _arg1.@speedVariance;
            } else {
                this.speedVariance = 0.5;
            }
            this.spread = ((_arg1.@spread) || (0));
            this.life = ((_arg1.@life) || (1));
            this.lifeVariance = ((_arg1.@lifeVariance) || (0));
            this.size = ((_arg1.@size) || (3));
            if(_arg1.hasOwnProperty("@rise")) {
                this.rise = _arg1.@rise;
            } else {
                this.rise = 3;
            }
            this.growth = ((_arg1.@growth) || (0));
            this.riseVariance = ((_arg1.@riseVariance) || (0));
            this.riseAcc = ((_arg1.@riseAcc) || (0));
            this.rangeX = ((_arg1.@rangeX) || (0));
            this.rangeY = ((_arg1.@rangeY) || (0));
            this.rangeZ = ((_arg1.@rangeZ) || (0));
            this.zOffset = ((_arg1.@zOffset) || (0));
            this.angleOffset = ((_arg1.@angleOffset) || (0));
            this.radius = ((_arg1.@radius) || (0));
            this.fadeOut = _arg1.hasOwnProperty("@fadeOut") ? _arg1.@fadeOut : -1;
            this.fadeIn = _arg1.hasOwnProperty("@fadeIn") ? _arg1.@fadeIn : -1;
            this.attached = _arg1.hasOwnProperty("@attached") ? _arg1.@attached : false;
            this.bitmapFile = _arg1.@bitmapFile;
            this.bitmapIndex = _arg1.@bitmapIndex;
            this.bitmapIndexMax = _arg1.hasOwnProperty("@bitmapIndexMax") ? _arg1.@bitmapIndexMax : -1;
        }
        public var id:String;
        public var particle:String;
        public var cooldown:Number;
        public var color:uint;
        public var rate:Number;
        public var speed:Number;
        public var speedVariance:Number;
        public var spread:Number;
        public var life:Number;
        public var lifeVariance:Number;
        public var size:int;
        public var _hX_:Number;
        public var rise:Number;
        public var growth:Number;
        public var riseVariance:Number;
        public var riseAcc:Number;
        public var rangeX:Number;
        public var rangeY:Number;
        public var rangeZ:Number;
        public var zOffset:Number;
        public var angleOffset:Number;
        public var radius:Number;
        public var fadeOut:Number;
        public var fadeIn:Number;
        public var attached:Boolean;
        public var bitmapFile:String;
        public var bitmapIndex:uint;
        public var bitmapIndexMax:Number;
    }
}//package _0K_m

