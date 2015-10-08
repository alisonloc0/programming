//
//  ViewController.m
//  testeDataImage
//
//  Created by user on 08/01/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	NSLog(@"Downloading...");
	// Get an image from the URL below
	UIImage *image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://marydesa.com/images/img_bola.png"]]];
	
	NSLog(@"%f,%f",image.size.width,image.size.height);
	
	// Let's save the file into Document folder.
	// You can also change this to your desktop for testing. (e.g. /Users/kiichi/Desktop/)
	// NSString *deskTopDir = @"/Users/kiichi/Desktop";
	
	NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
	
	// If you go to the folder below, you will find those pictures
	NSLog(@"%@",docDir);
	
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dataPath = [docDir stringByAppendingPathComponent:@"/MyFolder"];
    
    NSError * error;
    if (![[NSFileManager defaultManager] fileExistsAtPath:dataPath])
        [[NSFileManager defaultManager] createDirectoryAtPath:dataPath withIntermediateDirectories:NO attributes:nil error:&error]; //Create folder
    
	NSLog(@"saving png");
	NSString *pngFilePath = [NSString stringWithFormat:@"%@/test3.png",dataPath];
	NSData *data1 = [NSData dataWithData:UIImagePNGRepresentation(image)];
	[data1 writeToFile:pngFilePath atomically:YES];
	
	NSLog(@"saving jpeg");
	NSString *jpegFilePath = [NSString stringWithFormat:@"%@/test3.jpeg",dataPath];
	NSData *data2 = [NSData dataWithData:UIImageJPEGRepresentation(image, 1.0f)];//1.0f = 100% quality
	[data2 writeToFile:jpegFilePath atomically:YES];
	
	NSLog(@"saving image done");

	if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *imagePickerCamera =[[UIImagePickerController alloc] init];
        imagePickerCamera.delegate = self;
        imagePickerCamera.allowsEditing = YES;
        imagePickerCamera.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        [self presentViewController:imagePickerCamera  animated:YES completion:nil];
    }
    
    else if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum])
    {
        UIImagePickerController *imagePickerAlbum =[[UIImagePickerController alloc] init];
        imagePickerAlbum.delegate = self;
        imagePickerAlbum.allowsEditing = YES;
        imagePickerAlbum.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        [self presentViewController:imagePickerAlbum animated:YES completion:nil];
    }
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{

        NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];



}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{

}

@end
