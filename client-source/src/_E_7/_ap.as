// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_E_7._ap

package _E_7 {
import com.company.ui.SimpleText;
import com.company.assembleegameclient.ui.ui_playerslist;

import flash.filters.DropShadowFilter;

import com.company.assembleegameclient.objects.GameObject;

public class _ap extends _for_ {

    public function _ap(_arg1:GameObject) {
        super(6036765, 1, 16549442, 1, false);
        this.text_ = new SimpleText(22, 16549442, false, 0, 0, "Myriad Pro");
        this.text_.setBold(true);
        this.text_.text = "Quest!";
        this.text_.updateMetrics();
        this.text_.filters = [new DropShadowFilter(0, 0, 0)];
        this.text_.x = 0;
        this.text_.y = 0;
        addChild(this.text_);
        this._id = new ui_playerslist(0xB3B3B3, true, _arg1);
        this._id.x = 0;
        this._id.y = 32;
        addChild(this._id);
        filters = [];
    }
    public var _id:ui_playerslist;
    private var text_:SimpleText;
}
}//package _E_7

