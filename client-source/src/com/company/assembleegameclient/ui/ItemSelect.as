// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.ui._zg

package com.company.assembleegameclient.ui {
    import _011.ItemSelectStart;

    import flash.display.Sprite;

    import com.company.assembleegameclient.game.GameSprite;

    import flash.events.Event;
    import flash.events.MouseEvent;


    public class ItemSelect extends Sprite {

        public static const WIDTH:int = 200;
        public static const HEIGHT:int = 400;

        public function ItemSelect(_arg1:GameSprite, _arg2:ItemSelectStart) {
            this.gs_ = _arg1;
            this._rl = new _ec(_arg1, "", _arg2.myItems_, true);
            this._rl.x = 14;
            this._rl.addEventListener(Event.CHANGE, this.changeSelection);
            addChild(this._rl);
            this._t3 = new _7f(16, "Cancel", 80);
            this._t3.addEventListener(MouseEvent.CLICK, this._0G_U_);
            this._t3.x = ((WIDTH / 4) - (this._t3.width / 2));
            this._t3.y = this._rl.y + this._rl.height + 5;
            addChild(this._t3);
            this._0A_C_ = new _7f(16, "Select", 80);
            this._0A_C_._A_w(false);
            this._0A_C_.addEventListener(MouseEvent.CLICK, this._nk);
            this._0A_C_.x = (((3 * WIDTH) / 4) - (this._0A_C_.width / 2));
            this._0A_C_.y = this._rl.y + this._rl.height + 5;
            addChild(this._0A_C_);
        }
        public var gs_:GameSprite;
        private var _rl:_ec;
        private var _t3:_7f;
        private var _0A_C_:_7f;

        private function changeSelection(_arg1:Event):void {
            if(this._rl.selected_ == null) {
                this._0A_C_._A_w(false);
            } else {
                this._0A_C_._A_w(true);
            }
        }

        private function _0G_U_(_arg1:MouseEvent):void {
            dispatchEvent(new Event(Event.CANCEL));
        }

        private function _nk(_arg1:MouseEvent):void {
            this.gs_.gsc_.selectItem(this._rl._ao());
        }

    }
}//package com.company.assembleegameclient.ui

