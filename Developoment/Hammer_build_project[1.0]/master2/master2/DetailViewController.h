//
//  DetailViewController.h
//  master2
//
//  Created by user on 04/01/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "actionPictureProtocol.h"
#import "actionPresetProtocol.h"
#import "actionCoinProtocol.h"

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,actionPictureProtocol,actionPresetProtocol,UIPopoverControllerDelegate,actionCoinProtocol>

@property (strong, nonatomic) id detailItem;
@property (strong,nonatomic)  id presetItem;

@property (weak, nonatomic) IBOutlet UITextField *telDefault;

@property (nonatomic, retain) IBOutlet UIPopoverController *poc;

@property (nonatomic, retain) IBOutlet UIPopoverController *pocPreset;

@property (nonatomic, retain) IBOutlet UIPopoverController *pocCoin;

@property (weak, nonatomic) IBOutlet UIButton *buttonPreset;

@property (weak, nonatomic) IBOutlet UILabel *labelPresetName;
@property (weak, nonatomic) IBOutlet UILabel *labelLastPreset;

@property (weak, nonatomic) IBOutlet UISwitch *switchPreset;

@property (weak, nonatomic) IBOutlet UISwitch *switchDateInit;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollview;

@property (weak, nonatomic) IBOutlet UIView *containerView;

@property (weak, nonatomic) IBOutlet UIView *backgroundView;

@property (weak, nonatomic) IBOutlet UILabel *recommendButton;

@property (weak, nonatomic) IBOutlet UIButton *buttonDeleteRecommend;



// Header
@property (weak, nonatomic) IBOutlet UISegmentedControl *languageControlSegment;
@property (weak, nonatomic) IBOutlet UILabel *buttonCoinLabel;

@property (weak, nonatomic) IBOutlet UILabel *labelProcess;
@property (weak, nonatomic) IBOutlet UILabel *labelDate;

// Insurance
@property (weak, nonatomic) IBOutlet UITextField *insuranceName;
@property (weak, nonatomic) IBOutlet UITextField *contractNo;
@property (weak, nonatomic) IBOutlet UITextField *agency;
@property (weak, nonatomic) IBOutlet UITextField *insuranceTel;
@property (weak, nonatomic) IBOutlet UITextField *insuredForClimate;

//Body Shop
@property (weak, nonatomic) IBOutlet UITextField *bodyName;
@property (weak, nonatomic) IBOutlet UITextField *bodyAdress;

@property (weak, nonatomic) IBOutlet UITextField *bodyPostaCode;
@property (weak, nonatomic) IBOutlet UITextField *bodyCity;
@property (weak, nonatomic) IBOutlet UITextField *bodyTel;

//Veicle

@property (weak, nonatomic) IBOutlet UITextField *veicleBrand;
@property (weak, nonatomic) IBOutlet UITextField *veicleModel;

@property (weak, nonatomic) IBOutlet UITextField *veicleLicense;

@property (weak, nonatomic) IBOutlet UITextField *veicleCarFrame;
@property (weak, nonatomic) IBOutlet UITextField *veicleYear;
@property (weak, nonatomic) IBOutlet UITextField *veicleKm;
@property (weak, nonatomic) IBOutlet UITextField *veicleRepairedFor;
@property (weak, nonatomic) IBOutlet UIView *veicleColorView;

// Parts


// * damage
@property (weak, nonatomic) IBOutlet UITextField *bonnetDamage;
@property (weak, nonatomic) IBOutlet UITextField *roofDamage;
@property (weak, nonatomic) IBOutlet UITextField *sunRoofDamage;
@property (weak, nonatomic) IBOutlet UITextField *bootDamage;
@property (weak, nonatomic) IBOutlet UITextField *frontLeftWingDamage;

@property (weak, nonatomic) IBOutlet UITextField *frontRightWingDamage;

@property (weak, nonatomic) IBOutlet UITextField *backLeftWingDamage;

@property (weak, nonatomic) IBOutlet UITextField *backRightWingDamage;
@property (weak, nonatomic) IBOutlet UITextField *frontLeftDoorDamage;

@property (weak, nonatomic) IBOutlet UITextField *frontRightDoorDamage;
@property (weak, nonatomic) IBOutlet UITextField *backLeftDoorDamage;
@property (weak, nonatomic) IBOutlet UITextField *backRightDoorDamage;

@property (weak, nonatomic) IBOutlet UITextField *leftRoofPilarDamage;
@property (weak, nonatomic) IBOutlet UITextField *rightRoofPilarDamage;

@property (weak, nonatomic) IBOutlet UITextField *otherDamage;

// * count
@property (weak, nonatomic) IBOutlet UITextField *bonnetCount;
@property (weak, nonatomic) IBOutlet UITextField *roofCount;

@property (weak, nonatomic) IBOutlet UITextField *sunRoofCount;

@property (weak, nonatomic) IBOutlet UITextField *bootCount;


@property (weak, nonatomic) IBOutlet UITextField *FrontLeftWingCount;

@property (weak, nonatomic) IBOutlet UITextField *FrontRightWingCount;

@property (weak, nonatomic) IBOutlet UITextField *backLeftWingCount;

@property (weak, nonatomic) IBOutlet UITextField *backRightWingCount;

@property (weak, nonatomic) IBOutlet UITextField *frontLeftDoorCount;
@property (weak, nonatomic) IBOutlet UITextField *frontRightDoorCount;


@property (weak, nonatomic) IBOutlet UITextField *backLeftDoorCount;

@property (weak, nonatomic) IBOutlet UITextField *backRightDoorCount;
@property (weak, nonatomic) IBOutlet UITextField *leftRoofPilarCount;

@property (weak, nonatomic) IBOutlet UITextField *rightRoofPilarCount;
@property (weak, nonatomic) IBOutlet UITextField *otherCount;

// * Price
@property (weak, nonatomic) IBOutlet UITextField *bonnetPrice;
@property (weak, nonatomic) IBOutlet UITextField *roofPrice;
@property (weak, nonatomic) IBOutlet UITextField *sunRoofPrice;
@property (weak, nonatomic) IBOutlet UITextField *bootPrice;
@property (weak, nonatomic) IBOutlet UITextField *frontLeftWingPrice;
@property (weak, nonatomic) IBOutlet UITextField *frontRightWingPrice;
@property (weak, nonatomic) IBOutlet UITextField *backLeftWingPrice;
@property (weak, nonatomic) IBOutlet UITextField *backRightWingPrice;
@property (weak, nonatomic) IBOutlet UITextField *frontLeftDoorPrice;
@property (weak, nonatomic) IBOutlet UITextField *frontRightDoorPrice;
@property (weak, nonatomic) IBOutlet UITextField *backLeftDoorPrice;
@property (weak, nonatomic) IBOutlet UITextField *backRightDoorPrice;
@property (weak, nonatomic) IBOutlet UITextField *leftRoofPilarPrice;
@property (weak, nonatomic) IBOutlet UITextField *rightRoofPilarPrice;
@property (weak, nonatomic) IBOutlet UITextField *otherPrice;


// * Switch
@property (weak, nonatomic) IBOutlet UISwitch *bonnetSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *roofSwitch;

@property (weak, nonatomic) IBOutlet UISwitch *sunRoofSwitch;

@property (weak, nonatomic) IBOutlet UISwitch *bootSwitch;

@property (weak, nonatomic) IBOutlet UISwitch *frontLeftWingSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *frontRightWingSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *backLeftWingSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *backRightWingSwitch;

@property (weak, nonatomic) IBOutlet UISwitch *frontLeftDoorSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *frontRightDoorSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *backLeftDoorSwitch;

@property (weak, nonatomic) IBOutlet UISwitch *backRightDoorSwitch;

@property (weak, nonatomic) IBOutlet UISwitch *leftRoofPilarSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *rightRoofPilarSwitch;

@property (weak, nonatomic) IBOutlet UISwitch *otherSwitch;



// * $
@property (weak, nonatomic) IBOutlet UITextField *dis;
@property (weak, nonatomic) IBOutlet UITextField *total;

//DataPicker
@property (weak, nonatomic) IBOutlet UIDatePicker *dateInitWork;

@property (weak, nonatomic) IBOutlet UIButton *grayColor;

// Pictures

@property (weak, nonatomic) IBOutlet UIImageView *pic1;

@property (weak, nonatomic) IBOutlet UIImageView *pic2;

@property (weak, nonatomic) IBOutlet UIImageView *pic3;

@property (weak, nonatomic) IBOutlet UIImageView *pic4;

@property (weak, nonatomic) IBOutlet UIImageView *pic5;

@property (weak, nonatomic) IBOutlet UIImageView *pic6;


@property (weak, nonatomic) IBOutlet UIImageView *pic7;

@property (weak, nonatomic) IBOutlet UIImageView *pic8;

@property (weak, nonatomic) IBOutlet UIImageView *pic9;
@property (weak, nonatomic) IBOutlet UIImageView *pic10;
@property (weak, nonatomic) IBOutlet UIImageView *pic11;


@property (weak, nonatomic) IBOutlet UIImageView *pic12;

@end
