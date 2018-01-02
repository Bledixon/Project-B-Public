// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_sP_._07x

package _sP_ {
    import _0D_d.TextInput;

    import _sP_.MarketplaceEvent;

import com.company.assembleegameclient.parameters.Parameters;
import com.company.util._H_V_;

import flash.display.Sprite;

    import com.company.assembleegameclient.game.GameSprite;

    import _F_1._H_o;

    import flash.events.MouseEvent;
    import flash.events.Event;

    import com.company.assembleegameclient.objects.Player;

    import _9R_._J_F_;

    import _0L_C_._qO_;

    import flash.events.KeyboardEvent;
import flash.system.Capabilities;
    import flash.text.TextField;

    public class MarketplaceContainerUI extends Sprite {

        public function MarketplaceContainerUI(_arg1:GameSprite) {
            this.gs_ = _arg1;
            graphics.clear();
            graphics.beginFill(0x2B2B2B, 0.8);
            graphics.drawRect(0, 0, 800, 600);
            graphics.endFill();
            this._wk();
            //addChild(new ScreenGraphic());
            this._0Q_ = new _H_o("close", 36, false);
            this.newTrade_ = new _H_o("create", 22, false);
            this._0Q_.addEventListener(MouseEvent.CLICK, this._0B_Z_);
            this.newTrade_.addEventListener(MouseEvent.CLICK, this.create);
            addChild(this._0Q_);
            addChild(this.newTrade_);
            addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
            addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
        }
        private var gs_:GameSprite;
        private var _P_t: Marketplace;
        private var create_:MarketplaceCreate;
        private var _0Q_:_H_o;
        private var newTrade_:_H_o;
        private var category_:String = "all";

        private function _wk():void {
            this._P_t = new Marketplace(50, 0, this.gs_, this.category_);
            this._P_t.addEventListener(MarketplaceEvent.TRADE, this.onTrade);
            addChild(this._P_t);
        }

        private function _L_I_(_arg1:String):void {
            var _local2:_qO_ = new _qO_(_arg1, "Error", "Ok", null, "/marketError");
            _local2.addEventListener(_qO_.BUTTON1_EVENT, this._K__);
            stage.addChild(_local2);
        }

        private function _C_L_(_arg1:_J_F_):void {
            this.gs_.removeEventListener(_J_F_.market_, this._C_L_);
            if (!_arg1.success_) {
                this._L_I_(_arg1.errorText_);
            } else {
                this._wk();
            }
        }

        private function _X_s(_arg1:_J_F_):void {
            this.gs_.removeEventListener(_J_F_.market_, this._X_s);
            if (!_arg1.success_) {
                this._L_I_(_arg1.errorText_);
            } else {
                this._wk();
            }
        }

        private function _K__(_arg1:Event):void {
            var _local2:_qO_ = (_arg1.currentTarget as _qO_);
            stage.removeChild(_local2);
            this._wk();
        }

        private function _0B_Z_(_arg1:MouseEvent):void {
            this.close();
        }

        private function close():void {
            stage.focus = null;
            parent.removeChild(this);
        }

        private function onAddedToStage(_arg1:Event):void {
            stage;
            this._0Q_.x = ((800 / 2) - (this._0Q_.width / 2));
            this._0Q_.y = 526;
            this.newTrade_.x = this._0Q_.x + this._0Q_.width + 18;
            this.newTrade_.y = 535;
            stage.addEventListener(KeyboardEvent.KEY_DOWN, this._0A_Y_, false, 1);
            stage.addEventListener(KeyboardEvent.KEY_UP, this._H_H_, false, 1);
        }

        private function onRemovedFromStage(_arg1:Event):void {
            stage.removeEventListener(KeyboardEvent.KEY_DOWN, this._0A_Y_, false);
            stage.removeEventListener(KeyboardEvent.KEY_UP, this._H_H_, false);
        }

        private function _0A_Y_(_arg1:KeyboardEvent):void {
            if (_arg1.keyCode == Parameters.data_.marketHotkey && !(stage.focus is TextField)) {
                this.close();
            }
            _arg1.stopImmediatePropagation();
        }

        private function _H_H_(_arg1:KeyboardEvent):void {
            _arg1.stopImmediatePropagation();
        }

        private function onTrade(event:MarketplaceEvent):void {
            this.category_ = this._P_t.category_;
            this._P_t.removeEventListener(MarketplaceEvent.TRADE, this.onTrade);
            removeChild(this._P_t);
            this.gs_.gsc_.marketTrade(event.id_);
            this.gs_.addEventListener(_J_F_.market_, this._C_L_);
        }

        private function create(event:MouseEvent):void {
            if(this._P_t.visible == false) {
                if(this.create_ != null) {
                    removeChild(this.create_);
                    this.create_ = null;
                }
                this._P_t.visible = true;
                this._P_t.rebuild();
                this.newTrade_.setText("create");
            } else {
                this._P_t.visible = false;
                this.create_ = new MarketplaceCreate(this.gs_);
                addChild(this.create_);
                this.create_.addEventListener(MarketplaceEvent.CREATE, this.createTrade);
                this.newTrade_.setText("browse");
            }
        }

        private function search(event:MouseEvent):void {

        }

        private function createTrade(event:MarketplaceEvent):void {
            this.category_ = "mine";
            this.newTrade_.setText("create");
            this._P_t.removeEventListener(MarketplaceEvent.TRADE, this.onTrade);
            removeChild(this._P_t);
            this.create_.removeEventListener(MarketplaceEvent.CREATE, this.createTrade);
            removeChild(this.create_);
            this.gs_.gsc_.marketCreate(event.included_, event.requestItems_, event.requestData_);
            this.gs_.addEventListener(_J_F_.market_, this._C_L_);
        }
    }
}//package _sP_

