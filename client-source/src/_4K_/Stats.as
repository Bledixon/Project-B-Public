// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_4K_.Stats

package _4K_ {
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.StyleSheet;
import flash.display.BitmapData;
import flash.geom.Rectangle;
import flash.events.Event;
import flash.geom.Matrix;
import flash.events.MouseEvent;
import flash.utils.getTimer;
import flash.system.System;

public class Stats extends Sprite {

    protected const WIDTH:uint = 70;
    protected const HEIGHT:uint = 100;

    public function Stats():void {
        this._uD_ = new Colors();
        super();
        this._U_O_ = 0;
        this.xml = <xml>
            <fps>FPS:</fps>
            <ms>MS:</ms>
            <mem>MEM:</mem>
            <memMax>MAX:</memMax>
        </xml>
        ;
        this._06S_ = new StyleSheet();
        this._06S_.setStyle("xml", {
            "fontSize": "9px",
            "fontFamily": "_sans",
            "leading": "-2px"
        });
        this._06S_.setStyle("fps", {"color": this._01G_(this._uD_.fps)});
        this._06S_.setStyle("ms", {"color": this._01G_(this._uD_.ms)});
        this._06S_.setStyle("mem", {"color": this._01G_(this._uD_.mem)});
        this._06S_.setStyle("memMax", {"color": this._01G_(this._uD_.memmax)});
        this.text = new TextField();
        this.text.width = this.WIDTH;
        this.text.height = 50;
        this.text.styleSheet = this._06S_;
        this.text.condenseWhite = true;
        this.text.selectable = false;
        this.text.mouseEnabled = false;
        this._0F_M_ = new Rectangle((this.WIDTH - 1), 0, 1, (this.HEIGHT - 50));
        addEventListener(Event.ADDED_TO_STAGE, this.init, false, 0, true);
        addEventListener(Event.REMOVED_FROM_STAGE, this.destroy, false, 0, true);
    }
    protected var xml:XML;
    protected var text:TextField;
    protected var _06S_:StyleSheet;
    protected var timer:uint;
    protected var fps:uint;
    protected var ms:uint;
    protected var _07h:uint;
    protected var mem:Number;
    protected var _U_O_:Number;
    protected var _7:BitmapData;
    protected var _0F_M_:Rectangle;
    protected var _p4:uint;
    protected var _ab:uint;
    protected var _lM_:uint;
    protected var _uD_:Colors;

    private function _01G_(_arg1:int):String {
        return (("#" + _arg1.toString(16)));
    }

    private function init(_arg1:Event):void {
        graphics.beginFill(this._uD_.bg);
        graphics.drawRect(0, 0, this.WIDTH, this.HEIGHT);
        graphics.endFill();
        addChild(this.text);
        this._7 = new BitmapData(this.WIDTH, (this.HEIGHT - 50), false, this._uD_.bg);
        graphics.beginBitmapFill(this._7, new Matrix(1, 0, 0, 1, 0, 50));
        graphics.drawRect(0, 50, this.WIDTH, (this.HEIGHT - 50));
        addEventListener(MouseEvent.CLICK, this._021);
        addEventListener(Event.ENTER_FRAME, this.update);
    }

    private function destroy(_arg1:Event):void {
        graphics.clear();
        while (numChildren > 0) {
            removeChildAt(0);
        }
        this._7.dispose();
        removeEventListener(MouseEvent.CLICK, this._021);
        removeEventListener(Event.ENTER_FRAME, this.update);
    }

    private function update(_arg1:Event):void {
        this.timer = getTimer();
        if ((this.timer - 1000) > this._07h) {
            this._07h = this.timer;
            this.mem = Number((System.totalMemory * 9.54E-7).toFixed(3));
            this._U_O_ = (((this._U_O_ > this.mem)) ? this._U_O_ : this.mem);
            this._p4 = Math.min(this._7.height, ((this.fps / stage.frameRate) * this._7.height));
            this._ab = (Math.min(this._7.height, Math.sqrt(Math.sqrt((this.mem * 5000)))) - 2);
            this._lM_ = (Math.min(this._7.height, Math.sqrt(Math.sqrt((this._U_O_ * 5000)))) - 2);
            this._7.scroll(-1, 0);
            this._7.fillRect(this._0F_M_, this._uD_.bg);
            this._7.setPixel((this._7.width - 1), (this._7.height - this._p4), this._uD_.fps);
            this._7.setPixel((this._7.width - 1), (this._7.height - ((this.timer - this.ms) >> 1)), this._uD_.ms);
            this._7.setPixel((this._7.width - 1), (this._7.height - this._ab), this._uD_.mem);
            this._7.setPixel((this._7.width - 1), (this._7.height - this._lM_), this._uD_.memmax);
            this.xml.fps = ((("FPS: " + this.fps) + " / ") + stage.frameRate);
            this.xml.mem = ("MEM: " + this.mem);
            this.xml.memMax = ("MAX: " + this._U_O_);
            this.fps = 0;
        }
        this.fps++;
        this.xml.ms = ("MS: " + (this.timer - this.ms));
        this.ms = this.timer;
        this.text.htmlText = this.xml;
    }

    private function _021(_arg1:MouseEvent):void {
        if (((mouseY / height) > 0.5)) {
            stage.frameRate--;
        } else {
            stage.frameRate++;
        }
        this.xml.fps = ((("FPS: " + this.fps) + " / ") + stage.frameRate);
        this.text.htmlText = this.xml;
    }

}
}//package _4K_

class Colors {

    public var bg:uint = 51;
    public var fps:uint = 0xFFFF00;
    public var ms:uint = 0xFF00;
    public var mem:uint = 0xFFFF;
    public var memmax:uint = 0xFF0070;

}

