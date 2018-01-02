// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_vf._5T_

package _vf {
import com.company.assembleegameclient.parameters.Parameters;

import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.media.Sound;
import flash.media.SoundChannel;
import flash.media.SoundTransform;
import flash.net.URLRequest;
import flash.utils.Dictionary;

public class _5T_ {

    public static var _0H_k:Dictionary = new Dictionary();
    private static var _04b:Dictionary = new Dictionary(true);
    private static var channels:Dictionary = new Dictionary(true);

    public static function load(_arg1:String):Sound {
        var _local2:Sound = _0H_k[_arg1];
        if (_local2 != null) {
            return (_local2);
        }
        var _local3:URLRequest = new URLRequest("http://" + Parameters.musicUrl_ + "/sfx/" + _arg1 + ".mp3");
        _local2 = new Sound();
        _local2.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
        _local2.load(_local3);
        _0H_k[_arg1] = _local2;
        return (_local2);
    }

    public static function play(name:String, volume:Number = 1, isFX:Boolean = true):void {
        var actualVolume:Number;
        var trans:SoundTransform;
        var channel:SoundChannel;
        var sound:Sound = load(name);
        try {
            actualVolume = ((((((Parameters.data_.playSFX) && (isFX))) || (((!(isFX)) && (Parameters.data_.playPewPew))))) ? volume : 0);
            trans = new SoundTransform(actualVolume);
            channel = sound.play(0, 0, trans);
            channel.addEventListener(Event.SOUND_COMPLETE, _J_M_, false, 0, true);
            _04b[channel] = volume;
            channels[channel] = channel;
        } catch (error:Error) {
        }
    }

    public static function _02r():void {
        var _local1:SoundChannel;
        var _local2:SoundTransform;
        for each (_local1 in channels) {
            _local2 = _local1.soundTransform;
            _local2.volume = ((Parameters.data_.playSFX) ? _04b[_local1] : 0);
            _local1.soundTransform = _local2;
        }
    }

    public static function onIOError(_arg1:IOErrorEvent):void {
    }

    private static function _J_M_(_arg1:Event):void {
        var _local2:SoundChannel = (_arg1.target as SoundChannel);
        delete _04b[_local2];
        delete channels[_local2];
    }

}
}//package _vf

