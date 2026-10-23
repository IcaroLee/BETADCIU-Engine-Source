import animate.internal.elements.FlxSpriteElement;

function onCreatePost()
{
    createLipSync(0, 0);
    lipSyncSprite.alpha = 0.5;
    lipSyncSprite.flipX = true;

    lipSyncSprite.offset.set(7, 2);
    lipSyncSprite.angle = -14;

    var element:FlxSpriteElement = new FlxSpriteElement(lipSyncSprite);
    element.active = false; // We disable the element here so we can control when it updates.

    for (frame in boyfriend.getFramesWithKeyword("mouth edit"))
    {
        frame.add(element);
    }
}

var lipSyncSprite:SserafimLipSyncSprite;

function createLipSync(x, y)
{
    lipSyncSprite.frames = Paths.getAnimateAtlas('sserafim-lipsync', "sserafim");
    lipSyncSprite.anim.addBySymbol("lipsync", boyfriend.getDefaultSymbol(), 24, false);
}