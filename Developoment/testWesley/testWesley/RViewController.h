//
//  RViewController.h
//  testWesley
//
//  Created by user on 01/01/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface RViewController : UIViewController<UITextFieldDelegate,MFMailComposeViewControllerDelegate>


@property (nonatomic,retain) IBOutlet UIView * viewBack;

@property (weak, nonatomic) IBOutlet UIScrollView *scroll;

@property (weak, nonatomic) IBOutlet UIButton *generate;


@end
