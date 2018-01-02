// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//MapBackgrounds.Background

package MapBackgrounds {

  import MapBackgrounds.Backgrounds.StarBackground;
  import MapBackgrounds.Backgrounds.NexusBackground;
  import MapBackgrounds._Weather.Weather_ghost;

  import MapBackgrounds._Weather.Weather_rain;
  import MapBackgrounds._Weather.Weather_snow;
  import MapBackgrounds._Weather.Weather_storm;
  import MapBackgrounds._Weather.Weather_lava;

  import flash.display.Sprite;

  import com.company.assembleegameclient.map._0D_v;

public class Background extends Sprite {

  protected var mapx_:Number;
  protected var mapy_:Number;

  public static const _0H_W_:int = 0;
  public static const _9F_:int = 1;
  public static const _068:int = 2;
  public static const _0H_v:int = 3;

  public static const Sunny:int = 0;
  public static const Rainy:int = 1;
  public static const Snowy:int = 2
  public static const Thunder:int = 3;
  public static const Ash_storm:int = 4;
  public static const Ghost:int = 5;

  public static function _U_q(_arg1:int):Background{
    switch (_arg1)
    {
      case _0H_W_:
        return (null);
      case _9F_:
        return (new StarBackground());
      case _068:
        return (new NexusBackground());
    }
    return (null);
  }

  public static function GetWeatherBackground(_arg1:int):Background{
    switch (_arg1)
    {
      case Sunny:
        return (null);
      case Rainy:
        return (new Weather_rain());
      case Snowy:
        return (new Weather_snow());
      case Thunder:
        return (new Weather_storm());
      case Ash_storm:
        return (new Weather_lava());
      case Ghost:
        return (new Weather_ghost());
    }
    return (null);
  }

  public function updatePos(_arg1:Number, _arg2:Number):void {
    mapx_ = _arg1;
    mapy_ = _arg2;
  }

  public function draw(_arg1:_0D_v, _arg2:int):void {
  }

  public function update():void {

  }
}
}//package MapBackgrounds

