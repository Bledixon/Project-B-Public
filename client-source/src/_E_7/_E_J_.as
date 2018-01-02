// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_E_7._E_J_

package _E_7 {
import flash.display.Bitmap;

import com.company.ui.SimpleText;
import com.company.assembleegameclient.ui._return;
import com.company.assembleegameclient.util._0B_c;
import com.company.assembleegameclient.util._lJ_;
import com.company.assembleegameclient.util._J_H_;
import com.company.assembleegameclient.util.TextureRedrawer;

import flash.display.BitmapData;

import com.company.util._G_;

import flash.geom.ColorTransform;
import flash.filters.DropShadowFilter;

import com.company.assembleegameclient.util._Z_B_;
import com.company.assembleegameclient.objects.ObjectLibrary;
import com.company.assembleegameclient.appengine.Server_list;
import com.company.assembleegameclient.appengine._0A_H_;

public class _E_J_ extends _for_ {

    public function _E_J_(_arg1:XML, _arg2:Server_list, _arg3:_0A_H_) {
        var _local9:int;
        var _local10:int;
        var _local11:XML;
        var _local12:int;
        var _local13:int;
        super(0x2A2A2A, 1, 0xFFFFFF, 1);
        var _local4:_lJ_ = _0B_c._J_v(String(_arg1.AnimatedTexture.File), int(_arg1.AnimatedTexture.Index));
        var _local5:_J_H_ = _local4.imageFromDir(_lJ_.RIGHT, _lJ_._sS_, 0);
        var _local6:int = ((4 / _local5.width()) * 100);
        var _local7:BitmapData = TextureRedrawer.redraw(_local5.image_, _local6, true, 0, 0);
        var _local8:Boolean = _arg2.isAvailable(int(_arg1.@type));
        if (!_local8) {
            _local7 = _G_._B_2(_local7, new ColorTransform(0, 0, 0, 0.5, 0, 0, 0, 0));
        }
        this._tm = new Bitmap();
        this._tm.bitmapData = _local7;
        this._tm.x = -4;
        this._tm.y = -4;
        addChild(this._tm);
        this.nameText_ = new SimpleText(13, 0xB3B3B3, false, 0, 0, "Myriad Pro");
        this.nameText_.setBold(true);
        this.nameText_.text = _arg1.@id;
        this.nameText_.updateMetrics();
        this.nameText_.filters = [new DropShadowFilter(0, 0, 0)];
        this.nameText_.x = 32;
        this.nameText_.y = 6;
        addChild(this.nameText_);
        this.desc_ = new SimpleText(13, 0xB3B3B3, false, 174, 0, "Myriad Pro");
        this.desc_.wordWrap = true;
        this.desc_.multiline = true;
        this.desc_.text = _arg1.Description;
        this.desc_.updateMetrics();
        this.desc_.filters = [new DropShadowFilter(0, 0, 0)];
        this.desc_.x = 8;
        this.desc_.y = 40;
        addChild(this.desc_);
        this._qc = new _return(100, 0x2D2D2D);
        this._qc.x = 6;
        this._qc.y = height;
        addChild(this._qc);
        if (_local8) {
            _local9 = (((_arg3 == null)) ? 0 : _arg3._lr());
            this._05h = new SimpleText(12, 6206769, false, 0, 0, "Myriad Pro");
            this._05h.text = ((((((_local9 + " of " + _Z_B_._yJ_.length + " C-Quests Completed\n") + "Best Level Achieved: ") + (((_arg3) != null) ? _arg3.bestLevel() : 0)) + "\n") + "Best Fame Achieved: ") + (((_arg3) != null) ? _arg3._0D_E_() : 0));
            this._05h.updateMetrics();
            this._05h.filters = [new DropShadowFilter(0, 0, 0)];
            this._05h.x = 8;
            this._05h.y = (height - 2);
            addChild(this._05h);
            _local10 = _Z_B_._F_U_((((_arg3 == null)) ? 0 : _arg3._0D_E_()), 0);
            if (_local10 > 0) {
                this._U_n = new SimpleText(10, 16549442, false, 174, 0, "Myriad Pro");
                this._U_n.text = (((("Next Goal: Earn " + _local10) + " Fame\n") + "  with a ") + _arg1.@id);
                this._U_n.updateMetrics();
                this._U_n.filters = [new DropShadowFilter(0, 0, 0)];
                this._U_n.x = 8;
                this._U_n.y = (height - 2);
                addChild(this._U_n);
            }
        } else {
            this._aV_ = new SimpleText(13, 0xB3B3B3, false, 174, 0, "Myriad Pro");
            this._aV_.setBold(true);
            this._aV_.text = "To Unlock:";
            this._aV_.updateMetrics();
            this._aV_.filters = [new DropShadowFilter(0, 0, 0)];
            this._aV_.x = 8;
            this._aV_.y = (height - 2);
            addChild(this._aV_);
            this._aV_ = new SimpleText(13, 16549442, false, 174, 0, "Myriad Pro");
            this._aV_.wordWrap = false;
            this._aV_.multiline = true;
            for each (_local11 in _arg1.UnlockLevel) {
                _local12 = ObjectLibrary._pb[_local11.toString()];
                _local13 = int(_local11.@level);
                if (_arg2.bestLevel(_local12) < int(_local11.@level)) {
                    if (this._aV_.text != "") {
                        this._aV_.text = (this._aV_.text + "\n");
                    }
                    this._aV_.text = (this._aV_.text + ((("Reach Level " + _local13) + " with ") + ObjectLibrary._0D_N_[_local12]));
                }
            }
            this._aV_.border = false;
            this._aV_.updateMetrics();
            this._aV_.filters = [new DropShadowFilter(0, 0, 0)];
            this._aV_.x = 12;
            this._aV_.y = (height - 4);
            addChild(this._aV_);
        }
    }
    private var _tm:Bitmap;
    private var nameText_:SimpleText;
    private var desc_:SimpleText;
    private var _qc:_return;
    private var _05h:SimpleText;
    private var _nr:SimpleText;
    private var _aV_:SimpleText;
    private var _U_n:SimpleText;

    override public function draw():void {
        this._qc._rs((width - 10), 0x2D2D2D);
        super.draw();
    }

}
}//package _E_7

