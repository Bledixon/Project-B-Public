// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_011._01Q_

package _011 {
import com.company.net._098;

import flash.utils.IDataOutput;

public class _01Q_ extends _098 {

    public function _01Q_(_arg1:uint) {
        super(_arg1);
    }

    final override public function writeToOutput(_arg1:IDataOutput):void {
        throw (new Error((("Client should not send " + id_) + " messages")));
    }

}
}//package _011

