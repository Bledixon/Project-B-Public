// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.map._0D_v

package com.company.assembleegameclient.map {
  import flash.geom.Vector3D;
  import flash.geom.Rectangle;
  import flash.geom.PerspectiveProjection;
  import flash.geom.Matrix3D;

  import com.company.assembleegameclient.parameters.Parameters;
  import com.company.assembleegameclient.objects.Player;
  import com.company.assembleegameclient.util._04d;
  import com.company.util.Trig;


  public class _0D_v {

    public static const _P_x:Vector3D = new Vector3D(0, 0, 1);
    private static const _z7:Rectangle = new Rectangle(-300, -325, 600, 600);
    private static const _D__:Rectangle = new Rectangle(-300, -450, 600, 600);
    private static const _0H_w:Rectangle = new Rectangle(-400, -325, 800, 600);
    private static const _eV_:Rectangle = new Rectangle(-400, -275, 800, 500);

    private const _ig:Number = 0.5;
    private const _W_y:int = 10000;

    public function _0D_v() {
      this._uo = new PerspectiveProjection();
      this.wToS_ = new Matrix3D();
      this._aa = new Matrix3D();
      this._wy = new Matrix3D();
      this._O_F_ = new Matrix3D();
      this._ey = new Vector3D();
      this._05K_ = new Vector3D();
      this._1H_ = new Vector3D();
      this._9p = new Vector3D();
      this._j9 = new Vector.<Number>(16, true);
      super();
      this._uo.focalLength = 3;
      this._uo.fieldOfView = 48;
      this._S_j = this._uo.toMatrix3D();
      this._O_F_.appendScale(50, 50, 50);
      this._05K_.x = 0;
      this._05K_.y = 0;
      this._05K_.z = -1;
    }
    public var x_:Number;
    public var y_:Number;
    public var z_:Number;
    public var angleRad_:Number;
    public var _F_L_:Rectangle;
    public var _uo:PerspectiveProjection;
    public var maxDist_:Number;
    public var _U_8:Number;
    public var _kN_:Boolean = false;
    public var wToS_:Matrix3D;
    public var _aa:Matrix3D;
    public var _wy:Matrix3D;
    public var _S_j:Matrix3D;
    private var _O_F_:Matrix3D;
    private var _ey:Vector3D;
    private var _05K_:Vector3D;
    private var _1H_:Vector3D;
    private var _9p:Vector3D;
    private var _J_q:Boolean = false;
    private var _J_V_:Number = 0;
    private var _j9:Vector.<Number>;

    public function _K_g(_arg1:Player):void {
      var _local2:Rectangle = ((Parameters.data_.centerOnPlayer) ? _z7 : _D__);
      if (Parameters._0F_o) {
        if (!Parameters._ih) {
          _local2 = _0H_w;
        } else {
          _local2 = _eV_;
        }
      }
      var _local3:Number = Parameters.data_.cameraAngle;
      this._K_(_arg1.x_, _arg1.y_, 12, _local3, _local2, false);
      this._kN_ = _arg1._G_D_();
    }

    public function _uE_():void {
      this._J_q = true;
      this._J_V_ = 0;
    }

    public function update(_arg1:Number):void {
      if (((this._J_q) && ((this._J_V_ < this._ig)))) {
        this._J_V_ = (this._J_V_ + ((_arg1 * this._ig) / this._W_y));
        if (this._J_V_ > this._ig) {
          this._J_V_ = this._ig;
        }
      }
    }

    public function _K_(_arg1:Number, _arg2:Number, _arg3:Number, _arg4:Number, _arg5:Rectangle, _arg6:Boolean):void {
      var _local7:Number;
      var _local8:Number;
      var _local9:Number;
      if (this._J_q) {
        _arg1 = (_arg1 + _04d._F_e(this._J_V_));
        _arg2 = (_arg2 + _04d._F_e(this._J_V_));
      }
      this.x_ = _arg1;
      this.y_ = _arg2;
      this.z_ = _arg3;
      this.angleRad_ = _arg4;
      this._F_L_ = _arg5;
      this._ey.x = _arg1;
      this._ey.y = _arg2;
      this._ey.z = _arg3;
      this._9p.x = Math.cos(this.angleRad_);
      this._9p.y = Math.sin(this.angleRad_);
      this._9p.z = 0;
      this._1H_.x = Math.cos((this.angleRad_ + (Math.PI / 2)));
      this._1H_.y = Math.sin((this.angleRad_ + (Math.PI / 2)));
      this._1H_.z = 0;
      this._j9[0] = this._9p.x;
      this._j9[1] = this._1H_.x;
      this._j9[2] = this._05K_.x;
      this._j9[3] = 0;
      this._j9[4] = this._9p.y;
      this._j9[5] = this._1H_.y;
      this._j9[6] = this._05K_.y;
      this._j9[7] = 0;
      this._j9[8] = this._9p.z;
      this._j9[9] = ((_arg6) ? this._1H_.z : -1);
      this._j9[10] = this._05K_.z;
      this._j9[11] = 0;
      this._j9[12] = -(this._ey.dotProduct(this._9p));
      this._j9[13] = -(this._ey.dotProduct(this._1H_));
      this._j9[14] = -(this._ey.dotProduct(this._05K_));
      this._j9[15] = 1;
      this._aa.rawData = this._j9;
      if (_arg6) {
        this._wy = this._S_j;
      } else {
        this._wy = this._O_F_;
      }
      this.wToS_.identity();
      this.wToS_.append(this._aa);
      this.wToS_.append(this._wy);


      //I can already feel it will take me a long time to get this part right...
      var viewingDistance:int = (projectblogo.sHeight / 600) + (projectblogo.sWidth / 600) + (projectblogo.sHeight / 600) + (projectblogo.sWidth / 600) / (Parameters.data_["mscale"]);
      if (_arg6) {
        _local7 = (this.z_ * Math.tan(((this._uo.fieldOfView / 2) * Trig._km)));
        this.maxDist_ = ((Math.SQRT2 * _local7) * 1.4);
      } else {
        _local8 = (this._F_L_.width / (2 * 50));
        _local9 = (this._F_L_.height / (2 * 50));
        this.maxDist_ = (Math.sqrt(((_local8 * _local8) + (_local9 * _local9))) + viewingDistance);
      }
      this._U_8 = (this.maxDist_ * this.maxDist_);
    }

  }
}//package com.company.assembleegameclient.map

