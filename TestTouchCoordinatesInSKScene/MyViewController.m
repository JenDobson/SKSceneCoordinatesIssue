//
//  MyViewController.m
//  TestTouchCoordinatesInSKScene
//
//  Created by Jennifer Dobson on 7/21/14.
//  Copyright (c) 2014 Jennifer Dobson. All rights reserved.
//

#import "MyViewController.h"
#import <SpriteKit/SpriteKit.h>
#import "MyMainMenuScene.h"

@interface MyViewController ()

@property (nonatomic, strong) MyMainMenuScene *mainMenuScene;

@end

@implementation MyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    SKView* skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    CGSize contentSize = CGSizeMake(skView.bounds.size.width,skView.bounds.size.height);
    
    _mainMenuScene = [MyMainMenuScene sceneWithSize:contentSize];
    _mainMenuScene.controller = self;
    _mainMenuScene.scaleMode = SKSceneScaleModeAspectFill;
    
    
    [skView presentScene:_mainMenuScene];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadView
{
    CGRect viewFrame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width);
    SKView* view = [[SKView alloc] initWithFrame:viewFrame];
    self.view = view;
}

-(void)returnToMainMenu
{
    [(SKView*)self.view presentScene:_mainMenuScene transition:[SKTransition moveInWithDirection:SKTransitionDirectionRight duration:.3]];

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
