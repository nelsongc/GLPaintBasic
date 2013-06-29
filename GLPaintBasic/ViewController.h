//
//  ViewController.h
//  GLPaintComplete
//
//  Created by Nelson G on 6/28/13.
//  Copyright (c) 2013 ObjectGR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    IBOutlet UIImageView* bg;
    IBOutlet UISlider* scalePincel;
}
- (IBAction)changeScale:(UISlider*)sender;
- (IBAction)changeColor:(UIButton*)sender;
- (IBAction)eraserPincel:(id)sender;
- (IBAction)clearScene:(id)sender;
- (IBAction)showPoints:(id)sender;


@end
