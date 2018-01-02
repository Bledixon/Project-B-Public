// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.google.analytics.external.AdSenseGlobals

package com.google.analytics.external {
import com.google.analytics.debug.DebugConfiguration;

public class AdSenseGlobals extends JavascriptProxy {

    public static var gaGlobal_js:XML = <script>
                <![CDATA[
 function()
 {
                    try
                    {
                        gaGlobal
                    }
                    catch(e)
                    {
                        gaGlobal = {} ;
                    }
 }
 ]]>
            </script>
            ;

    public function AdSenseGlobals(_arg1:DebugConfiguration) {
        super(_arg1);
    }
    private var _gaGlobalVerified:Boolean = false;

    public function get hid():String {
        if (!isAvailable()) {
            return (null);
        }
        _verify();
        return (getProperty("gaGlobal.hid"));
    }

    public function set hid(_arg1:String):void {
        if (!isAvailable()) {
            return;
        }
        _verify();
        setProperty("gaGlobal.hid", _arg1);
    }

    public function get dh():String {
        if (!isAvailable()) {
            return (null);
        }
        _verify();
        return (getProperty("gaGlobal.dh"));
    }

    public function get sid():String {
        if (!isAvailable()) {
            return (null);
        }
        _verify();
        return (getProperty("gaGlobal.sid"));
    }

    public function set sid(_arg1:String):void {
        if (!isAvailable()) {
            return;
        }
        _verify();
        setProperty("gaGlobal.sid", _arg1);
    }

    public function get vid():String {
        if (!isAvailable()) {
            return (null);
        }
        _verify();
        return (getProperty("gaGlobal.vid"));
    }

    public function set vid(_arg1:String):void {
        if (!isAvailable()) {
            return;
        }
        _verify();
        setProperty("gaGlobal.vid", _arg1);
    }

    public function get gaGlobal():Object {
        if (!isAvailable()) {
            return (null);
        }
        _verify();
        return (getProperty("gaGlobal"));
    }

    private function _verify():void {
        if (!_gaGlobalVerified) {
            executeBlock(gaGlobal_js);
            _gaGlobalVerified = true;
        }
    }

}
}//package com.google.analytics.external

