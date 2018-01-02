package com.company.util {
    public class _str954 {

        private const _str3407:Array = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

        public var _str4106:String;

        public function format(_arg1:Date):String{
            var _local2:String = this._str4106;
            _local2 = _local2.replace("D", _arg1.date);
            _local2 = _local2.replace("YYYY", _arg1.fullYear);
            return (_local2.replace("MMMM", this._str3407[_arg1.month]));
        }
    }
}
