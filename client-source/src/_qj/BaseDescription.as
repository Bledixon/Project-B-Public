// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_qj.BaseDescription

package _qj {
import flash.errors.IllegalOperationError;

public class BaseDescription implements Description {

    private static const _3i:Object = {
        '"': '\\"',
        "\n": "\\n",
        "\r": "\\r",
        "\t": "\\t"
    };

    public function toString():String {
        throw (new IllegalOperationError("BaseDescription#toString is abstract and must be overriden by a subclass"));
    }

    public function appendText(_arg1:String):Description {
        this.append(_arg1);
        return (this);
    }

    public function _ka(_arg1:_0D_D_):Description {
        _arg1.describeTo(this);
        return (this);
    }

    public function _zW_(_arg1:_pn, _arg2:*):Description {
        _arg1.describeMismatch(_arg2, this);
        return (this);
    }

    public function _B_U_(value:Object):Description {
        var date:Date;
        if (value == null) {
            this.append("null");
        } else {
            if ((value is String)) {
                this.append('"');
                this._k1(value);
                this.append('"');
            } else {
                if ((value is Number)) {
                    this.append("<");
                    this.append(value);
                    this.append(">");
                } else {
                    if ((value is Array)) {
                        this._07w("[", ",", "]", (value as Array));
                    } else {
                        if ((value is XML)) {
                            this.append(XML(value).toXMLString());
                        } else {
                            if ((value is Date)) {
                                var pad:Function = function (_arg1:int):String {
                                    return ((((_arg1 < 10)) ? ("0" + _arg1.toString(10)) : _arg1.toString(10)));
                                };
                                var pad3:Function = function (_arg1:int):String {
                                    return ((((_arg1 < 10)) ? ("00" + _arg1.toString(10)) : (((_arg1 < 100)) ? ("0" + _arg1.toString(10)) : _arg1.toString(10))));
                                };
                                date = (value as Date);
                                this.append("<");
                                this.append(date.fullYear);
                                this.append("-");
                                this.append(pad((date.month + 1)));
                                this.append("-");
                                this.append(pad(date.date));
                                this.append("T");
                                this.append(pad(date.hours));
                                this.append(":");
                                this.append(pad(date.minutes));
                                this.append(":");
                                this.append(pad(date.seconds));
                                this.append(".");
                                this.append(pad3(date.milliseconds));
                                this.append(">");
                            } else {
                                if ((value is Function)) {
                                    this.append("<Function>");
                                } else {
                                    this.append("<");
                                    this.append(value);
                                    this.append(">");
                                }
                            }
                        }
                    }
                }
            }
        }
        return (this);
    }

    public function _07w(_arg1:String, _arg2:String, _arg3:String, _arg4:Array):Description {
        return (this._05o(_arg1, _arg2, _arg3, _arg4.map(this._o7)));
    }

    public function _05o(_arg1:String, _arg2:String, _arg3:String, _arg4:Array):Description {
        var _local6:Object;
        var _local5:Boolean;
        this.append(_arg1);
        for each (_local6 in _arg4) {
            if (_local5) {
                this.append(_arg2);
            }
            if ((_local6 is _0D_D_)) {
                this._ka((_local6 as _0D_D_));
            } else {
                this._B_U_(_local6);
            }
            _local5 = true;
        }
        this.append(_arg3);
        return (this);
    }

    protected function append(_arg1:Object):void {
        throw (new IllegalOperationError("BaseDescription#append is abstract and must be overriden by a subclass"));
    }

    private function _o7(_arg1:Object, _arg2:int = 0, _arg3:Array = null):SelfDescribingValue {
        return (new SelfDescribingValue(_arg1));
    }

    private function _k1(_arg1:Object):void {
        String(_arg1).split("").forEach(this._vk);
    }

    private function _vk(_arg1:String, _arg2:int = 0, _arg3:Array = null):void {
        this.append(((_3i[_arg1]) || (_arg1)));
    }

}
}//package _qj

import _qj._0D_D_;
import _qj.Description;

class SelfDescribingValue implements _0D_D_ {

    /*private*/
    internal var _value:Object;

    public function SelfDescribingValue(_arg1:Object) {
        this._value = _arg1;
    }

    public function describeTo(_arg1:Description):void {
        _arg1._B_U_(this._value);
    }

}

