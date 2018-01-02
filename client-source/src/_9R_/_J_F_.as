// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_9R_._J_F_

package _9R_ {
    import flash.events.Event;

    public class _J_F_ extends Event {

        public static const _hx:String = "GUILDRESULTEVENT";
        public static const market_:String = "MARKETRESULTEVENT";

        public function _J_F_(_arg1:Boolean, _arg2:String, _arg3:String="GUILDRESULTEVENT") {
            super(_arg3);
            this.success_ = _arg1;
            this.errorText_ = _arg2;
        }
        public var success_:Boolean;
        public var errorText_:String;

    }
}//package _9R_

