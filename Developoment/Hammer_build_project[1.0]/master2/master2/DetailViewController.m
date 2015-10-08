//
//  DetailViewController.m
//  master2
//
//  Created by user on 04/01/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import "DetailViewController.h"
#import "Colors.h"
#import "Estimates.h"
#import "Veicle.h"
#import "Insurance.h"
#import "Body_shop_repaire.h"
#import "Parts.h"
#import "Espec_part.h"
#import "Pictures.h"
#import "popActionPictureViewController.h"
#import "imageViewController.h"
#import "showEstimateViewController.h"
#import "DescriptPrices.h"
#import "popPresetMenuViewController.h"
#import "AppDelegate.h"
#import "Recommend.h"
#import "languageControl.h"
#import "popCoinMenuViewController.h"
#import "coinControl.h"
#import "preferencesDefault.h"

@interface DetailViewController (){

    // USADO PARA O CALCULO DA CENTRALIZACAO DO LAYOUT
    int xPortrait;
    int xLands;
    
    // USADO PARA SABER A ULTIMA IMAGEM SELECIONADA
    NSInteger tagOfActivityImage;

    // USADO PARA AUTOCOMPLET
    NSMutableArray * arrayBodyShop;
    
    // USADO PARA SABER SE IRA USA PRESET
    BOOL usePreset;
    
    UITextField * activeField;
    
}
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation DetailViewController

/*
     TAGS
 
 *   1 - 64 UITextField
 *   65 - 79 UISwitcher
 *   80 -> ImageColor
     81 - 96 colorButtons
     101 - 112 imageViews
     120 - button ( autocomplete )
     130 - TextField TEL
     200 - 252 - UILabels
 
 
 */

- (void)viewDidLoad
{
    [super viewDidLoad];

       // Confiure Controls
    [self.languageControlSegment addTarget:self action:@selector(languageChangeViewValueChanged:) forControlEvents:UIControlEventValueChanged];

    
    // Configure TextFields
    
    for(NSInteger i = 1; i<=64;i++){
        UITextField * textField = (UITextField *)[self.view viewWithTag:i];
        textField.delegate = self;
    }
    // Telefone default
    UITextField * textField = (UITextField *)[self.view viewWithTag:130];
    textField.delegate = self;
    
    //Configure Colors
    for(NSInteger i = 81; i<=96;i++){
        UIButton * button = (UIButton *)[self.view viewWithTag:i];
        [button addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
    }

    //Configure Switch
    
    for(NSInteger i = 65; i<=79;i++){
        UISwitch * switch_ = (UISwitch *)[self.view viewWithTag:i];
        [switch_ addTarget:self action:@selector(UpdateSwitch:) forControlEvents:UIControlEventValueChanged];
    }
    
    // Condigure Switch of Preset
    [self.switchPreset addTarget:self action:@selector(usePresetChange:) forControlEvents:UIControlEventValueChanged];

    
    //Cofiguring Images And Action Images
    for(NSInteger i = 101; i<=112;i++){
        UIImageView * imageView = (UIImageView *)[self.view viewWithTag:i];
        
        // add tap gesture
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(popOpenImageOptions:)];
        tap.numberOfTapsRequired = 1;
        tap.cancelsTouchesInView = NO;
        imageView.userInteractionEnabled = YES;
        [imageView addGestureRecognizer:tap];
       
    }

    // add tap gesture to coin Label
    UITapGestureRecognizer *tapCoin = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(popCoinMenu:)];
    tapCoin.numberOfTapsRequired = 1;
    tapCoin.cancelsTouchesInView = NO;
    self.buttonCoinLabel.userInteractionEnabled = YES;
    [self.buttonCoinLabel addGestureRecognizer:tapCoin];
    
    // Configuring datapicker
    [self.dateInitWork addTarget:self action:@selector(dateChanged:)
     forControlEvents:UIControlEventValueChanged];
    
    // NULL Acitivty image tap
    tagOfActivityImage = 0;
    
    
    // Add Gesture do recommend button tap to insert
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(setRecommendation:)];
    
    tap.numberOfTapsRequired = 1;
    tap.cancelsTouchesInView = NO;

    self.recommendButton.userInteractionEnabled = YES;
    [self.recommendButton addGestureRecognizer:tap];
    
    // SET INITAL USE PRESET = NO
    usePreset = NO;
    
    // ConFigure Switch of date init work
    [self.switchDateInit addTarget:self action:@selector(useDateInitChange:) forControlEvents:UIControlEventValueChanged];
    
    [self configureView];
    

}

#pragma mark - Managing the detail item
- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;

        NSLog(@"NEW ITEM RECEIVE");
    
        //Update the view.
        [self configureView];
        
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

# pragma mark configuring
- (void)configureView
{
    //Remove recomendacao caso ela esteja aparecendo
    [self removeBodyRecommend];
    
    xPortrait = 15;
    xLands = 0;

    if (UIDeviceOrientationIsPortrait(self.interfaceOrientation)){
            self.containerView.frame = CGRectMake(xPortrait,self.containerView.frame.origin.y,self.containerView.frame.size.width,self.containerView.frame.size.height);
    }else{
            self.containerView.frame = CGRectMake(xLands,self.containerView.frame.origin.y,self.containerView.frame.size.width,self.containerView.frame.size.height);
    }
    
    
    self.scrollview.contentSize = CGSizeMake(0, 2600);
    
    struct CGColor * borderColor = [UIColor colorWithWhite:0.8 alpha:1.0].CGColor;
    float borderWidth  = 1.0f;
    
    self.backgroundView.layer.borderColor = borderColor;
    self.backgroundView.layer.borderWidth = borderWidth;
    UILabel * labelRecommend = (UILabel *)[self.view viewWithTag:120];
    labelRecommend.layer.borderColor = [UIColor redColor].CGColor;
    labelRecommend.layer.borderWidth = borderWidth;
    self.buttonDeleteRecommend.layer.borderColor = [UIColor redColor].CGColor;
    self.buttonDeleteRecommend.layer.borderWidth = borderWidth;
    
    // Configure labelPreset
    [self.labelPresetName setAlpha:0.4];
    self.labelPresetName.text = @"----------";
    self.presetItem = NULL;
    
    if (self.detailItem) {
        NSLog(@"ITEM SELECIONADO");
        
        
        [self cleanLayout];
        [self configureEstimate];
        [self configureInsurance];
        [self configureBody];
        [self configureVeicle];
        [self configureParts];
        [self configureImages];
        [self configureLabels];

        
        [self.containerView setAlpha:1];
        [self.containerView setUserInteractionEnabled:YES];

        
    }else{
        [self.containerView setAlpha:0.3];
                [self.containerView setUserInteractionEnabled:NO];
        NSLog(@"NENHUM ITEM SELECIONADO");

    }
    
    UIBarButtonItem * buttonOK = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(goToDoneView:)];
    
    [self.navigationItem setRightBarButtonItem:buttonOK];
    
}

-(void) cleanLayout{
    

    // Clean UITextField
    for(NSInteger i = 1; i<=64;i++){
        UITextField * textField = (UITextField *)[self.view viewWithTag:i];
        textField.text = @"";
    }
    UITextField * textField = (UITextField *)[self.view viewWithTag:130];
    textField.text = @"";
    
    //CleanUISwitcher
    for(NSInteger i = 65; i<=79;i++){
        UISwitch * switch_ = (UISwitch *)[self.view viewWithTag:i];
        [switch_ setOn:NO];
    }
    [self.switchPreset setOn:NO];
    usePreset = NO;
    
    // Clean images
    //Cofiguring Images And Action Images
    for(NSInteger i = 101; i<=112;i++){
        UIImageView * imageView = (UIImageView *)[self.view viewWithTag:i];
        imageView.image = [UIImage imageNamed:@"icon_image_default"];

    }
    
    // Clean Date Init
    [self.dateInitWork setDate:[NSDate date]];
    [self.dateInitWork setAlpha:0.3];
    [self.switchDateInit setOn:NO];

    

}
-(void) configureEstimate{
    
    // process
    Estimates * estimate = (Estimates *) self.detailItem;
    
    if(estimate.protocol == NULL){
        self.labelProcess.text = @"----";
    }
    else
        self.labelProcess.text = estimate.protocol;
    
    
    //Label preset
    if(estimate.lastPreset != NULL){
        self.labelLastPreset.text = [NSString stringWithFormat:@"%@",estimate.lastPreset];
    }else
        self.labelLastPreset.text = [NSString stringWithFormat:@"-------"];
    
    //date estimate;
    if(estimate.date_estimate == NULL)
        self.labelDate.text = @"----";
        else{
            
            NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"dd/MM/yyyy hh:mm"];
            NSString * date = [dateFormatter stringFromDate:estimate.date_estimate];
            self.labelDate.text = date;
            
        }
    
    //Language
    [self.languageControlSegment setSelectedSegmentIndex:[estimate.language intValue]];
    
    
    // ARRUMAR AQUI PARA ELE APARECER A COIN SELECIONADA
    
    //Coin
    self.buttonCoinLabel.text = [coinControl getLabelValueCoin:estimate.coin];
    
    //Repaired for
    if(estimate.repaired_for != NULL)
        self.veicleRepairedFor.text = estimate.repaired_for;
    
    //date repair
    if(estimate.date_init_work != NULL){
        [self.dateInitWork setDate:estimate.date_init_work];
        [self.switchDateInit setOn:YES];
                [self.dateInitWork setAlpha:1];
    }else{
        [self.dateInitWork setDate:[NSDate date]];
        [self.switchDateInit setOn:NO];
                [self.dateInitWork setAlpha:0.3];
    }

    
    
    // Tel default
    if(estimate.telDefault !=NULL){
        [self.telDefault setText:estimate.telDefault];
    }else
        [self.telDefault setText:@"----"];
    
    
}

-(void)configureInsurance{

    Estimates * estimate = (Estimates *) self.detailItem;
    Insurance * insurance = (Insurance *) estimate.insurance;
    
    if(insurance.name != NULL)
        self.insuranceName.text = insurance.name;

    if (insurance.contract_no != NULL)
            self.contractNo.text = insurance.contract_no;
    
    if(insurance.agency != NULL)
            self.agency.text = insurance.agency;

    if(insurance.tel != NULL)
            self.insuranceTel.text = insurance.tel;
    
    if(insurance.insured_for_climate_damage != NULL)
            self.insuredForClimate.text = insurance.insured_for_climate_damage;
    

}

-(void) configureBody{

    Estimates * estimate = (Estimates *) self.detailItem;
    Body_shop_repaire * body = (Body_shop_repaire *) estimate.body_shop_repaire;

    if(body.complete_name != NULL)
            self.bodyName.text = body.complete_name;
    
    if(body.adress != NULL)
        self.bodyAdress.text = body.adress;
    if(body.postal_code != NULL)
        self.bodyPostaCode.text = body.postal_code;
    if(body.city != NULL)
        self.bodyCity.text = body.city;
    if(body.tel != NULL)
        self.bodyTel.text = body.tel;
        
}

-(void) configureVeicle{
        Estimates * estimate = (Estimates *) self.detailItem;
        Veicle * veicle = ( Veicle *) estimate.veicle;
    
    if(veicle.brand != NULL)
        self.veicleBrand.text = veicle.brand;
    
    if(veicle.model != NULL)
        self.veicleModel.text = veicle.model;
    
    if(veicle.license_no != NULL)
        self.veicleLicense.text = veicle.license_no;
    
    if(veicle.car_frame_no != NULL)
        self.veicleCarFrame.text = veicle.car_frame_no;
    
    if(veicle.year != NULL)
        self.veicleYear.text = veicle.year;

    if(veicle.km_counter != NULL)
        self.veicleKm.text = veicle.km_counter;
    
    if(veicle.color != NULL)
        self.veicleColorView.backgroundColor = [Colors colorFromHexString:veicle.color];
    }


-(void) configureParts{
    
    Estimates * estimate = (Estimates *) self.detailItem;
    Parts * parts = ( Parts * ) estimate.parts;

     
    // Boonet
    Espec_part * bonnet = (Espec_part *) parts.bonnet;
    if(bonnet.count != NULL)
    self.bonnetCount.text = bonnet.count;
    
    if(bonnet.type_of_damage != NULL)
    self.bonnetDamage.text = bonnet.type_of_damage;
    
    if(bonnet.price_tax_exempt !=NULL)
    self.bonnetPrice.text = bonnet.price_tax_exempt;
    
    if(bonnet.paint != NULL){
        switch ([bonnet.paint intValue]) {
            case 0:
                [self.bonnetSwitch setOn:NO];
                break;
                
            case 1:
                [self.bonnetSwitch setOn:YES];
                break;
        }
    }else{
        [self.bonnetSwitch setOn:NO];
    }
    
    
    // Roof
    Espec_part * roof = (Espec_part *) parts.roof;
    if(roof.count != NULL)
        self.roofCount.text = roof.count;
    
    if(roof.type_of_damage != NULL)
        self.roofDamage.text = roof.type_of_damage;
    
    if(roof.price_tax_exempt !=NULL)
        self.roofPrice.text = roof.price_tax_exempt;
    
    if(roof.paint != NULL){
        switch ([roof.paint intValue]) {
            case 0:
                [self.roofSwitch setOn:NO];
                break;
                
            case 1:
                [self.roofSwitch setOn:YES];
                break;
        }
    }else{
        [self.roofSwitch setOn:NO];
    }

    // Sun roof
    Espec_part * sun_roof = (Espec_part *) parts.sun_roof;
    if(sun_roof.count != NULL)
        self.sunRoofCount.text = sun_roof.count;
    
    if(sun_roof.type_of_damage != NULL)
        self.sunRoofDamage.text = sun_roof.type_of_damage;
    
    if(sun_roof.price_tax_exempt !=NULL)
        self.sunRoofPrice.text = sun_roof.price_tax_exempt;
    
    if(sun_roof.paint != NULL){
        switch ([sun_roof.paint intValue]) {
            case 0:
                [self.sunRoofSwitch setOn:NO];
                break;
                
            case 1:
                [self.sunRoofSwitch setOn:YES];
                break;
        }
    }else{
        [self.sunRoofSwitch setOn:NO];
    }
    
    
    // Boot
    Espec_part * boot = (Espec_part *) parts.boot;
    if(boot.count != NULL)
        self.bootCount.text = boot.count;
    
    if(boot.type_of_damage != NULL)
        self.bootDamage.text = boot.type_of_damage;
    
    if(boot.price_tax_exempt !=NULL)
        self.bootPrice.text = boot.price_tax_exempt;
    
    if(boot.paint != NULL){
        switch ([boot.paint intValue]) {
            case 0:
                [self.bootSwitch setOn:NO];
                break;
                
            case 1:
                [self.bootSwitch setOn:YES];
                break;
        }
    }else{
        [self.bootSwitch setOn:NO];
    }
    
    // Front Left Wing
    Espec_part * front_left_wing = (Espec_part *) parts.front_left_wing;
    
    if(front_left_wing.count != NULL)
        self.FrontLeftWingCount.text = front_left_wing.count;
    
    if(front_left_wing.type_of_damage != NULL)
        self.frontLeftWingDamage.text = front_left_wing.type_of_damage;
    
    if(front_left_wing.price_tax_exempt !=NULL)
        self.frontLeftWingPrice.text = front_left_wing.price_tax_exempt;
    
    if(front_left_wing.paint != NULL){
        switch ([front_left_wing.paint intValue]) {
            case 0:
                [self.frontLeftWingSwitch setOn:NO];
                break;
                
            case 1:
                [self.frontLeftWingSwitch setOn:YES];
                break;
        }
    }else{
        [self.frontLeftWingSwitch setOn:NO];
    }


    // Front Right Wing
    Espec_part * front_right_wing = (Espec_part *) parts.front_right_wing;
    
    if(front_right_wing.count != NULL)
        self.FrontRightWingCount.text = front_right_wing.count;
    
    if(front_right_wing.type_of_damage != NULL)
        self.frontRightWingDamage.text = front_right_wing.type_of_damage;
    
    if(front_right_wing.price_tax_exempt !=NULL)
        self.frontRightWingPrice.text = front_right_wing.price_tax_exempt;
    
    if(front_right_wing.paint != NULL){
        switch ([front_right_wing.paint intValue]) {
            case 0:
                [self.frontRightWingSwitch setOn:NO];
                break;
                
            case 1:
                [self.frontRightWingSwitch setOn:YES];
                break;
        }
    }else{
        [self.frontRightWingSwitch setOn:NO];
    }
     
     
    
    
    // Black Left Wing
    Espec_part * back_left_wing = (Espec_part *) parts.back_left_wing;
    
    if(back_left_wing.count != NULL)
        self.backLeftWingCount.text = back_left_wing.count;
    
    if(back_left_wing.type_of_damage != NULL)
        self.backLeftWingDamage.text = back_left_wing.type_of_damage;
    
    if(back_left_wing.price_tax_exempt !=NULL)
        self.backLeftWingPrice.text = back_left_wing.price_tax_exempt;
    
    if(back_left_wing.paint != NULL){
        switch ([back_left_wing.paint intValue]) {
            case 0:
                [self.backLeftWingSwitch setOn:NO];
                break;
                
            case 1:
                [self.backLeftWingSwitch setOn:YES];
                break;
        }
    }else{
        [self.backLeftWingSwitch setOn:NO];
    }
    
    

    // Black Right Wing
    Espec_part * back_right_wing = (Espec_part *) parts.back_right_wing;
    
    if(back_right_wing.count != NULL)
        self.backRightWingCount.text = back_right_wing.count;
    
    if(back_right_wing.type_of_damage != NULL)
        self.backRightWingDamage.text = back_right_wing.type_of_damage;
    
    if(back_right_wing.price_tax_exempt !=NULL)
        self.backRightWingPrice.text = back_right_wing.price_tax_exempt;
    
    if(back_right_wing.paint != NULL){
        switch ([back_right_wing.paint intValue]) {
            case 0:
                [self.backRightWingSwitch setOn:NO];
                break;
                
            case 1:
                [self.backRightWingSwitch setOn:YES];
                break;
        }
    }else{
        [self.backRightWingSwitch setOn:NO];
    }
    
    
    
    
    // Front Left Door
    Espec_part * front_left_door = (Espec_part *) parts.front_left_door;
    
    if(front_left_door.count != NULL)
        self.frontLeftDoorCount.text = front_left_door.count;
    
    if(front_left_door.type_of_damage != NULL)
        self.frontLeftDoorDamage.text = front_left_door.type_of_damage;
    
    if(front_left_door.price_tax_exempt !=NULL)
        self.frontLeftDoorPrice.text = front_left_door.price_tax_exempt;
    
    if(front_left_door.paint != NULL){
        switch ([front_left_door.paint intValue]) {
            case 0:
                [self.frontLeftDoorSwitch setOn:NO];
                break;
                
            case 1:
                [self.frontLeftDoorSwitch setOn:YES];
                break;
        }
    }else{
        [self.frontLeftDoorSwitch setOn:NO];
    }

    
    
    // Front Left Door
    Espec_part * front_right_door = (Espec_part *) parts.front_right_door;
    
    if(front_right_door.count != NULL)
        self.frontRightDoorCount.text = front_right_door.count;
    
    if(front_right_door.type_of_damage != NULL)
        self.frontRightDoorDamage.text = front_right_door.type_of_damage;
    
    if(front_right_door.price_tax_exempt !=NULL)
        self.frontRightDoorPrice.text = front_right_door.price_tax_exempt;
    
    if(front_right_door.paint != NULL){
        switch ([front_right_door.paint intValue]) {
            case 0:
                [self.frontRightDoorSwitch setOn:NO];
                break;
                
            case 1:
                [self.frontRightDoorSwitch setOn:YES];
                break;
        }
    }else{
        [self.frontRightDoorSwitch setOn:NO];
    }

    
    
    // Back Left Door
    Espec_part * back_left_door = (Espec_part *) parts.back_left_door;
    
    if(back_left_door.count != NULL)
        self.backLeftDoorCount.text = back_left_door.count;
    
    if(back_left_door.type_of_damage != NULL)
        self.backLeftDoorDamage.text = back_left_door.type_of_damage;
    
    if(back_left_door.price_tax_exempt !=NULL)
        self.backLeftDoorPrice.text = back_left_door.price_tax_exempt;
    
    if(back_left_door.paint != NULL){
        switch ([back_left_door.paint intValue]) {
            case 0:
                [self.backLeftDoorSwitch setOn:NO];
                break;
                
            case 1:
                [self.backLeftDoorSwitch setOn:YES];
                break;
        }
    }else{
        [self.backLeftDoorSwitch setOn:NO];
    }
     
     
    
    
    // Back Right Door
    Espec_part * back_right_door = (Espec_part *) parts.back_right_door;
    
    if(back_right_door.count != NULL)
        self.backRightDoorCount.text = back_right_door.count;
    
    if(back_right_door.type_of_damage != NULL)
        self.backRightDoorDamage.text = back_right_door.type_of_damage;
    
    if(back_right_door.price_tax_exempt !=NULL)
        self.backRightDoorPrice.text = back_right_door.price_tax_exempt;
    
    if(back_right_door.paint != NULL){
        switch ([back_right_door.paint intValue]) {
            case 0:
                [self.backRightDoorSwitch setOn:NO];
                break;
                
            case 1:
                [self.backRightDoorSwitch setOn:YES];
                break;
        }
    }else{
        [self.backRightDoorSwitch setOn:NO];
    }

    
    
    // Left Roof Pilar
    Espec_part * left_roof_pilar = (Espec_part *) parts.left_roof_pillar;
    
    if(left_roof_pilar.count != NULL)
        self.leftRoofPilarCount.text = left_roof_pilar.count;
    
    if(left_roof_pilar.type_of_damage != NULL)
        self.leftRoofPilarDamage.text = left_roof_pilar.type_of_damage;
    
    if(left_roof_pilar.price_tax_exempt !=NULL)
        self.leftRoofPilarPrice.text = left_roof_pilar.price_tax_exempt;
    
    if(left_roof_pilar.paint != NULL){
        switch ([left_roof_pilar.paint intValue]) {
            case 0:
                [self.leftRoofPilarSwitch setOn:NO];
                break;
                
            case 1:
                [self.leftRoofPilarSwitch setOn:YES];
                break;
        }
    }else{
        [self.leftRoofPilarSwitch setOn:NO];
    }

    
    
    // Right Roof Pilar
    Espec_part * right_roof_pilar = (Espec_part *) parts.right_roof_pillar;
    
    if(right_roof_pilar.count != NULL)
        self.rightRoofPilarCount.text = right_roof_pilar.count;
    
    if(right_roof_pilar.type_of_damage != NULL)
        self.rightRoofPilarDamage.text = right_roof_pilar.type_of_damage;
    
    if(right_roof_pilar.price_tax_exempt !=NULL)
        self.rightRoofPilarPrice.text = right_roof_pilar.price_tax_exempt;
    
    if(right_roof_pilar.paint != NULL){
        switch ([right_roof_pilar.paint intValue]) {
            case 0:
                [self.rightRoofPilarSwitch setOn:NO];
                break;
                
            case 1:
                [self.rightRoofPilarSwitch setOn:YES];
                break;
        }
    }else{
        [self.rightRoofPilarSwitch setOn:NO];
    }

   
    
    // Others
    Espec_part * other = (Espec_part *) parts.other;
    
    if(other.count != NULL)
        self.otherCount.text = other.count;
    
    if(other.type_of_damage != NULL)
        self.otherDamage.text = other.type_of_damage;
    
    if(other.price_tax_exempt !=NULL)
        self.otherPrice.text = other.price_tax_exempt;
    
    if(other.paint != NULL){
        switch ([other.paint intValue]) {
            case 0:
                [self.otherSwitch setOn:NO];
                break;
                
            case 1:
                [self.otherSwitch setOn:YES];
                break;
        }
    }else{
        [self.otherSwitch setOn:NO];
    }
    
    if(parts.dis_reassembly != NULL)
        self.dis.text = parts.dis_reassembly;
    
    if(parts.total != NULL)
        self.total.text = parts.total;
    

    
}

-(void)configureImages{

    Estimates * estimate = (Estimates *) self.detailItem;
    Pictures * pictures = estimate.pictures;
    
    
    if(pictures.pic1 !=NULL)
        self.pic1.image = [UIImage imageWithContentsOfFile:pictures.pic1];
    if(pictures.pic2 !=NULL)
        self.pic2.image = [UIImage imageWithContentsOfFile:pictures.pic2];
    if(pictures.pic3 !=NULL)
        self.pic3.image = [UIImage imageWithContentsOfFile:pictures.pic3];
    if(pictures.pic4 !=NULL)
        self.pic4.image = [UIImage imageWithContentsOfFile:pictures.pic4];
    if(pictures.pic5 !=NULL)
        self.pic5.image = [UIImage imageWithContentsOfFile:pictures.pic5];
    if(pictures.pic6 !=NULL)
        self.pic6.image = [UIImage imageWithContentsOfFile:pictures.pic6];
    if(pictures.pic7 !=NULL)
        self.pic7.image = [UIImage imageWithContentsOfFile:pictures.pic7];
    if(pictures.pic8 !=NULL)
        self.pic8.image = [UIImage imageWithContentsOfFile:pictures.pic8];
    if(pictures.pic9 !=NULL)
        self.pic9.image = [UIImage imageWithContentsOfFile:pictures.pic9];
    if(pictures.pic10 !=NULL)
        self.pic10.image = [UIImage imageWithContentsOfFile:pictures.pic10];
    if(pictures.pic11 !=NULL)
        self.pic11.image = [UIImage imageWithContentsOfFile:pictures.pic11];
    if(pictures.pic12 !=NULL)
        self.pic12.image = [UIImage imageWithContentsOfFile:pictures.pic12];
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = @"Menu";

    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;

    self.containerView.frame = CGRectMake(xPortrait,self.containerView.frame.origin.y,self.containerView.frame.size.width,self.containerView.frame.size.height);
    
    NSLog(@"portrait");
    

    
    
    
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
    
    self.containerView.frame = CGRectMake(xLands,self.containerView.frame.origin.y,self.containerView.frame.size.width,self.containerView.frame.size.height);
        NSLog(@"lands");

}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}

#pragma mark Updates

-(void)save{
    
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Error to save");
    }
    
}

// UPDATE LANGUAGE
-(IBAction)languageChangeViewValueChanged:(UISegmentedControl *)segment
{
    NSLog(@"Update language");
    NSString * language = [NSString stringWithFormat:@"%d",segment.selectedSegmentIndex];
    
    Estimates * estimate = (Estimates *) self.detailItem;
    [estimate setLanguage:language];

    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Error to save");
    }
    [self save];
    
    //Salva como preferencia
    NSInteger index = segment.selectedSegmentIndex;
    [preferencesDefault setLanguagePreference:index];
    

    // Muda o idioma
    [self configureLabels];
    

    
}
// UPDATE COIN

-(void)coinChangeView:(NSString *)type withName:(NSString *)nameCoin
{
    [self.pocCoin dismissPopoverAnimated:NO];
    
    NSLog(@"Update coin");
    NSString * coin = [NSString stringWithFormat:@"%@",type];
    Estimates * estimate = (Estimates *) self.detailItem;
    [estimate setCoin:coin];

    [self save];

    self.buttonCoinLabel.text = nameCoin;
    
    //Salva como preferencia
    NSInteger index = [type intValue];
    [preferencesDefault setCoinPreference:index];


    
}


-(void) configureLabels{
    Estimates * estimate = (Estimates *) self.detailItem;
    
    NSMutableArray * arrayLabel = [languageControl getArrayLanguage:estimate.language];
    
    for (NSInteger i = 200 ; i<= 244; i++) {
        
        UILabel * textLabel = (UILabel *)[self.view viewWithTag:i];
      
                        textLabel.text = [arrayLabel objectAtIndex:i-199];
    }
    

    
    NSMutableArray * arrayLabelAdd = [languageControl getArrayLanguageAdd:estimate.language];
    
    for (NSInteger i = 245 ; i<= 252; i++) {
        
        UILabel * textLabel = (UILabel *)[self.view viewWithTag:i];

        textLabel.text = [arrayLabelAdd objectAtIndex:i-245];
        
        
    }
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{

    NSInteger tag = textField.tag;
    CGFloat add;
    if((tag >= 24 && tag<=32) || (tag>=39 && tag<= 47) || (tag>=54 && tag<= 62))
        add = 300;
    else
        add = -50;
    if(tag == 63 || tag == 64 )
        add = 600;
    
    CGFloat value = textField.superview.frame.origin.y;
    [self.scrollview setContentOffset:CGPointMake(0,value+add) animated:YES];
    
}
//UPDATE
-(void)textFieldDidEndEditing:(UITextField *)textField{

    NSInteger tag = textField.tag;
    
    // CHECK TELEFONE DEFAULT
    if(tag == 130)
        [self updateTel];
    
    if(tag == 6)
        [self removeBodyRecommend];
    
    // FIRST CHECK IF IS INTEGER
    if(tag>=18 && tag<=47){
        if(textField.text != NULL && (![textField.text isEqualToString:@""])){
            int  numberOfValue = [textField.text intValue];
            textField.text = [NSString stringWithFormat:@"%d",numberOfValue];
        }
    }
    
    // SECOND CHECK IF IS MONEY
    if(tag>=48 && tag<=63){
        if(textField.text != NULL && (![textField.text isEqualToString:@""])){
            double  numberOfValue = [textField.text doubleValue];
            textField.text = [NSString stringWithFormat:@"%0.2f",numberOfValue];
        }

        
    }
    
    if(tag>=1 && tag<=5)
        [self updateInsurence];
    
    if(tag>=6 && tag<=10)
        [self updateBodyRepair];
    
    if(tag>=11 && tag<=17)
        [self updateVeicle];
    if(tag>=18 && tag <=64){
            
        if(tag>=18 && tag<=47){
            
            
            // Atualiza os precos de acordo com tipo ou com o count
            if(self.presetItem != NULL && usePreset == YES){
                NSLog(@"Preset Ativo..");
                if(tag<=32)
                    [self updatePricesByType:textField.text withTag:tag];
                else
                    [self updatePricesByCount:textField.text withTag:tag];
            }else
                NSLog(@"Preset não ativo ou não existente");

            //Recalcula
            [self calculateTotal];
            // Salva as mudancas
            [self updateParts];
            
        }else{
            
            // tag total : não deve recalcular pq ele alterou o valor porque deseja alterar
            if(tag == 64){
                //Salva mudancas
                [self updateParts];
                
            }else{
                //Recalcula
                [self calculateTotal];
                //Salva as mudancas
                [self updateParts];

            }
        }
        
        
    }

    

}

-(void)updateTel{
    NSLog(@"UPDATE TEL");
    Estimates * estimate = (Estimates *)self.detailItem;
    [estimate setTelDefault:self.telDefault.text];
    [self save];
}

-(void) updateInsurence{
    
    NSLog(@"Update Insurence");
    
    Estimates * estimate = ( Estimates *) self.detailItem;
    
    Insurance * insurence = estimate.insurance;
    [insurence setName:self.insuranceName.text];
    [insurence setContract_no:self.contractNo.text];
    [insurence setAgency:self.agency.text];
    [insurence setTel:self.insuranceTel.text];
    [insurence setInsured_for_climate_damage:self.insuredForClimate.text];
    
    [estimate setInsurance:insurence];
    [self save];
    
    
    
    
}

-(void) updateBodyRepair{
    
    NSLog(@"Update Body Repair");

    Estimates * estimate = ( Estimates *) self.detailItem;
    Body_shop_repaire * body = estimate.body_shop_repaire;
    [body setComplete_name:self.bodyName.text];
    [body setAdress:self.bodyAdress.text];
    [body setPostal_code:self.bodyPostaCode.text];
    [body setCity:self.bodyCity.text];
    [body setTel:self.bodyTel.text];
    
    [estimate setBody_shop_repaire:body];
    
    
    [self updateRecommend];
    

}

-(void)updateRecommend{

    if([self checkIfBodyIsComplete] == true){
        NSLog(@"->Body completo");
        if(![self checkIfExistsBody]){
            NSLog(@"->Recomendacao ainda nao cadastrada : cadastrando nova");

            NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
            
            Recommend * recommend = (Recommend *)[NSEntityDescription insertNewObjectForEntityForName:@"Recommend" inManagedObjectContext:context];
            
            [recommend setComplete_name:self.bodyName.text];
            [recommend setAdress:self.bodyAdress.text];
            [recommend setPostal_code:self.bodyPostaCode.text];
            [recommend setCity:self.bodyCity.text];
            [recommend setTel:self.bodyTel.text];
            
            [self save];
            

        }else
                        NSLog(@"->Recomendacao já cadastrada");
    }else
                NSLog(@"->Body não completo");

}

-(Boolean)checkIfBodyIsComplete{
    
    Estimates * estimate = ( Estimates *) self.detailItem;
    Body_shop_repaire * body = estimate.body_shop_repaire;
    
    Boolean valida = true;
    
    if([body.complete_name isEqualToString:@""] || body.complete_name == NULL)
        valida = false;
    if([body.adress isEqualToString:@""] || body.adress == NULL)
        valida = false;
    if([body.postal_code isEqualToString:@""] || body.postal_code == NULL)
        valida = false;
    if([body.city isEqualToString:@""] || body.city == NULL)
        valida = false;
    if([body.tel isEqualToString:@""] || body.tel == NULL)
        valida = false;
    
    return valida;
    

}

-(Boolean)checkIfExistsBody{
    
    Estimates * estimate = ( Estimates *) self.detailItem;
    Body_shop_repaire * body = estimate.body_shop_repaire;
    
    NSLog(@"consulta se já exist body shop para criar recomendacao");
    NSManagedObjectContext * context = self.managedObjectContext;
    
    NSEntityDescription * entity = [NSEntityDescription entityForName:@"Recommend" inManagedObjectContext:context];
    NSFetchRequest * request = [[NSFetchRequest alloc]init];
    [request setEntity:entity];
    
    if([self.bodyName.text isEqualToString:@""] || self.bodyName.text == NULL){
        return YES;
    }
    
    NSPredicate * pred = [NSPredicate predicateWithFormat:
                          @"complete_name contains[cd] %@ AND adress contains[cd] %@ AND postal_code contains[cd] %@ AND city contains[cd] %@ AND tel contains[cd] %@ ",body.complete_name,body.adress,body.postal_code,body.city,body.tel];
    
    [request setPredicate:pred];
    
    NSSortDescriptor * sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"complete_name" ascending:YES];
    NSArray * sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    [request setSortDescriptors:sortDescriptors];
    
    NSError * error;
    NSMutableArray * array = [[context executeFetchRequest:request error:&error]mutableCopy];
    if(!array)
    {
        NSLog(@"Error %@",error);
    }
    
    if([array count]>0){
        return true;
    }else
        return false;


}


-(void) updateVeicle{
    NSLog(@"Update Veicle");

    Estimates * estimate = ( Estimates *) self.detailItem;
    Veicle * veicle = (Veicle *) estimate.veicle;
    [veicle setBrand:self.veicleBrand.text];
    [veicle setModel:self.veicleModel.text];
    [veicle setLicense_no:self.veicleLicense.text];
    [veicle setCar_frame_no:self.veicleCarFrame.text];
    [veicle setYear:self.veicleYear.text];
    [veicle setKm_counter:self.veicleKm.text];
    [estimate setRepaired_for:self.veicleRepairedFor.text];

    [estimate setVeicle:veicle];
    [self save];


}


-(IBAction)changeColor:(id)sender{

    NSLog(@"change Color");
    UIButton * b = (UIButton *) sender;
    NSInteger tag = b.tag;
    
    NSString * color;
    if(tag == 81){color = @"#000000";}
    if(tag == 82){color = @"#a39f9a";}
    if(tag == 83){color = @"#ff682c";}
    if(tag == 84){color = @"#ff8443";}
    if(tag == 85){color = @"#c12123";}
    if(tag == 86){color = @"#fa2b2e";}
    if(tag == 87){color = @"#f9c13e";}
    if(tag == 88){color = @"#f9ea90";}
    if(tag == 89){color = @"#090d59";}
    if(tag == 90){color = @"#1722e5";}
    if(tag == 91){color = @"#0d6b0e";}
    if(tag == 92){color = @"#18c719";}
    if(tag == 93){color = @"#c71bb2";}
    if(tag == 94){color = @"#c773c5";}
    if(tag == 95){color = @"#d6d4d1";}
    if(tag == 96){color = @"#fbf8f5";}
    
    //Update View
    self.veicleColorView.backgroundColor = [Colors colorFromHexString:(color)];

    // Update CoreData
    Estimates * estimate = (Estimates *) self.detailItem;
    Veicle * veicle = (Veicle *) estimate.veicle;
    
    [veicle setColor:color];
    [estimate setVeicle:veicle];
    
    [self save];
}

-(void) updatePricesByType:(NSString * )type withTag:(NSInteger) tag{

        // 18 - 32 tag+30

        NSLog(@"Atualizando o tipo %@ do texfield  %d",type,tag);
    
        // Atualiza o preco no campo de texto referente

        NSLog(@"DAMAGE CHANGE");
        NSInteger referencePrice = tag + 30;
        NSInteger referenceCount = tag + 15;
    
        UITextField * textFieldReference = (UITextField *)[self.view viewWithTag:referencePrice];
        UITextField * textFieldCount = (UITextField *)[self.view viewWithTag:referenceCount];
    
    
        NSString * value = [self queryPricePreset:type withCount:textFieldCount.text withCategoria:[self categoriaByTag:referencePrice]];

        NSLog(@"VALUE RETURN %@",value);
        if(value !=NULL && ![value isEqualToString:@""])
            textFieldReference.text = value;

    
}

-(void) updatePricesByCount:(NSString * )count withTag:(NSInteger) tag{

        // 33 - 47 tag+15
    
        NSLog(@"Atualizando o count %@ do texfield  %d",count,tag);
        NSLog(@"COUNT CHANGE");
    
        NSInteger referencePrice = tag + 15;
        NSInteger referenceType = tag - 15;
    
        UITextField * textFieldReference = (UITextField *)[self.view viewWithTag:referencePrice];
        UITextField * textFieldType = (UITextField *)[self.view viewWithTag:referenceType];
    
        NSString * value = [self queryPricePreset:textFieldType.text withCount:count withCategoria:[self categoriaByTag:referencePrice]];
    NSLog(@"VALUE RETURN %@",value);
        if(value !=NULL && ![value isEqualToString:@""])
            textFieldReference.text = value;
    
}

-(NSString *) queryPricePreset:(NSString * )type withCount:(NSString *)count withCategoria:(NSString *)categoria{
    
    Prices * price = (Prices *) self.presetItem;
    NSString * idPrice = [NSString stringWithFormat:@"%@",price.id_price];
    
    NSLog(@"Query preset : ");
    NSLog(@"de<= %@ AND ATE>= %@ AND CATEGORIA = %@ AND DESC_ID_PRICES=%@ AND TIPO = %@",count,count,categoria,idPrice,type);
    
    NSManagedObjectContext * context = self.managedObjectContext;
    
    NSEntityDescription * entity = [NSEntityDescription entityForName:@"DescriptPrices" inManagedObjectContext:context];
    
    NSFetchRequest * request = [[NSFetchRequest alloc]init];
    [request setEntity:entity];
    
    NSPredicate * pred = [NSPredicate predicateWithFormat:@"de<= %@ AND ate>=%@ AND categoria=%@ AND desc_id_prices=%@ AND tipo=%@",count,count,categoria,idPrice,type];

    
    [request setPredicate:pred];
    
    NSSortDescriptor * sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"de" ascending:YES];
    NSArray * sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    [request setSortDescriptors:sortDescriptors];
    
    NSError * error;
    NSMutableArray * array = [[context executeFetchRequest:request error:&error]mutableCopy];
    if(!array)
    {
        NSLog(@"Error %@",error);
    }
    
    NSLog(@"Valor encontrado :%d",[array count]);

    if([array count]>0){
        
        DescriptPrices * desc = (DescriptPrices *)[array objectAtIndex:0];
        double value = [desc.valor doubleValue];
        NSString * retValue =[NSString stringWithFormat:@"%0.2f",value];
        return retValue;
    }else
        return NULL;
    
}

-(NSString *) categoriaByTag:(NSInteger)tag{
    
    if(tag>=48 && tag<=51){
                NSLog(@"horizontal tag:%d",tag);
        return @"0";
    }
    else{
                NSLog(@"vertical tag %d",tag);
                    return @"1";
    }

}

-(void) calculateTotal{
    NSLog(@"Calculando valor total..");
    double preTotal = 0;
    for(NSInteger i = 33 ; i<=47;i++){
        
        UITextField * textCount = (UITextField *)[self.view viewWithTag:i];
        UITextField * textPriceTAX = (UITextField *)[self.view viewWithTag:i+15];

        if(textCount.text != NULL && !([textCount.text isEqualToString:@""])){
            double  priceTAX = [textPriceTAX.text doubleValue];
            preTotal+= priceTAX;
        }
        
    }
    
    double dis = [self.dis.text doubleValue];
    preTotal+=dis;
    self.total.text = [NSString stringWithFormat:@"%.2f",preTotal];
    NSLog(@"TOTAL : %.2f",preTotal);
}

-(void) updateParts{

    
    NSLog(@"Update Parts");
    
    Estimates * estimate = (Estimates *) self.detailItem;
    Parts * parts = (Parts *) estimate.parts;

    //Bonnet
    Espec_part * especBonnet = parts.bonnet;
    [especBonnet setType_of_damage:self.bonnetDamage.text];
    [especBonnet setCount:self.bonnetCount.text];
    [especBonnet setPrice_tax_exempt:self.bonnetPrice.text];
    [parts setBonnet:especBonnet];
    
   
    // Roof
    Espec_part * especRoof = parts.roof;
    [especRoof setType_of_damage:self.roofDamage.text];
    [especRoof setCount:self.roofCount.text];
    [especRoof setPrice_tax_exempt:self.roofPrice.text];
    [parts setRoof:especRoof];
    
    // Sun Roof
    Espec_part * especSunRoof = parts.sun_roof;
    [especSunRoof setType_of_damage:self.sunRoofDamage.text];
    [especSunRoof setCount:self.sunRoofCount.text];
    [especSunRoof setPrice_tax_exempt:self.sunRoofPrice.text];
    [parts setSun_roof:especSunRoof];

    // Boot
    Espec_part * especBoot = parts.boot;
    [especBoot setType_of_damage:self.bootDamage.text];
    [especBoot setCount:self.bootCount.text];
    [especBoot setPrice_tax_exempt:self.bootPrice.text];
    [parts setBoot:especBoot];

    
    //Front_left_wing
    Espec_part * especFront_left_wing = parts.front_left_wing;
    [especFront_left_wing setType_of_damage:self.frontLeftWingDamage.text];
    [especFront_left_wing setCount:self.FrontLeftWingCount.text];
    [especFront_left_wing setPrice_tax_exempt:self.frontLeftWingPrice.text];
    [parts setFront_left_wing:especFront_left_wing];

    //Front_right_wing
    Espec_part * especFront_right_wing = parts.front_right_wing;
    [especFront_right_wing setType_of_damage:self.frontRightWingDamage.text];
    [especFront_right_wing setCount:self.FrontRightWingCount.text];
    [especFront_right_wing setPrice_tax_exempt:self.frontRightWingPrice.text];
    [parts setFront_right_wing:especFront_right_wing];

    //Back_left_wing
    Espec_part * especBack_left_wing = parts.back_left_wing;
    [especBack_left_wing setType_of_damage:self.backLeftWingDamage.text];
    [especBack_left_wing setCount:self.backLeftWingCount.text];
    [especBack_left_wing setPrice_tax_exempt:self.backLeftWingPrice.text];
    [parts setBack_left_wing:especBack_left_wing];

    //Back_right_wing
    Espec_part * especBack_right_wing = parts.back_right_wing;
    [especBack_right_wing setType_of_damage:self.backRightWingDamage.text];
    [especBack_right_wing setCount:self.backRightWingCount.text];
    [especBack_right_wing setPrice_tax_exempt:self.backRightWingPrice.text];
    [parts setBack_right_wing:especBack_right_wing];

    //Front_left_door
    Espec_part * especFront_left_door = parts.front_left_door;
    [especFront_left_door setType_of_damage:self.frontLeftDoorDamage.text];
    [especFront_left_door setCount:self.frontLeftDoorCount.text];
    [especFront_left_door setPrice_tax_exempt:self.frontLeftDoorPrice.text];
    [parts setFront_left_door:especFront_left_door];
    
    //Front_right_door
    Espec_part * especFront_right_door = parts.front_right_door;
    [especFront_right_door setType_of_damage:self.frontRightDoorDamage.text];
    [especFront_right_door setCount:self.frontRightDoorCount.text];
    [especFront_right_door setPrice_tax_exempt:self.frontRightDoorPrice.text];
    [parts setFront_right_door:especFront_right_door];

    
    //Back_left_door
    Espec_part * especBack_left_door = parts.back_left_door;
    [especBack_left_door setType_of_damage:self.backLeftDoorDamage.text];
    [especBack_left_door setCount:self.backLeftDoorCount.text];
    [especBack_left_door setPrice_tax_exempt:self.backLeftDoorPrice.text];
    [parts setBack_left_door:especBack_left_door];
    

    //Back_right_door
    Espec_part * especBack_right_door = parts.back_right_door;
    [especBack_right_door setType_of_damage:self.backRightDoorDamage.text];
    [especBack_right_door setCount:self.backRightDoorCount.text];
    [especBack_right_door setPrice_tax_exempt:self.backRightDoorPrice.text];
    [parts setBack_right_door:especBack_right_door];
    

    Espec_part * especLeft_roof_pilar = parts.left_roof_pillar;
    [especLeft_roof_pilar setType_of_damage:self.leftRoofPilarDamage.text];
    [especLeft_roof_pilar setCount:self.leftRoofPilarCount.text];
    [especLeft_roof_pilar setPrice_tax_exempt:self.leftRoofPilarPrice.text];
    [parts setLeft_roof_pillar:especLeft_roof_pilar];
    
    
    Espec_part * especRight_roof_pilar = parts.right_roof_pillar;
    [especRight_roof_pilar setType_of_damage:self.rightRoofPilarDamage.text];
    [especRight_roof_pilar setCount:self.rightRoofPilarCount.text];
    [especRight_roof_pilar setPrice_tax_exempt:self.rightRoofPilarPrice.text];
    [parts setRight_roof_pillar:especRight_roof_pilar];
    
    Espec_part * especOther = parts.other;
    [especOther setType_of_damage:self.otherDamage.text];
    [especOther setCount:self.otherCount.text];
    [especOther setPrice_tax_exempt:self.otherPrice.text];
    [parts setOther:especOther];
    
    [parts setDis_reassembly:self.dis.text];
    [parts setTotal:self.total.text];
    
    [estimate setParts:parts];
    [self save];
    

}

-(IBAction)UpdateSwitch:(id)sender{

    Estimates * estimate = (Estimates *) self.detailItem;
    Parts * parts = (Parts *) estimate.parts;
    
    NSNumber * paint;

    UISwitch * switch_ = (UISwitch *) sender;
    NSInteger tag = switch_.tag;
    paint = [NSNumber numberWithBool:switch_.on];
        
    switch (tag) {
        case 65:
        {
            // Boonet
            Espec_part * especBonnet = parts.bonnet;
            [especBonnet setPaint:paint];
            [parts setBonnet:especBonnet];
            break;
        }
            

        case 66:
        {
            // Roof
            Espec_part * especRoof = parts.roof;
            [especRoof setPaint:paint];
            [parts setRoof:especRoof];
            break;
        }
        case 67:
        {
            // Sun Roof
            Espec_part * especSunRoof = parts.sun_roof;
            [especSunRoof setPaint:paint];
            [parts setSun_roof:especSunRoof];
            break;

        }
        case 68:
        {
            // Boot
            Espec_part * especBoot = parts.boot;
            [especBoot setPaint:paint];
            [parts setBoot:especBoot];
            break;
        }
        case 69:
        {
            
            //Front_left_wing
            Espec_part * especFront_left_wing = parts.front_left_wing;
            [especFront_left_wing setPaint:paint];
            [parts setFront_left_wing:especFront_left_wing];
            break;
        }
        case 70:
        {
            //Front_right_wing
            Espec_part * especFront_right_wing = parts.front_right_wing;
            [especFront_right_wing setPaint:paint];
            [parts setFront_right_wing:especFront_right_wing];
            break;
        }
        case 71:
        {
            
            //Back_left_wing
            Espec_part * especBack_left_wing = parts.back_left_wing;
            [especBack_left_wing setPaint:paint];
            [parts setBack_left_wing:especBack_left_wing];
            break;
            

        }
        case 72:
        {
            
            //Back_right_wing
            Espec_part * especBack_right_wing = parts.back_right_wing;
            [especBack_right_wing setPaint:paint];
            [parts setBack_right_wing:especBack_right_wing];
            break;
        }
        case 73:
        {
            //Front_left_door
            Espec_part * especFront_left_door = parts.front_left_door;
            [especFront_left_door setPaint:paint];
            [parts setFront_left_door:especFront_left_door];
            break;

        }
        case 74:
        {
            //Front_right_door
            Espec_part * especFront_right_door = parts.front_right_door;
            [especFront_right_door setPaint:paint];
            [parts setFront_right_door:especFront_right_door];
            break;
        }
        case 75:
        {
            //Back_left_door
            Espec_part * especBack_left_door = parts.back_left_door;
            [especBack_left_door setPaint:paint];
            [parts setBack_left_door:especBack_left_door];
            break;
        }
        case 76:
        {
            //Back_right_door
            Espec_part * especBack_right_door = parts.back_right_door;
            [especBack_right_door setPaint:paint];
            [parts setBack_right_door:especBack_right_door];
            break;
        }
        case 77:
        {
            Espec_part * especLeft_roof_pilar = parts.left_roof_pillar;
            [especLeft_roof_pilar setPaint:paint];
            [parts setLeft_roof_pillar:especLeft_roof_pilar];
            break;
        }
        case 78:
        {
            
            Espec_part * especRight_roof_pilar = parts.right_roof_pillar;
            [especRight_roof_pilar setPaint:paint];
            [parts setRight_roof_pillar:especRight_roof_pilar];
            break;
        }
        case 79:
        {
            Espec_part * especOther = parts.other;
            [especOther setPaint:paint];
            [parts setOther:especOther];
            break;
        }
            
    }
    
    [estimate setParts:parts];
    [self save];

    
}


#pragma mark Action

-(IBAction)goToDoneView:(id)sender{
    Estimates * estimate = ( Estimates *) self.detailItem;
    if(estimate.protocol != NULL){
        showEstimateViewController * showEstimate = [[showEstimateViewController alloc]init];
        showEstimate.detailItem = self.detailItem;
        showEstimate.presetItem = self.presetItem;
        
        [self.navigationController pushViewController:showEstimate animated:YES];
    }else{
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Aviso"
                                                          message:@"Selecione um orçamento para prosseguir."
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        [message show];
    }
    
    
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{

    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    if(tagOfActivityImage != 0){
        UIImageView * imageTapped = (UIImageView *)[self.view viewWithTag:tagOfActivityImage];
        imageTapped.image = image;
        
        // Store
        [self storeImage:image];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
    tagOfActivityImage = 0;
}

-(void) storeImage:(UIImage *)imageToSave{

    Estimates * estimate = (Estimates *) self.detailItem;
    
    // Open directory
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];

    // Name of Folder
	NSString * folderToSave = [NSString stringWithFormat:@"/folder_%@",estimate.protocol];
    
    // folder with custom name
    NSString *dataPath = [docDir stringByAppendingPathComponent:folderToSave];
    
    // Creating complete file path
	NSString *jpegFilePath = [NSString stringWithFormat:@"%@/image_%@_%ld.jpeg",dataPath,estimate.protocol,(long)tagOfActivityImage];

	NSLog(@"PATH NEW IMAGE : %@",jpegFilePath);
	
    NSData *data = [NSData dataWithData:UIImageJPEGRepresentation(imageToSave, 1.0f)];
	[data writeToFile:jpegFilePath atomically:YES];
	
	NSLog(@"IMAGE STORED");
    [self updateImages:jpegFilePath];
}

-(void) updateImages:(NSString *)path{
   	
    NSLog(@"UPDATE IMAGES");
    Estimates * estimate = (Estimates *)self.detailItem;
    Pictures * pictures = estimate.pictures;
    
    if(tagOfActivityImage == 0)
        return;
    
    switch (tagOfActivityImage) {

        case 101:
        {
            pictures.pic1 = path;
            break;
        }
        case 102:
        {
            pictures.pic2 = path;
            break;
        }
        case 103:
        {
            pictures.pic3 = path;
            break;
        }
        case 104:
        {
            pictures.pic4 = path;
            break;
        }
        case 105:
        {
            pictures.pic5 = path;
            break;
        }
        case 106:
        {
            pictures.pic6 = path;
            break;
        }
        case 107:
        {
            pictures.pic7 = path;
            break;
        }
        case 108:
        {
            pictures.pic8 = path;
            break;
        }
        case 109:
        {
            pictures.pic9 = path;
            break;
        }
        case 110:
        {
            pictures.pic10 = path;
            break;
        }
        case 111:
        {
            pictures.pic11= path;
            break;
        }
        case 112:
        {
            pictures.pic12 = path;
            break;
        }
        
            
    }
    tagOfActivityImage = 0;
    [estimate setPictures:pictures];
    
    [self save];
    
}

-(void)updateData:(NSDate *)date{

    NSLog(@"UPDATE DATA");
    Estimates * estimate = (Estimates *)self.detailItem;
    [estimate setDate_init_work:date];
    [self save];

}

-(void)usePresetChange:(id)sender{
    NSLog(@"Mudando o valor do usePreset");
    UISwitch * switch_ = (UISwitch *) sender;
    if(switch_.on == YES){
        NSLog(@"PRESET = YES");
            usePreset = YES;
            [self.labelPresetName setAlpha:1];
            [self popPresetMenu];
        
    }else if(switch_.on == NO){
                          usePreset = NO;
                          NSLog(@"PRESET = NO");
                            [self.labelPresetName setAlpha:0.4];
                            [self.labelPresetName setText:@"-----------"];
                            self.presetItem = NULL;
              }

    
    
}

-(IBAction)deleteRecommend:(id)sender{

    
    NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
    [context deleteObject:[arrayBodyShop objectAtIndex:0]];
    [self save];
    NSLog(@"Deletando recomendacao");
    [self removeBodyRecommend];
    arrayBodyShop = NULL;
    
}

#pragma mark PopOverCoin

-(IBAction)popCoinMenu:(id)sender{
    
    popCoinMenuViewController * viewController = [[popCoinMenuViewController alloc] initWithNibName:@"popCoinMenuViewController" bundle:nil];
    viewController.delegate = self;
    self.pocCoin = [[UIPopoverController alloc] initWithContentViewController:viewController];
    self.pocCoin.popoverContentSize = CGSizeMake(200, 320);
    
    [ self.pocCoin presentPopoverFromRect:self.containerView.frame inView:self.buttonCoinLabel  permittedArrowDirections: UIPopoverArrowDirectionAny animated:YES];
    
}


#pragma mark PopOverMenu

-(IBAction)popOpenImageOptions:(id)sender{
    
    popActionPictureViewController *viewController = [[popActionPictureViewController alloc] initWithNibName:@"popActionPictureViewController" bundle:nil];
    
    viewController.delegate = self;

    UIGestureRecognizer *recognizer = (UIGestureRecognizer*)sender;
    UIImageView *imageView = (UIImageView *)recognizer.view;
    tagOfActivityImage = imageView.tag;
    
    self.poc = [[UIPopoverController alloc] initWithContentViewController:viewController];
    self.poc.popoverContentSize = CGSizeMake(400, 80);
    
    
    [ self.poc presentPopoverFromRect:imageView.frame inView:self.pic1 permittedArrowDirections: UIPopoverArrowDirectionAny animated:YES];
    
}

-(void)popPresetMenu{

    popPresetMenuViewController * viewController = [[popPresetMenuViewController alloc] initWithNibName:@"popPresetMenuViewController" bundle:nil];
    viewController.delegate = self;
    
    self.pocPreset = [[UIPopoverController alloc] initWithContentViewController:viewController];
    self.pocPreset.popoverContentSize = CGSizeMake(300, 300);
    self.pocPreset.delegate = self;
    
    [ self.pocPreset presentPopoverFromRect:self.switchPreset.frame inView:self.self.switchPreset permittedArrowDirections: UIPopoverArrowDirectionAny animated:YES];
    
}

-(void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController{
    if(self.presetItem == NULL){
        [self.switchPreset setOn:NO animated:YES];
        [self.labelPresetName setAlpha:0.4];
    }


}

-(void)actionTapPicture:(NSInteger)option{
    
    [self.poc dismissPopoverAnimated:NO];
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    [imagePicker setDelegate:self];
    
    if(option == 1){
        
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
            [self presentViewController:imagePicker animated:YES completion:nil];
            
        }
    }
    
    if(option == 2){
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
    
    if(option == 3){

        UIImageView * imageTapped = (UIImageView *)[self.view viewWithTag:tagOfActivityImage];
        if(imageTapped.image != [UIImage imageNamed:@"icon_image_default"]){

            imageViewController * imageController = [[imageViewController alloc]init];
            
            imageController.img = imageTapped.image;
            
            imageController.modalPresentationStyle = UIModalPresentationFullScreen;
            
            [self presentViewController:imageController animated:YES completion:nil];
        }
        
        tagOfActivityImage = 0;

    }

    // delete
    if(option == 4){
        NSLog(@"Deletando imagem");
        [self deleteImage];
        
    }
    
    
}

-(void) deleteImage{

    UIImageView * imageTapped = (UIImageView *)[self.view viewWithTag:tagOfActivityImage];
    imageTapped.image = [UIImage imageNamed:@"icon_image_default"];

    Estimates * estimate = (Estimates *) self.detailItem;
    
    // Open directory
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    // Name of Folder
	NSString * folderToSave = [NSString stringWithFormat:@"/folder_%@",estimate.protocol];
    
    // folder with custom name
    NSString *dataPath = [docDir stringByAppendingPathComponent:folderToSave];
    
    // Creating complete file path
	NSString *jpegFilePath = [NSString stringWithFormat:@"%@/image_%@_%ld.jpeg",dataPath,estimate.protocol,(long)tagOfActivityImage];
    
	NSLog(@"DELETANDO imagem");
    NSLog(@"name of directory IMAGE to delete %@",jpegFilePath);
    
    //Delete folder images
    if ([[NSFileManager defaultManager] fileExistsAtPath:jpegFilePath]){
        NSLog(@"Deletando IMAGEM : %@",jpegFilePath);
        [[NSFileManager defaultManager] removeItemAtPath:jpegFilePath error:nil];
    }else{
        NSLog(@"imagem não existe: %@",jpegFilePath);
    }
	
	NSLog(@"CALLING IMAGE UPDATE");
    [self updateImages:NULL];
}


#pragma mark dataPicker

-(IBAction)dateChanged:(id)sender{
    if(self.switchDateInit.isOn == YES){
        NSLog(@"changed data");
        [self updateData:self.dateInitWork.date];
    }else{
        NSLog(@"Bloquiado , não alterar data");
        [self.dateInitWork setDate:[NSDate date]];
    }
    
    
    
}


#pragma mark

-(void) showBodySearchTable:(NSString *)searchText;
{

    arrayBodyShop = [self getAllBodyShops:searchText];

    if([arrayBodyShop count] >0){
        NSLog(@"QT ITENS BODY ENCONTRADOS : %ld",(unsigned long)[arrayBodyShop count]);
        if([arrayBodyShop objectAtIndex:0] != NULL){

            // Pega o label de recomendacao
            UILabel * label = (UILabel *)[self.view viewWithTag:120];
            
            Body_shop_repaire * body = [arrayBodyShop objectAtIndex:0];
            label.text = [NSString stringWithFormat:@" %@     ",body.complete_name];
            
            // Aparece o label de recomenaao
            [label setHidden:NO];
            // Aparece o button para apaga recomenacao
            [self.buttonDeleteRecommend setHidden:NO];
            
            [self.bodyAdress setPlaceholder:body.adress];
            [self.bodyPostaCode setPlaceholder:body.postal_code];
            [self.bodyCity setPlaceholder:body.city];
            [self.bodyTel setPlaceholder:body.tel];
            
            
        }
    }else
        [self removeBodyRecommend];
    
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{

    NSInteger tag = textField.tag;
    if(tag == 6){
        
        NSString * query = [NSString stringWithFormat:@"%@%@",textField.text,string];
        NSLog(@"Consultando %@",query);
        
        if([string isEqualToString:@""])
            [self removeBodyRecommend];
        else
            [self showBodySearchTable:query];
        

    }
    
    return YES;
}

-(void) removeBodyRecommend
{
    
            UILabel * r1 = (UILabel *)[self.view viewWithTag:120];
            [r1 setHidden:YES];
            [self.buttonDeleteRecommend setHidden:YES];
    
            NSString * null_str = @"";
            [self.bodyAdress setPlaceholder:null_str];
            [self.bodyPostaCode setPlaceholder:null_str];
            [self.bodyCity setPlaceholder:null_str];
            [self.bodyTel setPlaceholder:null_str];

}



-(NSMutableArray *) getAllBodyShops:(NSString *)name{
    NSLog(@"consulta body shop");
    NSManagedObjectContext * context = self.managedObjectContext;
    
    NSEntityDescription * entity = [NSEntityDescription entityForName:@"Recommend" inManagedObjectContext:context];
    NSFetchRequest * request = [[NSFetchRequest alloc]init];
    [request setEntity:entity];
    
    NSPredicate * pred = [NSPredicate predicateWithFormat:@"complete_name contains[cd] %@",name];
    [request setPredicate:pred];
    
    NSSortDescriptor * sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"complete_name" ascending:YES];
    NSArray * sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    [request setSortDescriptors:sortDescriptors];
    
    NSError * error;
    NSMutableArray * array = [[context executeFetchRequest:request error:&error]mutableCopy];
    if(!array)
    {
        NSLog(@"Error %@",error);
    }
    
    return array;
    
}

-(IBAction)setRecommendation:(id)sender{
    
    if([arrayBodyShop count]>0){
        
        Body_shop_repaire * body = [arrayBodyShop objectAtIndex:0];
        
        self.bodyName.text = body.complete_name;
        self.bodyAdress.text = body.adress;
        self.bodyPostaCode.text = body.postal_code;
        self.bodyCity.text = body.city;
        self.bodyTel.text = body.tel;
        
        [self updateBodyRepair];
        [self removeBodyRecommend];
        
    }
    
    

}

#pragma mark Preset
-(void)putPreset:(Prices *)preset{

    [self.pocPreset dismissPopoverAnimated:NO];
    self.presetItem = preset;
    self.labelPresetName.text = preset.name;
    self.labelLastPreset.text = [NSString stringWithFormat:@"%@",preset.name];
    [self updatePreset:preset.name];
    
}

-(void)updatePreset:(NSString *)presetName{
    
    Estimates * estimate = (Estimates *)self.detailItem;
    estimate.lastPreset = presetName;
    [self save];

}



#pragma mark Date INIT
-(IBAction)useDateInitChange:(id)sender{

    
    if(self.switchDateInit.isOn == YES){
        NSLog(@"changed data");
        [self updateData:self.dateInitWork.date];
                [self.dateInitWork setAlpha:1];
    }else{
        NSLog(@"changed data to null");
        [self updateData:NULL];
        [self.dateInitWork setDate:[NSDate date]];
        [self.dateInitWork setAlpha:0.3];
    }
    

}

@end
