// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0G__._ci

package _0G__ {
import flash.display.DisplayObjectContainer;

import _02b._6E_;

import com.company.assembleegameclient.parameters.Parameters;

public class _ci {

    [Inject]
    public var _fR_:DisplayObjectContainer;
    [Inject]
    public var analytics:_6E_;

    public function execute():void {
        this.analytics.init(this._fR_.stage, Parameters._05w());
    }

}
}//package _0G__

