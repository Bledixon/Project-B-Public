// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_zD_._G_I_

package _zD_ {
import _C__._cM_;

import com.company.assembleegameclient.screens.charrects.CharacterRectList;

import _U_5._01W_;

import _F_1._0H_2;

public class _G_I_ extends _cM_ {

    [Inject]
    public var view:CharacterRectList;
    [Inject]
    public var _0_b:_01W_;

    override public function initialize():void {
        this.view.newCharacter.add(this._8b);
    }

    override public function destroy():void {
        this.view.newCharacter.remove(this._8b);
    }

    private function _8b():void {
        this._0_b.dispatch(new _0H_2());
    }

}
}//package _zD_

