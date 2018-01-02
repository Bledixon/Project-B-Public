// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.tutorial.Step

package com.company.assembleegameclient.tutorial {


public class Step {

    public function Step(_arg1:XML) {
        var _local2:XML;
        var _local3:XML;
        var _local4:XML;
        this._0J_b = new Vector.<UIDrawBox>();
        this._06F_ = new Vector.<UIDrawArrow>();
        this._I_2 = new Vector.<Requirement>();
        super();
        for each (_local2 in _arg1.UIDrawBox) {
            this._0J_b.push(new UIDrawBox(_local2));
        }
        for each (_local3 in _arg1.UIDrawArrow) {
            this._06F_.push(new UIDrawArrow(_local3));
        }
        for each (_local4 in _arg1.Requirement) {
            this._I_2.push(new Requirement(_local4));
        }
    }
    public var text_:String;
    public var action_:String;
    public var _0J_b:Vector.<UIDrawBox>;
    public var _06F_:Vector.<UIDrawArrow>;
    public var _I_2:Vector.<Requirement>;
    public var _n:int = 0;

    public function toString():String {
        return ((("[" + this.text_) + "]"));
    }

}
}//package com.company.assembleegameclient.tutorial

