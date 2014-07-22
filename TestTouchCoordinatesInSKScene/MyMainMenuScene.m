//
//  MyMainMenuScene.m
//  TestTouchCoordinatesInSKScene
//
//  Created by Jennifer Dobson on 7/21/14.
//  Copyright (c) 2014 Jennifer Dobson. All rights reserved.
//

#import "MyMainMenuScene.h"
#import "MyViewController.h"

@interface MyMainMenuScene()

@property (nonatomic, strong) SKLabelNode* playLabel;
@property (nonatomic, strong) SKLabelNode* setupLabel;
@property (nonatomic, strong) SKLabelNode* navNode;

@end


@implementation MyMainMenuScene



-(CGPoint)navNodePosition
{
    return CGPointMake(700,100);
}

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        _navNode = [SKLabelNode node];
        _navNode.position = [self navNodePosition];
        _navNode.text = @"Return to Main Menu";
        _setupLabel.fontColor = [UIColor whiteColor];
        _setupLabel.fontSize = 24;
        
        [self addChild:_navNode];
        
    }
    return self;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    BOOL shouldSegueToMainMenu = NO;
    
    NSLog(@"scene frame size:%f,%f",self.frame.size.width,self.frame.size.height);
    
    
    for (UITouch* touch in touches) {
        CGPoint touchLocation = [touch locationInNode:self];
        
        NSLog(@"location:%f,%f",touchLocation.x,touchLocation.y);
        NSLog(@"navNode Position:%f,%f",self.navNode.position.x,self.navNode.position.y);
        
        
        if ([self.navNode containsPoint:touchLocation]) {
            shouldSegueToMainMenu = YES;
            break;
        }
    }
    
    if (shouldSegueToMainMenu)
    {
        [self.controller returnToMainMenu];
    }
    
}

@end
