//
//  ViewController.m
//  camera
//
//  Created by user on 24/01/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import "ViewController.h"
#import "imageViewController.h"
@interface ViewController ()
{
    int con;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    con=0;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    tap.numberOfTapsRequired = 1;
    tap.cancelsTouchesInView = NO;
    self.imageTake.userInteractionEnabled = YES;
    [self.imageTake addGestureRecognizer:tap];
    
}

-(IBAction)handleTap:(id)sender
{
    imageViewController * imageController = [[imageViewController alloc]init];
    imageController.modalTransitionStyle = UIModalPresentationFullScreen;
    [imageController setImageV:self.imageTake.image];
    [self presentViewController:imageController animated:YES completion:nil];
    
}

-(void)viewDidAppear:(BOOL)animated{
    

    if(con == 0){
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];

        }
        else
        {
            [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
            

            
        }
        
        [imagePicker setDelegate:self];
        [self presentViewController:imagePicker animated:YES completion:nil];
    }

        con++;
    
    

}
-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.imageTake.image = image;

    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
