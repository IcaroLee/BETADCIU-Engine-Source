import animate.internal.elements.FlxSpriteElement;
import objects.FunkinSprite;

var lipSyncSprite:FunkinSprite;

function onCreatePost()
{
    createLipSync(0, 0);
    lipSyncSprite.flipX = true;

    lipSyncSprite.offset.set(7, 2);
    lipSyncSprite.angle = -14;

    var element:FlxSpriteElement = new FlxSpriteElement(lipSyncSprite);
    element.active = false; // We disable the element here so we can control when it updates.

    for (frame in this.getFramesWithKeyword("mouth edit"))
    {
        frame.add(element);
    }
}

function onUpdate(elapsed:Float)
{
    if(lipSyncSprite != null) lipSyncSprite.animation.curAnim.curFrame = Math.floor((Conductor.songPosition / 1000) * 24) - 1;
}

function createLipSync(x, y)
{
    //lipSyncSprite?.destroy();

    lipSyncSprite = new FunkinSprite();
    lipSyncSprite.frames = Paths.getAnimateAtlas('sserafim-lipsync', "sserafim");
    lipSyncSprite.anim.addBySymbol("lipsync", lipSyncSprite.getDefaultSymbol(), 24, false);
    lipSyncSprite.anim.play("lipsync");
}