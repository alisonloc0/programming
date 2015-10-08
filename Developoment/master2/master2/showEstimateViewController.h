//
//  showEstimateViewController.h
//  master2
//
//  Created by user on 28/01/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface showEstimateViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (strong,nonatomic)  id presetItem;

@property (weak, nonatomic) IBOutlet UILabel *labelTelDefault;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIView *backgroundView;

@property (weak, nonatomic) IBOutlet UILabel *protocolLabel;

// Insurence

@property (weak, nonatomic) IBOutlet UILabel *nameInsurenceLabel;
@property (weak, nonatomic) IBOutlet UILabel *contractInsurenceLabel;
@property (weak, nonatomic) IBOutlet UILabel *agencyInsurenceLabel;
@property (weak, nonatomic) IBOutlet UILabel *telInsurenceLabel;
@property (weak, nonatomic) IBOutlet UILabel *insuredInsurenceLabel;

// Body Shop
@property (weak, nonatomic) IBOutlet UILabel *nameBody;
@property (weak, nonatomic) IBOutlet UILabel *adressBody;

@property (weak, nonatomic) IBOutlet UILabel *postaCodeBody;
@property (weak, nonatomic) IBOutlet UILabel *cityBody;
@property (weak, nonatomic) IBOutlet UILabel *telBody;


// Veicle

@property (weak, nonatomic) IBOutlet UILabel *brandVeicle;

@property (weak, nonatomic) IBOutlet UILabel *modelVeicle;

@property (weak, nonatomic) IBOutlet UIView *colorVeicle;

@property (weak, nonatomic) IBOutlet UILabel *licenseVeicle;

@property (weak, nonatomic) IBOutlet UILabel *carFrameVeicle;
@property (weak, nonatomic) IBOutlet UILabel *yearVeicle;

@property (weak, nonatomic) IBOutlet UILabel *kmVeicle;

@property (weak, nonatomic) IBOutlet UILabel *repairedForVeicle;

//Parts

@property (weak, nonatomic) IBOutlet UILabel *damageBonnet;
@property (weak, nonatomic) IBOutlet UILabel *countBonnet;
@property (weak, nonatomic) IBOutlet UILabel *priceBonnet;
@property (weak, nonatomic) IBOutlet UILabel *paintBonnet;


@property (weak, nonatomic) IBOutlet UILabel *damageRoof;
@property (weak, nonatomic) IBOutlet UILabel *countRoof;
@property (weak, nonatomic) IBOutlet UILabel *priceRoof;
@property (weak, nonatomic) IBOutlet UILabel *paintRoof;


@property (weak, nonatomic) IBOutlet UILabel *damageSunRoof;
@property (weak, nonatomic) IBOutlet UILabel *countSunRoof;
@property (weak, nonatomic) IBOutlet UILabel *priceSunRoof;
@property (weak, nonatomic) IBOutlet UILabel *paintSunRoof;


@property (weak, nonatomic) IBOutlet UILabel *damageBoot;
@property (weak, nonatomic) IBOutlet UILabel *countBoot;
@property (weak, nonatomic) IBOutlet UILabel *priceBoot;
@property (weak, nonatomic) IBOutlet UILabel *paintBoot;


@property (weak, nonatomic) IBOutlet UILabel *damageFrontLeftWing;
@property (weak, nonatomic) IBOutlet UILabel *countFrontLeftWing;
@property (weak, nonatomic) IBOutlet UILabel *priceFrontLeftWing;
@property (weak, nonatomic) IBOutlet UILabel *paintFrontLeftWing;


@property (weak, nonatomic) IBOutlet UILabel *damageFrontRightWing;
@property (weak, nonatomic) IBOutlet UILabel *countdamageFrontRightWing;
@property (weak, nonatomic) IBOutlet UILabel *pricedamageFrontRightWing;
@property (weak, nonatomic) IBOutlet UILabel *paintdamageFrontRightWing;



@property (weak, nonatomic) IBOutlet UILabel *damageBackLeftWing;
@property (weak, nonatomic) IBOutlet UILabel *countBackLeftWing;
@property (weak, nonatomic) IBOutlet UILabel *priceBackLeftWing;
@property (weak, nonatomic) IBOutlet UILabel *paintBackLeftWing;


@property (weak, nonatomic) IBOutlet UILabel *damageBackRightWing;
@property (weak, nonatomic) IBOutlet UILabel *countBackRightWing;
@property (weak, nonatomic) IBOutlet UILabel *priceBackRightWing;
@property (weak, nonatomic) IBOutlet UILabel *paintBackRightWing;

@property (weak, nonatomic) IBOutlet UILabel *damageFrontLeftDoor;
@property (weak, nonatomic) IBOutlet UILabel *countFrontLeftDoor;
@property (weak, nonatomic) IBOutlet UILabel *priceFrontLeftDoor;
@property (weak, nonatomic) IBOutlet UILabel *paintFrontLeftDoor;

@property (weak, nonatomic) IBOutlet UILabel *damageFrontRightDoor;
@property (weak, nonatomic) IBOutlet UILabel *countFrontRightDoor;
@property (weak, nonatomic) IBOutlet UILabel *priceFrontRightDoor;
@property (weak, nonatomic) IBOutlet UILabel *paintFrontRightDoor;


@property (weak, nonatomic) IBOutlet UILabel *damageBackLeftDoor;
@property (weak, nonatomic) IBOutlet UILabel *countBackLeftDoor;
@property (weak, nonatomic) IBOutlet UILabel *priceBackLeftDoor;
@property (weak, nonatomic) IBOutlet UILabel *paintBackLeftDoor;


@property (weak, nonatomic) IBOutlet UILabel *damageBackRightDoor;
@property (weak, nonatomic) IBOutlet UILabel *countBackRightDoor;
@property (weak, nonatomic) IBOutlet UILabel *priceBackRightDoor;
@property (weak, nonatomic) IBOutlet UILabel *paintBackRightDoor;

@property (weak, nonatomic) IBOutlet UILabel *damageLeftRoofPilar;
@property (weak, nonatomic) IBOutlet UILabel *countLeftRoofPilar;
@property (weak, nonatomic) IBOutlet UILabel *priceLeftRoofPilar;
@property (weak, nonatomic) IBOutlet UILabel *paintLeftRoofPilar;

@property (weak, nonatomic) IBOutlet UILabel *damageRightRoofPilar;
@property (weak, nonatomic) IBOutlet UILabel *countRightRoofPilar;
@property (weak, nonatomic) IBOutlet UILabel *priceRightRoofPilar;
@property (weak, nonatomic) IBOutlet UILabel *paintRightRoofPilar;

@property (weak, nonatomic) IBOutlet UILabel *damageOther;
@property (weak, nonatomic) IBOutlet UILabel *countOther;
@property (weak, nonatomic) IBOutlet UILabel *priceOther;
@property (weak, nonatomic) IBOutlet UILabel *paintOther;



// Reassembly
@property (weak, nonatomic) IBOutlet UILabel *dis;

@property (weak, nonatomic) IBOutlet UILabel *total;
// Signatures
@property (weak, nonatomic) IBOutlet UILabel *dataProcess;

@property (weak, nonatomic) IBOutlet UILabel *dataInit;



@end
