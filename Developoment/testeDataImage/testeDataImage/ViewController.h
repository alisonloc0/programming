//
//  ViewController.h
//  testeDataImage
//
//  Created by user on 08/01/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
