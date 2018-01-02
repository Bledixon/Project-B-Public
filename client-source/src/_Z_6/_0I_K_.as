// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_Z_6._0I_K_

package _Z_6 {
public class _0I_K_ {

    public function _0I_K_(_arg1:String) {
        this._07 = new _0A_r(_arg1);
        this._Y_c();
        this.value = this._2t();
    }
    private var value;
    private var _07:_0A_r;
    private var token:_uL_;

    public function getValue() {
        return (this.value);
    }

    private function _Y_c():_uL_ {
        return ((this.token = this._07._0A_4()));
    }

    private function _06c():Array {
        var _local1:Array = [];
        this._Y_c();
        if (this.token.type_ == _L_t._0M_B_) {
            return (_local1);
        }
        while (true) {
            _local1.push(this._2t());
            this._Y_c();
            if (this.token.type_ == _L_t._0M_B_) {
                return (_local1);
            }
            if (this.token.type_ == _L_t._gX_) {
                this._Y_c();
            } else {
                this._07._L_R_(("Expecting ] or , but found " + this.token.value));
            }
        }
        return (null);
    }

    private function _az():Object {
        var _local2:String;
        var _local1:Object = {};
        this._Y_c();
        if (this.token.type_ == _L_t._K_B_) {
            return (_local1);
        }
        while (true) {
            if (this.token.type_ == _L_t._F_v) {
                _local2 = String(this.token.value);
                this._Y_c();
                if (this.token.type_ == _L_t._bT_) {
                    this._Y_c();
                    _local1[_local2] = this._2t();
                    this._Y_c();
                    if (this.token.type_ == _L_t._K_B_) {
                        return (_local1);
                    }
                    if (this.token.type_ == _L_t._gX_) {
                        this._Y_c();
                    } else {
                        this._07._L_R_(("Expecting } or , but found " + this.token.value));
                    }
                } else {
                    this._07._L_R_(("Expecting : but found " + this.token.value));
                }
            } else {
                this._07._L_R_(("Expecting string but found " + this.token.value));
            }
        }
        return (null);
    }

    private function _2t():Object {
        if (this.token == null) {
            this._07._L_R_("Unexpected end of input");
        }
        switch (this.token.type_) {
            case _L_t._B_a:
                return (this._az());
            case _L_t._0B_5:
                return (this._06c());
            case _L_t._F_v:
            case _L_t._0_M_:
            case _L_t._W_F_:
            case _L_t._8:
            case _L_t._0C_I_:
                return (this.token.value);
            default:
                this._07._L_R_(("Unexpected " + this.token.value));
        }
        return (null);
    }

}
}//package _Z_6

