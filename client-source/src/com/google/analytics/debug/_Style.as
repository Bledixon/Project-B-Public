﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.google.analytics.debug._Style

package com.google.analytics.debug {
import flash.text.StyleSheet;
import flash.net.URLLoader;

public class _Style {

    public function _Style() {
        _sheet = new StyleSheet();
        var _loader:URLLoader = new URLLoader();
        _init();
    }
    public var failureColor:uint;
    public var borderColor:uint;
    public var backgroundColor:uint;
    public var roundedCorner:uint;
    public var warningColor:uint;
    public var infoColor:uint;
    public var alertColor:uint;
    public var successColor:uint;

    private var _sheet:StyleSheet;

    public function get sheet():StyleSheet {
        return (_sheet);
    }

    private function _parseSheet(_arg1:String):void {
        _sheet.parseCSS(_arg1);
    }

    private function _init():void {
        var _defaultSheet:String = "";
        _defaultSheet = (_defaultSheet + "a{text-decoration: underline;}\n");
        _defaultSheet = (_defaultSheet + ".uiLabel{color: #000000;font-family: Arial;font-size: 12;margin-left: 2;margin-right: 2;}\n");
        _defaultSheet = (_defaultSheet + ".uiWarning{color: #ffffff;font-family: Arial;font-size: 14;font-weight: bold;margin-left: 6;margin-right: 6;}\n");
        _defaultSheet = (_defaultSheet + ".uiAlert{color: #ffffff;font-family: Arial;font-size: 14;font-weight: bold;margin-left: 6;margin-right: 6;}\n");
        _defaultSheet = (_defaultSheet + ".uiInfo{color: #000000;font-family: Arial;font-size: 14;font-weight: bold;margin-left: 6;margin-right: 6;}\n");
        _defaultSheet = (_defaultSheet + ".uiSuccess{color: #ffffff;font-family: Arial;font-size: 12;font-weight: bold;margin-left: 6;margin-right: 6;}\n");
        _defaultSheet = (_defaultSheet + ".uiFailure{color: #ffffff;font-family: Arial;font-size: 12;font-weight: bold;margin-left: 6;margin-right: 6;}\n");
        _defaultSheet = (_defaultSheet + ".uiAlertAction{color: #ffffff;text-align: center;font-family: Arial;font-size: 12;font-weight: bold;margin-left: 6;margin-right: 6;}\n");
        _defaultSheet = (_defaultSheet + ".uiAlertTitle{color: #ffffff;font-family: Arial;font-size: 16;font-weight: bold;margin-left: 6;margin-right: 6;}\n");
        _defaultSheet = (_defaultSheet + "\n");
        roundedCorner = 6;
        backgroundColor = 0xCCCCCC;
        borderColor = 0x555555;
        infoColor = 16777113;
        alertColor = 0xFFCC00;
        warningColor = 0xCC0000;
        successColor = 0xFF00;
        failureColor = 0xFF0000;
        _parseSheet(_defaultSheet);
    }

}
}//package com.google.analytics.debug

