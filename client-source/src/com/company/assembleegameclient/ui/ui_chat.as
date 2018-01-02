// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.ui.ui_chat

package com.company.assembleegameclient.ui {

    import _sP_.MarketplaceContainerUI;

    import flash.display.Sprite;

    import com.company.assembleegameclient.game.GameSprite;

    import flash.text.TextField;
    import flash.utils.Timer;
    import flash.filters.GlowFilter;
    import flash.text.TextFormat;
    import flash.text.TextFieldType;
    import flash.events.KeyboardEvent;

    import com.company.assembleegameclient.parameters.Parameters;

    import flash.events.Event;
    import flash.utils.getTimer;
    import flash.events.TimerEvent;
    import flash.text.engine.TextLine;
    import flash.text.engine.TextBlock;

    import com.company.assembleegameclient.tutorial.doneAction;
    import com.company.assembleegameclient.tutorial.Tutorial;

    import flash.ui.Keyboard;

    public class ui_chat extends Sprite {

        private static const _0M_3:int = 7;
        private static const _wG_:int = 20000;
        private static const _0_c:int = 20;
        private static const _0M_F_:int = 16;
        private static const _3e:int = 0;
        private static const _v0:int = 4;
        public static var _0G_B_:Boolean = false;
        private static var _dL_:Vector.<ui_chat_colors> = new <ui_chat_colors>[];

        public function ui_chat(_arg1:GameSprite, _arg2:int, _arg3:int) {
            this._eU_ = [];
            this._T_U_ = new Timer(1000);
            super();
            this.gs_ = _arg1;
            this.w_ = _arg2;
            this.h_ = _arg3;
            this._01P_ = new Sprite();
            this._01P_.x = 2;
            this._01P_.filters = [new GlowFilter(0, 1, 3, 3, 2, 1)];
            addChild(this._01P_);
            var _local4:TextFormat = new TextFormat();
            _local4.font = "Myriad Pro";
            _local4.size = 14;
            _local4.color = 0xFFFFFF;
            _local4.bold = true;
            this._bn = new TextField();
            this._bn.embedFonts = true; // CHANGED - was true, changed to false so that text shows (there is a problem with embeded fonts)
            this._bn.defaultTextFormat = _local4;
            this._bn.type = TextFieldType.INPUT;
            this._bn.border = true;
            this._bn.borderColor = 0xFFFFFF;
            this._bn.maxChars = 320;
            this._bn.filters = [new GlowFilter(0, 1, 3, 3, 2, 1)];
            this._bn.addEventListener(KeyboardEvent.KEY_UP, this._0_e);
            this._bn.width = (this.w_ - 2);
            this._bn.height = 18;
            mouseEnabled = false;
            mouseChildren = false;
            this.addText(Parameters.SendClient, Parameters._02Q_());
            addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
            addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
        }
        public var _01P_:Sprite;
        private var gs_:GameSprite;
        private var w_:int;
        private var h_:int;
        private var _5D_:Number;
        private var _bn:TextField;
        private var _O_C_:Boolean = false;
        private var _zS_:int = 0;
        private var _eU_:Array;
        private var _bU_:int = 0;
        private var _T_U_:Timer;
        private var _num:Number;

        private var prevMsg:Array = ["", "", "", ""];
        private var msg_:int = 0;

        public function addText(_arg1:String, _arg2:String):void {
            var _local3:ui_chat_colors = new ui_chat_colors(getTimer(), _arg1, -1, -1, "", false, _arg2);
            _dL_.push(_local3);
            this._x5();
        }

        public function _ro(_arg1:String, _arg2:int, _arg3:int, _arg4:String, _arg5:String):void {
            var _local6:Boolean = ((!((_arg4 == ""))) && ((_arg1 == this.gs_.charList_.name_)));
            var _local7 = (_arg4 == this.gs_.charList_.name_);
            var _local8:ui_chat_colors = new ui_chat_colors(getTimer(), _arg1, _arg2, _arg3, _arg4, _local7, _arg5);
            _dL_.push(_local8);
            this._x5();
            if (_local7) {
                if ((((this._eU_.length == 0)) || (!((this._eU_[(this._eU_.length - 1)] == _arg1))))) {
                    this._eU_.push(_arg1);
                }
            } else {
                if (_arg4 != Parameters.SendGuild && _arg4 != Parameters.SendParty) {
                    if (_local6) {
                        if ((((this._eU_.length == 0)) || (!((this._eU_[(this._eU_.length - 1)] == _arg4))))) {
                            this._eU_.push(_arg4);
                        }
                    }
                }
            }
        }

        private function _01f():void {
            while (this._01P_.numChildren > 0) {
                this._01P_.removeChildAt(0);
            }
            this._01P_.graphics.clear();
            this._5D_ = 0;
        }

        private function _0C_v(_arg1:TextBlock):void {
            var _local4:Number;
            var _local2:Sprite = new Sprite();
            var _local3:TextLine;
            _local4 = 0;
            while ((_local3 = _arg1.createTextLine(_local3, (((_local4 == 0)) ? (this.w_ - 4) : ((this.w_ - 4) - _0_c))))) {
                _local3.x = (((_local4 == 0)) ? 0 : _0_c);
                _local3.y = (_local3.ascent + _local4);
                _local4 = (_local4 + Math.max(_0M_F_, _local3.height));
                _local2.addChild(_local3);
            }
            if (this._5D_ != 0) {
                this._5D_ = (this._5D_ + _v0);
            }
            _local2.y = this._5D_;
            this._01P_.addChild(_local2);
            this._5D_ = (this._5D_ + _local4);
        }

        private function _x5():void {
            var _local5:ui_chat_colors;
            var _local6:TextBlock;
            this._01f();
            var _local1:int = getTimer();
            var _local2:int = Math.max(0, (((_dL_.length - 1) - this._zS_) - _0M_3));
            var _local3:int = Math.min(_dL_.length, ((_local2 + _0M_3) + 1));
            var _local4:int = _local2;
            while (_local4 < _local3) {
                _local5 = _dL_[_local4];
                if (!((!(this._O_C_)) && ((_local1 > (_local5.time_ + 20000))))) {
                    _local6 = _local5._0H_u();
                    this._0C_v(_local6);
                }
                _local4++;
            }
            this._K_C_();
        }

        private function _2T_(_arg1:String):Boolean {
            if (_arg1 == "/?") {
                this.addText(Parameters.SendHelp, Parameters.HelpCommand);
                return true;
            } else if (_arg1 == "/market") {
                this.gs_.addChild(new MarketplaceContainerUI(this.gs_));
                return true;
            } else if (_arg1 == "/set") {
         //     this.gs_.addChild(new SetGiveContainerUI(this.gs_));
              return true;
            } else if (_arg1 == "/mscale") {
              //this.addText(Parameters("Map Scale: " + Parameters.data_.mscale, Par " - Usage: /mscale <any decimal number>.");
              return (true);
            };
              var _local3:Array = _arg1.match("/mscale (\\d*\\.*\\d+)$");
              if (_local3 != null)
              {
                Parameters.data_["mscale"] = _local3[1];
                Parameters.save();
                dispatchEvent(new Event(Event.RESIZE));
                this.addText(Parameters.SendHelp, ("Map Scale: " + _local3[1]));
                return (true);
              };
            return false;
        }

        private function _03z(_arg1:Boolean):void {
            this._bn.text = "/tell ";
            if (this._eU_.length != 0) {
                if (_arg1) {
                    this._bU_++;
                } else {
                    this._bU_--;
                }
                if (this._bU_ <= 0) {
                    this._bU_ = 0;
                }
                if (this._bU_ >= this._eU_.length) {
                    this._bU_ = (this._eU_.length - 1);
                }
                this._bn.appendText((this._eU_[this._bU_] + " "));
            }
            this._bn.setSelection(this._bn.length, this._bn.length);
        }

        private function _0C_X_():void {
            this._bn.type = TextFieldType.INPUT;
            this._bn.border = true;
            this._bn.borderColor = 0xFFFFFF;
            ui_chat._0G_B_ = true;
            addChild(this._bn);
            if (stage != null) {
                stage.focus = this._bn;
            }
            this._K_C_();
            this._bU_ = this._eU_.length;
        }

        private function _016():void {
            this.msg_ = 0;
            if (stage != null) {
                stage.focus = null;
            }
            if (contains(this._bn)) {
                ui_chat._0G_B_ = false;
                removeChild(this._bn);
            }
            this._K_C_();
        }

        private function _K_C_():void {
            if (contains(this._bn)) {
                this._01P_.y = (((this.h_ - 8) - this._bn.height) - this._5D_);
            } else {
                this._01P_.y = ((this.h_ - 4) - this._5D_);
            }
        }

        private function _kh(_arg1:TimerEvent):void {
            this._x5();
        }

        private function onAddedToStage(_arg1:Event):void {
            stage.addEventListener(KeyboardEvent.KEY_UP, this._H_H_);
            this._bn.y = (this.h_ - 20);
            this._K_C_();
            this._T_U_.addEventListener(TimerEvent.TIMER, this._kh);
            this._T_U_.start();
        }

        private function onRemovedFromStage(_arg1:Event):void {
            stage.removeEventListener(KeyboardEvent.KEY_UP, this._H_H_);
            this._T_U_.stop();
            this._T_U_.removeEventListener(TimerEvent.TIMER, this._kh);
        }

        private function _H_H_(_arg1:KeyboardEvent):void {
            switch (_arg1.keyCode) {
                case Parameters.data_.chatCommand:
                    if (stage.focus == null) {
                        this._0C_X_();
                        this._bn.text = "/";
                        this._bn.setSelection(this._bn.length, this._bn.length);
                    }
                    return;
                case Parameters.data_.chat:
                    if (stage.focus == null) {
                        this._0C_X_();
                    }
                    return;
                case Parameters.data_.tell:
                    if (stage.focus == null) {
                        this._0C_X_();
                    }
                    this._03z(_arg1.shiftKey);
                    return;
                case Parameters.data_.guildChat:
                    if (stage.focus == null) {
                        this._0C_X_();
                        this._bn.text = "/g ";
                        this._bn.setSelection(this._bn.length, this._bn.length);
                    }
                    return;
                case Parameters.data_.partyChat:
                    if (stage.focus == null) {
                        this._0C_X_();
                        this._bn.text = "/p ";
                        this._bn.setSelection(this._bn.length, this._bn.length);
                    }
                    return;
                case Parameters.data_.scrollChatUp:
                    if (!this._O_C_) {
                        this._O_C_ = true;
                    } else {
                        this._zS_ = Math.max(0, Math.min((_dL_.length - _0M_3), (this._zS_ + _0M_3)));
                    }
                    this._x5();
                    return;
                case Parameters.data_.scrollChatDown:
                    if (this._zS_ == 0) {
                        this._O_C_ = false;
                    } else {
                        this._zS_ = Math.max(0, (this._zS_ - _0M_3));
                    }
                    this._x5();
                    return;
            }
        }

        private function _0_e(_arg1:KeyboardEvent):void {
            switch (_arg1.keyCode) {
                case Keyboard.ENTER:
                    if (this._bn.text.length != 0) {
                        if (((!(this._2T_(this._bn.text))) && (!((this.gs_.map_.player_ == null))))) {
                            this.gs_.gsc_.playerText(this._bn.text);
                            doneAction(this.gs_, Tutorial._X_I_);
                        }
                        if (this.prevMsg[2] != null && this.prevMsg[3] != this.prevMsg[2] && this.prevMsg[2] != "") {
                            this.prevMsg[3] = this.prevMsg[2];
                        }
                        if (this.prevMsg[1] != null && this.prevMsg[2] != this.prevMsg[1] && this.prevMsg[1] != "") {
                            this.prevMsg[2] = this.prevMsg[1];
                        }
                        if (this.prevMsg[0] != null && this.prevMsg[1] != this.prevMsg[0] && this.prevMsg[0] != "") {
                            this.prevMsg[1] = this.prevMsg[0];
                        }
                        this.prevMsg[0] = this._bn.text;
                        this._bn.text = "";
                    }
                    this._016();
                    _arg1.stopImmediatePropagation();
                    return;
                case Keyboard.UP:
                    if (this.msg_ > 3) this.msg_ = 0;
                    if (this.prevMsg[this.msg_] != null && this.prevMsg[this.msg_] != "") {
                        if (this.gs_.map_.player_ != null) {
                            this._bn.text = this.prevMsg[this.msg_];
                            this._bn.setSelection(this._bn.length, this._bn.length);
                            this.msg_++;
                        }
                    } else {
                        this.msg_ = 0;
                        if (this.prevMsg[0] != null) {
                            if (this.gs_.map_.player_ != null) {
                                this._bn.text = this.prevMsg[0];
                                this._bn.setSelection(this._bn.length, this._bn.length);
                            }
                        }
                    }
            }
        }

    }
}//package com.company.assembleegameclient.ui

