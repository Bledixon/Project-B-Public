// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.util._gv

package com.company.util {
import flash.system.Capabilities;

public class _gv {

    public static function _00f():String {
        return (_N_c("avHardwareDisable") + _N_c("hasAccessibility") + _N_c("hasAudio") + _N_c("hasAudioEncoder") + _N_c("hasEmbeddedVideo") + _N_c("hasIME") + _N_c("hasMP3") + _N_c("hasPrinting") + _N_c("hasScreenBroadcast") + _N_c("hasScreenPlayback") + _N_c("hasStreamingAudio") + _N_c("hasStreamingVideo") + _N_c("hasTLS") + _N_c("hasVideoEncoder") + _N_c("isDebugger") + _N_c("language") + _N_c("localFileReadDisable") + _N_c("manufacturer") + _N_c("os") + _N_c("pixelAspectRatio") + _N_c("playerType") + _N_c("screenColor") + _N_c("screenDPI") + _N_c("screenResolutionX") + _N_c("screenResolutionY") + _N_c("version"));
    }

    private static function _N_c(_arg1:String):String {
        return ((((_arg1 + ": ") + Capabilities[_arg1]) + "\n"));
    }

}
}//package com.company.util

