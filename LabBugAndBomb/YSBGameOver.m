//
//  YSBGameOver.m
//  LabBugAndBomb
//
//  Created by macadmin on 2014-11-18.
//  Copyright (c) 2014 com.example. All rights reserved.
//

#import "YSBGameOver.h"
#import "YSBMainScene.h"

@implementation YSBGameOver
-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        self.backgroundColor = [SKColor colorWithRed:((float)((144)))/255.0
                                               green:((float)((230)))/255.0
                                                blue:((float)(20))/255.0 alpha:1.0f];
        
        SKLabelNode *msg = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Wide"];
        msg.text = @"Game Over";
        msg.fontSize = 35;
        msg.position = CGPointMake(170, 350);
        SKLabelNode *msgscore = [SKLabelNode labelNodeWithFontNamed:@"MarkerFelt-Wide"];
        msgscore.text =[defaults stringForKey:@"score"];
        msgscore.fontSize = 35;
        msgscore.position = CGPointMake(170, 300);
        
        
        SKSpriteNode *button = [SKSpriteNode spriteNodeWithImageNamed:@"try_again_button.png"];
        
        button.name = @"Try Again";
        button.position = CGPointMake(CGRectGetMidX(self.frame),
                                      CGRectGetMidY(self.frame));
        
        [self addChild:button];
        [self addChild:msg];
        [self addChild:msgscore];

    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        
        CGPoint location = [touch locationInNode:self];
        
        SKNode *node = [self nodeAtPoint:location];
        
        //if label touched, start transition to next scene
        if ([node.name isEqualToString:@"Try Again"]) {
            NSLog(@"start Game pressed");
            
            SKScene *mainscene = [[YSBMainScene alloc] initWithSize:self.size];
            SKTransition *transition = [SKTransition flipVerticalWithDuration:0.5];
            [self.view presentScene:mainscene transition:transition];
        }
    }
}

@end
