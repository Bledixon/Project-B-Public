﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.google.analytics.ecommerce.Item

package com.google.analytics.ecommerce {
import com.google.analytics.utils.Variables;

public class Item {

    public function Item(_arg1:String, _arg2:String, _arg3:String, _arg4:String, _arg5:String, _arg6:String) {
        this._id = _arg1;
        this._sku = _arg2;
        this._name = _arg3;
        this._category = _arg4;
        this._price = _arg5;
        this._quantity = _arg6;
    }

    private var _price:String;

    public function get price():String {
        return (_price);
    }

    public function set price(_arg1:String):void {
        _price = _arg1;
    }

    private var _id:String;

    public function get id():String {
        return (_id);
    }

    public function set id(_arg1:String):void {
        _id = _arg1;
    }

    private var _sku:String;

    public function get sku():String {
        return (_sku);
    }

    public function set sku(_arg1:String):void {
        _sku = _arg1;
    }

    private var _category:String;

    public function get category():String {
        return (_category);
    }

    public function set category(_arg1:String):void {
        _category = _arg1;
    }

    private var _quantity:String;

    public function get quantity():String {
        return (_quantity);
    }

    public function set quantity(_arg1:String):void {
        _quantity = _arg1;
    }

    private var _name:String;

    public function get name():String {
        return (_name);
    }

    public function set name(_arg1:String):void {
        _name = _arg1;
    }

    public function toGifParams():Variables {
        var _local1:Variables = new Variables();
        _local1.URIencode = true;
        _local1.post = ["utmt", "utmtid", "utmipc", "utmipn", "utmiva", "utmipr", "utmiqt"];
        _local1.utmt = "item";
        _local1.utmtid = _id;
        _local1.utmipc = _sku;
        _local1.utmipn = _name;
        _local1.utmiva = _category;
        _local1.utmipr = _price;
        _local1.utmiqt = _quantity;
        return (_local1);
    }

}
}//package com.google.analytics.ecommerce

