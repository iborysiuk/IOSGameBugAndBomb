//
//  YSBMyScene.m
//  LabBugAndBomb
//
//  Created by macadmin on 2014-11-18.
//  Copyright (c) 2014 com.example. All rights reserved.
//

#import "YSBMyScene.h"
#import "YSBMainScene.h"

@implementation YSBMyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:((float)((197)))/255.0
                                               green:((float)((197)))/255.0
                                                blue:((float)(197))/255.0 alpha:1.0f];
        
        SKSpriteNode *button = [SKSpriteNode spriteNodeWithImageNamed:@"button"];
        
        button.name = @"Start Game";
        button.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        
        [self addChild:button];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        
        CGPoint location = [touch locationInNode:self];
        
        SKNode *node = [self nodeAtPoint:location];
        
        //if label touched, start transition to next scene
        if ([node.name isEqualToString:@"Start Game"]) {
            NSLog(@"start Game pressed");
            
            SKScene *mainscene = [[YSBMainScene alloc] initWithSize:self.size];
            SKTransition *transition = [SKTransition flipVerticalWithDuration:0.5];
            [self.view presentScene:mainscene transition:transition];
        }
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
