// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0K_m._en

package _0K_m {

    import com.company.assembleegameclient.objects.GameObject;

    import flash.display.BitmapData;

    import com.company.util.AssetLibrary;
    import com.company.assembleegameclient.util.TextureRedrawer;


    public class _en extends _I_b {

        public static function _rU_(_arg1:_D_J_, _arg2:GameObject):_en {
            return (new _en(_arg1, _arg2));
        }

        public function _en(_arg1:_D_J_, _arg2:GameObject) {
            this._J_7 = _arg2;
            this._L_1 = new Vector.<_7M_>();
            this.__try = new Vector.<_7M_>();
            this._0G_x = _arg1;
            if (this._0G_x.bitmapFile) {
                this.bitmapData = AssetLibrary._xK_(this._0G_x.bitmapFile, this._0G_x.bitmapIndex);
                this.bitmapData = TextureRedrawer.redraw(this.bitmapData, this._0G_x.size, true, 0, 0);
            } else {
                this.bitmapData = TextureRedrawer.redrawSolidSquare(this._0G_x.color, this._0G_x.size);
            }
        }
        public var cloud_:Boolean = false;
        private var _L_1:Vector.<_7M_>;
        private var __try:Vector.<_7M_>;
        private var _J_7:GameObject;
        private var _0E_I_:Number = 0;
        private var _ge:Number = 0;
        private var _0G_x:_D_J_;
        private var bitmapData:BitmapData;
        private var _hX_:Number;

        override public function update(_arg1:int, _arg2:int):Boolean {
            var _local4:Number;
            var _local7:int;
            var _local8:_7M_;
            var _local9:_7M_;
            var _local3:Number = (_arg1 / 1000);
            _local4 = (_arg2 / 1000);
            if (this._J_7.map_ == null) {
                return (false);
            }
            x_ = this._J_7.x_;
            y_ = this._J_7.y_;
            z_ = (this._J_7.z_ + this._0G_x.zOffset);
            this._ge = (this._ge + _local4);
            var _local5:Number = (this._0G_x.rate * this._ge);
            var _local6:int = (_local5 - this._0E_I_);
            _local7 = 0;
            while (_local7 < _local6) {
                if (this._L_1.length) {
                    _local8 = this._L_1.pop();
                    _local8.cloudInitLife_ = 0;
                    _local8.fadeInitLife_ = 0;
                    _local8.fadedIn_ = false;
                    _local8.alpha_ = 1;
                } else {
                    _local8 = new _7M_(_local13);
                }
                var _local13:BitmapData;
                var _local12:Object;
                if (this._0G_x.bitmapFile) {
                    _local12 = this._0G_x.bitmapIndex;
                    if(this._0G_x.bitmapIndexMax != -1) {
                        _local12 = Math.floor(Math.random() * (1 + this._0G_x.bitmapIndexMax - this._0G_x.bitmapIndex) + this._0G_x.bitmapIndex);
                    }
                    _local13 = AssetLibrary._xK_(this._0G_x.bitmapFile, uint(_local12));
                    _local13 = TextureRedrawer.redraw(_local13, this._0G_x.size, true, 0, 0);
                } else {
                    _local13 = TextureRedrawer.redrawSolidSquare(this._0G_x.color, this._0G_x.size);
                }
                _local8.bitmapData_ = _local13;
                if(_local12 != null) {
                    _local8.bitmapIndex_ = uint(_local12);
                }
                if(this._0G_x.fadeIn != -1) {
                    _local8.alpha_ = 0;
                }
                _local8.initialize((this._0G_x.life + (this._0G_x.lifeVariance * ((2 * Math.random()) - 1))), (this._0G_x.speed + (this._0G_x.speedVariance * ((2 * Math.random()) - 1))), (this._0G_x.speed + (this._0G_x.speedVariance * ((2 * Math.random()) - 1))), (this._0G_x.rise + (this._0G_x.riseVariance * ((2 * Math.random()) - 1))), (z_ + (this._0G_x.rangeZ * Math.random())));
                _local8._size = this._0G_x.size;
                var _local10:Number = this._0G_x.rangeX * ((2 * Math.random()) - 1);
                var _local11:Number = this._0G_x.rangeY * ((2 * Math.random()) - 1);
                map_.addObj(_local8, x_ + _local10, y_ + _local11);
                _local8.lX_ = _local10;
                _local8.lY_ = _local11;
                _local8.pOwnerX_ = this._J_7.x_;
                _local8.pOwnerY_ = this._J_7.y_;
                this.__try.push(_local8);
                _local7++;
            }
            this._0E_I_ = (this._0E_I_ + _local6);
            _local7 = 0;
            while (_local7 < this.__try.length) {
                _local9 = this.__try[_local7];
                _local9._G_n = (_local9._G_n - _local4);
                if (_local9._G_n <= 0) {
                    this.__try.splice(_local7, 1);
                    map_.removeObj(_local9.objectId_);
                    _local7--;
                    this._L_1.push(_local9);
                } else {
                    if(this.cloud_ && (_local9.pOwnerX_ != this._J_7.x_ || _local9.pOwnerY_ != this._J_7.y_)) {
                        if(_local9.cloudInitLife_ == 0) {
                            _local9.cloudInitLife_ = _local9._G_n;
                        }
                        _local9._size = (_local9._G_n / _local9.cloudInitLife_) * this._0G_x.size;
                        if(_local9._size < 0) {
                            _local9._size = 0;
                        }
                        var _local13:BitmapData;
                        if (this._0G_x.bitmapFile) {
                            _local13 = AssetLibrary._xK_(this._0G_x.bitmapFile, _local9.bitmapIndex_);
                            _local13 = TextureRedrawer.redraw(_local13, _local9._size, true, 0, 0);
                        } else {
                            _local13 = TextureRedrawer.redrawSolidSquare(this._0G_x.color, _local9._size);
                        }
                        _local9.bitmapData_ = _local13;
                    } else if(this._0G_x.growth != 0) {
                        _local9._size += this._0G_x.growth * _local4;
                        if(_local9._size < 0) {
                            _local9._size = 0;
                        }
                        var _local13:BitmapData;
                        if (this._0G_x.bitmapFile) {
                            _local13 = AssetLibrary._xK_(this._0G_x.bitmapFile, _local9.bitmapIndex_);
                            _local13 = TextureRedrawer.redraw(_local13, _local9._size, true, 0, 0);
                        } else {
                            _local13 = TextureRedrawer.redrawSolidSquare(this._0G_x.color, _local9._size);
                        }
                        _local9.bitmapData_ = _local13;
                    }
                    if(this._0G_x.fadeIn != -1) {
                        if(_local9._G_m - _local9._G_n <= this._0G_x.fadeIn) {
                            _local9.alpha_ = (_local9._G_m - _local9._G_n) / this._0G_x.fadeIn;
                            if (_local9.alpha_ > 1) {
                                _local9.alpha_ = 1;
                            }
                        } else {
                            if(!_local9.fadedIn_ && _local9.alpha_ < 1) {
                                _local9.alpha_ = 1;
                            }
                            _local9.fadedIn_ = true;
                        }
                    }
                    if(this._0G_x.fadeOut != -1 && _local9._G_m - _local9._G_n >= this._0G_x.fadeOut) {
                        if(_local9.fadeInitLife_ == 0) {
                            _local9.fadeInitLife_ = _local9._G_n;
                        }
                        _local9.alpha_ = (_local9._G_n / _local9.fadeInitLife_);
                        if(_local9.alpha_ < 0) {
                            _local9.alpha_ = 0;
                        }
                    }
                    _local9._0A_7 = (_local9._0A_7 + (this._0G_x.riseAcc * _local4));
                    if(!this._0G_x.attached) {
                        _local9.x_ = (_local9.x_ + (_local9._null_ * _local4));
                        _local9.y_ = (_local9.y_ + (_local9._0K_5 * _local4));
                        _local9.z_ = (_local9.z_ + (_local9._0A_7 * _local4));
                    } else {
                        _local9.lX_ += _local9._null_ * _local4;
                        _local9.lY_ += _local9._0K_5 * _local4;
                        _local9.x_ = x_ + _local9.lX_;
                        _local9.y_ = y_ + _local9.lY_;_local9._0H_B_ = map_.getSquare(_local9.x_, _local9.y_);
                        _local9.z_ = (_local9.z_ + (_local9._0A_7 * _local4));
                    }
                }
                _local7++;
            }
            return (true);
        }

        override public function removeFromMap():void {
            var _local1:_7M_;
            for each (_local1 in this.__try) {
                map_.removeObj(_local1.objectId_);
            }
            this.__try = null;
            this._L_1 = null;
            super.removeFromMap();
        }

    }
}//package _0K_m

