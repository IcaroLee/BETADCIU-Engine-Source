package states.stages.objects;

import objects.FunkinSprite;
import backend.Conductor;

// object used for lip sync on characters in SPAGHETTI
class SserafimLipSyncSprite extends FunkinSprite
{
  var shouldSing(default, set):Bool = true;

  function set_shouldSing(value:Bool):Bool
  {
    shouldSing = value;

    if (!value)
    {
      animation.curAnim.curFrame = 0;
    }

    return value;
  }

  public function new(x:Float, y:Float)
  {
    super(x, y);

    frames = Paths.getAnimateAtlas('sserafim-lipsync', "sserafim");
    anim.addBySymbol("lipsync", this.getDefaultSymbol(), 24, false);
    // anim.play("lipsync", true);
  }

  override function update(elapsed:Float):Void
  {
    if (this.animation.curAnim != null && shouldSing)
    {
      this.animation.curAnim.curFrame = Math.floor((Conductor.songPosition / 1000) * 24) - 1;
    }
  }
}
