//
//  YSBMainScene.m
//  LabBugAndBomb
//
//  Created by macadmin on 2014-11-18.
//  Copyright (c) 2014 com.example. All rights reserved.
//

#import "YSBMainScene.h"
#import "YSBGameOver.h"

@implementation YSBMainScene

int game_score;
SKLabelNode *score;
SKLabelNode *countdown;
BOOL startGame;
NSTimeInterval startTime;
NSInteger timescore;
SKSpriteNode *bomb;
SKSpriteNode *bug;

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        timescore = 2;
        self.backgroundColor = [SKColor colorWithRed:((float)((197)))/255.0
                                               green:((float)((197)))/255.0
                                                blue:((float)(197))/255.0 alpha:1.0f];
        
        score = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Wide"];
        score.text = @"Score:";
        score.fontSize = 20;
        score.position = CGPointMake(50, 420);
        
        countdown = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Wide"];
        countdown.text = @"Time:";
        countdown.fontSize = 20;
        countdown.position = CGPointMake(250, 420);
        countdown.text = [NSString stringWithFormat:@"Score: %d", timescore];
        
        bug = [SKSpriteNode spriteNodeWithImageNamed:@"bug"];
        
        bug.name = @"bug";
        bug.position = CGPointMake(100, 100);
        bug.zPosition = 50;
        
        bomb = [SKSpriteNode spriteNodeWithImageNamed:@"bomb"];
        
        bomb.name = @"bomb";
        bomb.position = CGPointMake(250, 250);
        bomb.zPosition = 50;
        

        
        [self runAction:[SKAction repeatActionForever:[SKAction sequence:@[
                             [SKAction waitForDuration:3.0], [SKAction runBlock:^{
            bomb.position = CGPointMake(arc4random() % (NSInteger)( self.frame.size.width / 2 ), arc4random() % (NSInteger)( self.frame.size.height / 2 ));
            
            bug.position = CGPointMake(arc4random() % (NSInteger)( self.frame.size.width / 2 ), arc4random() % (NSInteger)( self.frame.size.height / 2 ));

            
    }]
                             ]] ]];
        
        [self runAction:[SKAction repeatActionForever:[SKAction sequence:@[
                                                                           [SKAction waitForDuration:1.0], [SKAction runBlock:^{

             timescore--;
             countdown.text = [NSString stringWithFormat:@"Score: %d", timescore];
             if (timescore == 0) {
                 NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                 [defaults setObject:[NSString stringWithFormat:@"Score: %d", game_score] forKey:@"score"];
                 [defaults synchronize];
                 
             SKScene *gameover = [[YSBGameOver alloc] initWithSize:self.size];
             SKTransition *transition = [SKTransition flipVerticalWithDuration:0.5];
             [self.view presentScene:gameover transition:transition];
             
             }
            
        }]
                                                                           ]] ]];
        
        [self addChild:countdown];
        [self addChild:score];
        [self addChild:bug];
        [self addChild:bomb];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch * touch = [touches anyObject];
    SKSpriteNode *touchNode = (SKSpriteNode *)[self nodeAtPoint:[touch locationInNode:self]];
    CGPoint location = [touch locationInNode:self];
    if (CGRectContainsPoint(countdown.frame, location)) {
         startGame = YES;
    }
    
    if ([touchNode.name  isEqual: @"bug"]) {
        
        game_score++;
        score.text = [NSString stringWithFormat:@"Score: %d", game_score];
        
    }
    
    if ([touchNode.name isEqual:@"bomb"]) {
        if (game_score == 0) {
            game_score = 0;
        } else {
            game_score--;
        }
        score.text = [NSString stringWithFormat:@"Score: %d", game_score];
    }

}

-(void)update:(CFTimeInterval)currentTime {
    
    /* Called before each frame is rendered */

    //reset counter if starting
  /*  if (startGame){
        startTime = currentTime;
        startGame = NO;
    }
    
    int countDownInt = (int)(currentTime-startTime);
    if(countDownInt>0){  //if counting down to 0 show counter
        countdown.text = [NSString stringWithFormat:@"Time: %i", countDownInt];
    }else { //if not show message, dismiss, whatever you need to do.
        countdown.text=@"GO!";*/

  // }
}

@end
