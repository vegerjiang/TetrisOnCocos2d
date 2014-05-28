//
//  GamePlayScene.m
//  TetrisOnCocos2d
//
//  Created by JiangHuifu on 14-5-28.
//  Copyright (c) 2014年 veger. All rights reserved.
//

#import "GamePlayScene.h"
#import "cocos2d-ui.h"
@interface GamePlayScene()
@property(nonatomic,retain) NSMutableArray* aBlocks;
@property(nonatomic,retain) CCSprite* activeSprite;
@property(nonatomic,assign) CGPoint startPoint;
@property(nonatomic,assign) CGFloat blockSize;
@property(nonatomic,assign) NSUInteger blockNum;
@end
@implementation GamePlayScene
+(GamePlayScene *)scene{
    return [[self alloc] init];
}
-(id)init{
    if (self = [super init]) {
        self.physicsBody = [CCPhysicsBody bodyWithRect:CGRectMake(0, 0, self.contentSize.width, self.contentSize.height) cornerRadius:0];
        _blockNum = 5;
        self.blockSize = MIN(self.contentSize.width/_blockNum, self.contentSize.height/_blockNum);
        _aBlocks = [[NSMutableArray alloc] init];
        CCNodeColor* background = [CCNodeColor nodeWithColor:[CCColor colorWithRed:0.2 green:0.5 blue:0.5 alpha:1]];
        [self addChild:background];
        _activeSprite = nil;
        self.userInteractionEnabled = YES;
        
    }
    return self;
}
-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    _startPoint = [touch locationInNode:self];
    _activeSprite = [CCSprite spriteWithImageNamed:@"Icon-72.png"];
    _activeSprite.scaleX = _blockSize/_activeSprite.contentSize.width;
    _activeSprite.scaleY = _blockSize/_activeSprite.contentSize.height;
    [_aBlocks addObject:_activeSprite];
    _activeSprite.position = _startPoint;
    [self addChild:_activeSprite];
    
}
-(void)touchMoved:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint currentPoint = [touch locationInNode:self];
    CCActionMoveTo *actionMove = [CCActionMoveTo actionWithDuration:0.1f position:ccp(_activeSprite.position.x+currentPoint.x-_startPoint.x, _activeSprite.position.y+currentPoint.y-_startPoint.y)];
    [_activeSprite runAction:actionMove];
    _startPoint = currentPoint;
}
-(void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    
}
-(void)touchCancelled:(UITouch *)touch withEvent:(UIEvent *)event{
    
}
@end
