// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_Z_6._0A_r

package _Z_6 {
public class _0A_r {

    public function _0A_r(_arg1:String) {
        this._G_U_ = _arg1;
        this._H_Y_ = 0;
        this._0J_L_();
    }
    private var _f4:Object;
    private var _G_U_:String;
    private var _H_Y_:int;
    private var ch:String;

    public function _0A_4():_uL_ {
        var _local2:String;
        var _local3:String;
        var _local4:String;
        var _local1:_uL_ = new _uL_();
        this._N_j();
        switch (this.ch) {
            case "{":
                _local1.type_ = _L_t._B_a;
                _local1.value = "{";
                this._0J_L_();
                break;
            case "}":
                _local1.type_ = _L_t._K_B_;
                _local1.value = "}";
                this._0J_L_();
                break;
            case "[":
                _local1.type_ = _L_t._0B_5;
                _local1.value = "[";
                this._0J_L_();
                break;
            case "]":
                _local1.type_ = _L_t._0M_B_;
                _local1.value = "]";
                this._0J_L_();
                break;
            case ",":
                _local1.type_ = _L_t._gX_;
                _local1.value = ",";
                this._0J_L_();
                break;
            case ":":
                _local1.type_ = _L_t._bT_;
                _local1.value = ":";
                this._0J_L_();
                break;
            case "t":
                _local2 = ((("t" + this._0J_L_()) + this._0J_L_()) + this._0J_L_());
                if (_local2 == "true") {
                    _local1.type_ = _L_t._W_F_;
                    _local1.value = true;
                    this._0J_L_();
                } else {
                    this._L_R_(("Expecting 'true' but found " + _local2));
                }
                break;
            case "f":
                _local3 = (((("f" + this._0J_L_()) + this._0J_L_()) + this._0J_L_()) + this._0J_L_());
                if (_local3 == "false") {
                    _local1.type_ = _L_t._8;
                    _local1.value = false;
                    this._0J_L_();
                } else {
                    this._L_R_(("Expecting 'false' but found " + _local3));
                }
                break;
            case "n":
                _local4 = ((("n" + this._0J_L_()) + this._0J_L_()) + this._0J_L_());
                if (_local4 == "null") {
                    _local1.type_ = _L_t._0C_I_;
                    _local1.value = null;
                    this._0J_L_();
                } else {
                    this._L_R_(("Expecting 'null' but found " + _local4));
                }
                break;
            case '"':
                _local1 = this._0M_7();
                break;
            default:
                if (((this._mJ_(this.ch)) || ((this.ch == "-")))) {
                    _local1 = this._B_m();
                } else {
                    if (this.ch == "") {
                        return (null);
                    }
                    this._L_R_((("Unexpected " + this.ch) + " encountered"));
                }
        }
        return (_local1);
    }

    public function _L_R_(_arg1:String):void {
        throw (new JSONParseError(_arg1, this._H_Y_, this._G_U_));
    }

    private function _0M_7():_uL_ {
        var _local3:String;
        var _local4:int;
        var _local1:_uL_ = new _uL_();
        _local1.type_ = _L_t._F_v;
        var _local2 = "";
        this._0J_L_();
        while (((!((this.ch == '"'))) && (!((this.ch == ""))))) {
            if (this.ch == "\\") {
                this._0J_L_();
                switch (this.ch) {
                    case '"':
                        _local2 = (_local2 + '"');
                        break;
                    case "/":
                        _local2 = (_local2 + "/");
                        break;
                    case "\\":
                        _local2 = (_local2 + "\\");
                        break;
                    case "b":
                        _local2 = (_local2 + "\b");
                        break;
                    case "f":
                        _local2 = (_local2 + "\f");
                        break;
                    case "n":
                        _local2 = (_local2 + "\n");
                        break;
                    case "r":
                        _local2 = (_local2 + "\r");
                        break;
                    case "t":
                        _local2 = (_local2 + "\t");
                        break;
                    case "u":
                        _local3 = "";
                        _local4 = 0;
                        while (_local4 < 4) {
                            if (!this._o5(this._0J_L_())) {
                                this._L_R_((" Excepted a hex digit, but found: " + this.ch));
                            }
                            _local3 = (_local3 + this.ch);
                            _local4++;
                        }
                        _local2 = (_local2 + String.fromCharCode(parseInt(_local3, 16)));
                        break;
                    default:
                        _local2 = (_local2 + ("\\" + this.ch));
                }
            } else {
                _local2 = (_local2 + this.ch);
            }
            this._0J_L_();
        }
        if (this.ch == "") {
            this._L_R_("Unterminated string literal");
        }
        this._0J_L_();
        _local1.value = _local2;
        return (_local1);
    }

    private function _B_m():_uL_ {
        var _local1:_uL_ = new _uL_();
        _local1.type_ = _L_t._0_M_;
        var _local2 = "";
        if (this.ch == "-") {
            _local2 = (_local2 + "-");
            this._0J_L_();
        }
        if (!this._mJ_(this.ch)) {
            this._L_R_("Expecting a digit");
        }
        if (this.ch == "0") {
            _local2 = (_local2 + this.ch);
            this._0J_L_();
            if (this._mJ_(this.ch)) {
                this._L_R_("A digit cannot immediately follow 0");
            }
        } else {
            while (this._mJ_(this.ch)) {
                _local2 = (_local2 + this.ch);
                this._0J_L_();
            }
        }
        if (this.ch == ".") {
            _local2 = (_local2 + ".");
            this._0J_L_();
            if (!this._mJ_(this.ch)) {
                this._L_R_("Expecting a digit");
            }
            while (this._mJ_(this.ch)) {
                _local2 = (_local2 + this.ch);
                this._0J_L_();
            }
        }
        if ((((this.ch == "e")) || ((this.ch == "E")))) {
            _local2 = (_local2 + "e");
            this._0J_L_();
            if ((((this.ch == "+")) || ((this.ch == "-")))) {
                _local2 = (_local2 + this.ch);
                this._0J_L_();
            }
            if (!this._mJ_(this.ch)) {
                this._L_R_("Scientific notation number needs exponent value");
            }
            while (this._mJ_(this.ch)) {
                _local2 = (_local2 + this.ch);
                this._0J_L_();
            }
        }
        var _local3:Number = Number(_local2);
        if (((isFinite(_local3)) && (!(isNaN(_local3))))) {
            _local1.value = _local3;
            return (_local1);
        }
        this._L_R_((("Number " + _local3) + " is not valid!"));
        return (null);
    }

    private function _0J_L_():String {
        return ((this.ch = this._G_U_.charAt(this._H_Y_++)));
    }

    private function _N_j():void {
        var _local1:int;
        do
        {
            _local1 = this._H_Y_;
            this._yh();
            this._jL_();
        } while (_local1 != this._H_Y_);
    }

    private function _jL_():void {
        if (this.ch == "/") {
            this._0J_L_();
            switch (this.ch) {
                case "/":
                    do
                    {
                        this._0J_L_();
                    } while (((!((this.ch == "\n"))) && (!((this.ch == "")))));
                    this._0J_L_();
                    return;
                case "*":
                    this._0J_L_();
                    while (true) {
                        if (this.ch == "*") {
                            this._0J_L_();
                            if (this.ch == "/") {
                                this._0J_L_();
                                break;
                            }
                        } else {
                            this._0J_L_();
                        }
                        if (this.ch == "") {
                            this._L_R_("Multi-line comment not closed");
                        }
                    }
                    return;
                default:
                    this._L_R_((("Unexpected " + this.ch) + " encountered (expecting '/' or '*' )"));
            }
        }
    }

    private function _yh():void {
        while (this._0J_V_(this.ch)) {
            this._0J_L_();
        }
    }

    private function _0J_V_(_arg1:String):Boolean {
        return ((((((((_arg1 == " ")) || ((_arg1 == "\t")))) || ((_arg1 == "\n")))) || ((_arg1 == "\r"))));
    }

    private function _mJ_(_arg1:String):Boolean {
        return ((((_arg1 >= "0")) && ((_arg1 <= "9"))));
    }

    private function _o5(_arg1:String):Boolean {
        var _local2:String = _arg1.toUpperCase();
        return (((this._mJ_(_arg1)) || ((((_local2 >= "A")) && ((_local2 <= "F"))))));
    }

}
}//package _Z_6

