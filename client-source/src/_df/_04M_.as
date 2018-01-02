// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_df._04M_

package _df {
import com.company.assembleegameclient.util.TextureRedrawer;

import flash.display.BitmapData;

public class _04M_ extends Preview {

    public function _04M_(_arg1:int, _arg2:int) {
        super(_arg1, _arg2);
    }

    override public function redraw():void {
        super.redraw();
        if (_lT_ == null) {
            return;
        }
        bitmap_.bitmapData = TextureRedrawer.redraw(_lT_, size_, true, 0, 0, false);
    }

}
}//package _df

