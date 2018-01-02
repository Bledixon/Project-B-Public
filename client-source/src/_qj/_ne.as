// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_qj._ne

package _qj {
public class _ne extends BaseDescription {

    public static function toString(_arg1:_0D_D_):String {
        return (new (_ne)()._ka(_arg1).toString());
    }

    public function _ne() {
        this.clear();
    }
    private var _F_p:String;

    override protected function append(_arg1:Object):void {
        this._F_p = (this._F_p + String(_arg1));
    }

    override public function toString():String {
        return (this._F_p);
    }

    public function clear():void {
        this._F_p = "";
    }

}
}//package _qj

