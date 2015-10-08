//
//  INITViewController.h
//  date
//
//  Created by user on 10/10/13.
//  Copyright (c) 2013 User. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "mainContentProtocol.h"

@interface INITViewController : UIViewController<mainContentProtocol>
{
    id<mainContentProtocol> delegate;
    
}

@property (retain )id delegate;
@property (assign, nonatomic) NSInteger index;
@property (retain, nonatomic) NSString * pathImage;


@property (retain, nonatomic) IBOutlet UILabel * label1;
@property (retain, nonatomic) NSString * NSlabel1;


@property (retain, nonatomic) IBOutlet UILabel * label2;
@property (retain, nonatomic) NSString * NSlabel2;


@property (retain, nonatomic) IBOutlet UILabel * label3;
@property (retain, nonatomic) NSString * NSlabel3;


@property (retain, nonatomic) IBOutlet UILabel * label4;
@property (retain, nonatomic) NSString * NSlabel4;


@property (retain, nonatomic) IBOutlet UILabel * label5;
@property (retain, nonatomic) NSString * NSlabel5;


@property (retain, nonatomic) IBOutlet UILabel * label6;
@property (retain, nonatomic) NSString * NSlabel6;


@property (retain, nonatomic) IBOutlet UILabel * label7;
@property (retain, nonatomic) NSString * NSlabel7;


@property (retain, nonatomic) IBOutlet UILabel * label8;
@property (retain, nonatomic) NSString * NSlabel8;

@property (retain, nonatomic) IBOutlet UILabel * label9;
@property (retain, nonatomic) NSString * NSlabel9;



@property (nonatomic) int indexImage;

@end
