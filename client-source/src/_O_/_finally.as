// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_O_._finally

package _O_ {
import flash.display.DisplayObjectContainer;

import _s3._im;

public class _finally {

    [Inject]
    public var _fR_:DisplayObjectContainer;
    [Inject]
    public var viewManager:_im;

    [PostConstruct]
    public function init():void {
        this.viewManager._tP_(this._fR_);
    }

}
}//package _O_

