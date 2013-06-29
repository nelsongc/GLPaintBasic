//
//  ViewController.m
//  GLPaintComplete
//
//  Created by Nelson G on 6/28/13.
//  Copyright (c) 2013 ObjectGR. All rights reserved.
//

#import "ViewController.h"
#import "PaintingView.h"

@interface ViewController (){
    float scale;
    BOOL isErasing;
}
@property (nonatomic, retain) UIColor* currentColor;
@property (nonatomic, retain) PaintingView* paintingView;

@end

@implementation ViewController
@synthesize currentColor=_currentColor;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    isErasing = NO;
    
    CGRect frame = bg.frame;
    self.paintingView = [[PaintingView alloc] initWithFrame:frame];
    self.paintingView.backgroundColor= [UIColor clearColor];
    [self.view addSubview:_paintingView];
    
    scalePincel.minimumValue = 1.0;
    scalePincel.maximumValue = 3.0;
    scalePincel.value = scale = 1.5;
    
    self.currentColor = [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0];
    UIColor* aColor = _currentColor;
    const CGFloat *components = CGColorGetComponents(aColor.CGColor);
    
    [self.paintingView setBrushColorWithRed:components[0] green:components[1] blue:components[2] alpha:components[3] scale:scale];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)changeColor:(UIButton*)sender{
    isErasing = NO;
    switch (sender.tag) {
        case 0:
            self.currentColor = [UIColor colorWithRed:162.0/255.0 green:193.0/255.0 blue:249.0/255.0 alpha:1.0];
            break;
        case 1:
            self.currentColor = [UIColor colorWithRed:183.0/255.0 green:252.0/255.0 blue:196.0/255.0 alpha:1.0];
            break;
        case 2:
            self.currentColor = [UIColor colorWithRed:216.0/255.0 green:152.0/255.0 blue:248.0/255.0 alpha:1.0];
            break;
        case 3:
            self.currentColor = [UIColor colorWithRed:231.0/255.0 green:150.0/255.0 blue:150.0/255.0 alpha:1.0];
            break;
        case 4:
            self.currentColor = [UIColor colorWithRed:239.0/255.0 green:253.0/255.0 blue:160.0/255.0 alpha:1.0];
            break;
        default:
            self.currentColor = [UIColor colorWithRed:255.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0];
            break;
    }
    
    const CGFloat *components = CGColorGetComponents(_currentColor.CGColor);
    [self.paintingView setBrushColorWithRed:components[0] green:components[1] blue:components[2] alpha:components[3] scale:scale];
}
- (IBAction)changeScale:(UISlider*)sender{
    scale = sender.value;
    if (isErasing) {
        [self.paintingView setBrushToEraseWithScale:scale];
    }else{
        const CGFloat *components = CGColorGetComponents(_currentColor.CGColor);
        [self.paintingView setBrushColorWithRed:components[0] green:components[1] blue:components[2] alpha:components[3] scale:scale];
    }
    
}
-(void)eraserPincel:(id)sender{
    isErasing = YES;
    [self.paintingView setBrushToEraseWithScale:scale];
}
- (void)clearScene:(id)sender{
    isErasing = NO;
    [self.paintingView erase];
}
- (void)showPoints:(id)sender{
    NSLog(@"Points: %@", _paintingView.returnPoints);
}
@end
