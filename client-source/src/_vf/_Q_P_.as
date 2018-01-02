// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_vf._Q_P_

package _vf {
import flash.media.SoundTransform;

import com.company.assembleegameclient.parameters.Parameters;
import com.company.googleanalytics.GA;

public class _Q_P_ {

    public static function load():void {
        var _4w:SoundTransform = new SoundTransform(((Parameters.data_.playSFX) ? 1 : 0));
    }

    public static function _2c(_arg1:Boolean):void {
        //GA.global().trackEvent("sound", ((_arg1) ? "soundOn" : "soundOff"));
        Parameters.data_.playSFX = _arg1;
        Parameters.save();
        _5T_._02r();
    }

}
}//package _vf

