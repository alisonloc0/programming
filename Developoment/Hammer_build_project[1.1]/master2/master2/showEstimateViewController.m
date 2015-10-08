//
//  showEstimateViewController.m
//  master2
//
//  Created by user on 28/01/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import "showEstimateViewController.h"
#import "Estimates.h"
#import "Insurance.h"
#import "Body_shop_repaire.h"
#import "Veicle.h"
#import "Colors.h"
#import "Parts.h"
#import "Espec_part.h"
#import <MessageUI/MessageUI.h>
#import "PDFControl.h"
#import "Prices.h"
#import "languageControl.h"
#import "coinControl.h"

@interface showEstimateViewController ()<MFMailComposeViewControllerDelegate>

@end

// TAGS
// 1 - 6 [ INSURENCE LABELS ]
// 7 - 12 [ BODY SHOW REPAIR ]
// 13 - 21 [ VEICLE ]
// 22 - 45 [ PARTS ]
// 46 - 50 [ SIGNATURES ]
// 51 - 52 [ Valuation FORM]
// 100 [ PROTOCOL ]
// 101-105 [ INSURENCE ]


@implementation showEstimateViewController
{
    NSString * coin;
    NSString * language;
    
    int xPortrait;
    int xLands;

    NSInteger orientation;
    
    
    NSMutableArray * arrayLanguage;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(orientationChanged:)
                                                 name:@"UIDeviceOrientationDidChangeNotification" object:nil];
    


    [self configurePreferences];
    [self configureLabelsIdioma];
    [self configureView];
    [self configureInsurence];
    [self configureBodyShop];
    [self configureVeicle];
    [self configureParts];
    [self configureDate];
    
    UIBarButtonItem * buttonEmail = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(sendEmail:)];
    
    [self.navigationItem setRightBarButtonItem:buttonEmail];
}

-(void)sendEmail:(id)sender{
    
    NSString *emailTitle = [NSString stringWithFormat:@"Estimate protocol [ %@ ]",self.protocolLabel.text];
    
    //NSString *messageBody = @"Hey, check this out!";
    //NSArray *toRecipents = [NSArray arrayWithObject:@"support@appcoda.com"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];

    //[mc setMessageBody:messageBody isHTML:NO];
    //[mc setToRecipients:toRecipents];
    
    NSString * fileName = [NSString stringWithFormat:@"folder_%@/estimate.pdf",self.protocolLabel.text];
    NSString * path = [PDFControl createPDFfromUIView:self.containerView saveToDocumentsWithFileName:fileName];
    
    NSData *fileData = [NSData dataWithContentsOfFile:path];
    
    // Determine the MIME type
    NSString *mimeType;
    
    mimeType = @"application/pdf";
    
    NSLog(@"ADICIONANDO ORCAMENTO AO EMAIL");
    // Add attachment estimate
    [mc addAttachmentData:fileData mimeType:mimeType fileName:@"estimate.pdf"];
    
    //  add attachment prices
    if(self.presetItem != NULL){
        
        Prices * price = (Prices *)self.presetItem;
        
        NSLog(@"ADICIONANDO PRESET AO EMAIL");
        
        NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        
        // Name Folder price
        NSString * folder = [NSString stringWithFormat:@"preset/preset_%@.pdf",price.id_price];
        
            // Path Folder price pdf
            NSString * presetPath = [docDir stringByAppendingPathComponent:folder];
            NSData * presetData = [NSData dataWithContentsOfFile:presetPath];
            [mc addAttachmentData:presetData mimeType:mimeType fileName:@"prices.pdf"];
        
    }else
        NSLog(@"NENHUM PRESET SELECIONADO");

    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
    
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
    

}

-(void) configurePreferences{

    Estimates * estimate = (Estimates *) self.detailItem;
    coin = [coinControl getValueCoin:estimate.coin];
    language = estimate.language;
    
}

-(void)configureView{
    xPortrait = 30;
    xLands = 0;
    
    
    self.scrollView.contentSize = CGSizeMake(0, 1500);
    
    if (UIDeviceOrientationIsLandscape(self.interfaceOrientation))
    {
        NSLog(@"INIT Lands");
        orientation=1;
    }else  {
        NSLog(@"INIT port");
        orientation=2;
    }
    
    [self resizeView];
    
    struct CGColor * borderColor = [UIColor colorWithWhite:0.8 alpha:1.0].CGColor;
    float borderWidth  = 1.0f;
    
    self.backgroundView.layer.borderColor = borderColor;
    self.backgroundView.layer.borderWidth = borderWidth;
}

-(void) configureInsurence{
    
    Estimates * estimate = (Estimates *) self.detailItem;
    Insurance * insurence = estimate.insurance;
            [self putText:self.protocolLabel withValue:estimate.protocol];
            [self putText:self.labelTelDefault withValue:estimate.telDefault];
            [self putText:self.nameInsurenceLabel withValue:insurence.name];
            [self putText:self.contractInsurenceLabel withValue:insurence.contract_no];
            [self putText:self.agencyInsurenceLabel withValue:insurence.agency];
            [self putText:self.telInsurenceLabel withValue:insurence.tel];
            [self putText:self.insuredInsurenceLabel withValue:insurence.insured_for_climate_damage];

    
    
}

-(void) configureBodyShop{
    
    Estimates * estimate = (Estimates *) self.detailItem;
    Body_shop_repaire * body_shop = (Body_shop_repaire *) estimate.body_shop_repaire;
    

        [self putText:self.nameBody withValue:body_shop.complete_name];
        [self putText:self.adressBody withValue:body_shop.adress];
        [self putText:self.postaCodeBody withValue:body_shop.postal_code];
        [self putText:self.cityBody withValue:body_shop.city];
        [self putText:self.telBody withValue:body_shop.tel];
}

-(void) configureVeicle{
        Estimates * estimate = (Estimates *) self.detailItem;
        Veicle * veicle = estimate.veicle;
        [self putText:self.brandVeicle withValue:veicle.brand];
        [self putText:self.modelVeicle withValue:veicle.model];

        [self putText:self.licenseVeicle withValue:veicle.license_no];
        [self putText:self.carFrameVeicle withValue:veicle.car_frame_no];
        [self putText:self.yearVeicle withValue:veicle.year];
        [self putText:self.kmVeicle withValue:veicle.km_counter];
        [self putText:self.kmVeicle withValue:veicle.km_counter];
        [self putText:self.repairedForVeicle withValue:estimate.repaired_for];
    
    if(veicle.color != NULL){
        self.colorVeicle.backgroundColor = [Colors colorFromHexString:veicle.color];
    }else{
        NSLog(@"No color in estimates");
    }
}

-(void)configureParts{

    Estimates * estimate = (Estimates *) self.detailItem;
    Parts * parts = estimate.parts;

    // Bonnet
    Espec_part * espec ;
    
    espec = NULL;
    espec = parts.bonnet;
    [self putText:self.damageBonnet withValue:espec.type_of_damage];
    [self putText:self.countBonnet withValue:espec.count];
    [self putTextMoney:self.priceBonnet withValue:espec.price_tax_exempt];
    [self putPaint:self.paintBonnet withValue:espec.paint];
    
    espec = NULL;
    espec = parts.roof;
    [self putText:self.damageRoof withValue:espec.type_of_damage];
    [self putText:self.countRoof withValue:espec.count];
    [self putTextMoney:self.priceRoof withValue:espec.price_tax_exempt];
    [self putPaint:self.paintRoof withValue:espec.paint];
    
    espec = NULL;
    espec = parts.sun_roof;
    [self putText:self.damageSunRoof withValue:espec.type_of_damage];
    [self putText:self.countSunRoof withValue:espec.count];
    [self putTextMoney:self.priceSunRoof withValue:espec.price_tax_exempt];
    [self putPaint:self.paintSunRoof withValue:espec.paint];
    
    espec = NULL;
    espec = parts.boot;
    [self putText:self.damageBoot withValue:espec.type_of_damage];
    [self putText:self.countBoot withValue:espec.count];
    [self putTextMoney:self.priceBoot withValue:espec.price_tax_exempt];
    [self putPaint:self.paintBoot withValue:espec.paint];
    

    espec = NULL;
    espec = parts.front_left_wing;
    [self putText:self.damageFrontLeftWing withValue:espec.type_of_damage];
    [self putText:self.countFrontLeftWing withValue:espec.count];
    [self putTextMoney:self.priceFrontLeftWing withValue:espec.price_tax_exempt];
    [self putPaint:self.paintFrontLeftWing withValue:espec.paint];
    
    espec = NULL;
    espec = parts.front_right_wing;
    [self putText:self.damageFrontRightWing withValue:espec.type_of_damage];
    [self putText:self.countdamageFrontRightWing withValue:espec.count];
    [self putTextMoney:self.pricedamageFrontRightWing withValue:espec.price_tax_exempt];
    [self putPaint:self.paintdamageFrontRightWing withValue:espec.paint];
    
    espec = NULL;
    espec = parts.back_left_wing;
    [self putText:self.damageBackLeftWing withValue:espec.type_of_damage];
    [self putText:self.countBackLeftWing withValue:espec.count];
    [self putTextMoney:self.priceBackLeftWing withValue:espec.price_tax_exempt];
    [self putPaint:self.paintBackLeftWing withValue:espec.paint];
    
    espec = NULL;
    espec = parts.back_right_wing;
    [self putText:self.damageBackRightWing withValue:espec.type_of_damage];
    [self putText:self.countBackRightWing withValue:espec.count];
    [self putTextMoney:self.priceBackRightWing withValue:espec.price_tax_exempt];
    [self putPaint:self.paintBackRightWing withValue:espec.paint];
    
    espec = NULL;
    espec = parts.front_left_door;
    [self putText:self.damageFrontLeftDoor withValue:espec.type_of_damage];
    [self putText:self.countFrontLeftDoor withValue:espec.count];
    [self putTextMoney:self.priceFrontLeftDoor withValue:espec.price_tax_exempt];
    [self putPaint:self.paintFrontLeftDoor withValue:espec.paint];
    
    espec = NULL;
    espec = parts.front_right_door;
    [self putText:self.damageFrontRightDoor withValue:espec.type_of_damage];
    [self putText:self.countFrontRightDoor withValue:espec.count];
    [self putTextMoney:self.priceFrontRightDoor withValue:espec.price_tax_exempt];
    [self putPaint:self.paintFrontRightDoor withValue:espec.paint];
    espec = NULL;
    espec = parts.back_left_door;
    [self putText:self.damageBackLeftDoor withValue:espec.type_of_damage];
    [self putText:self.countBackLeftDoor withValue:espec.count];
    [self putTextMoney:self.priceBackLeftDoor withValue:espec.price_tax_exempt];
    [self putPaint:self.paintBackLeftDoor withValue:espec.paint];
    
    espec = NULL;
    espec = parts.back_right_door;
    [self putText:self.damageBackRightDoor withValue:espec.type_of_damage];
    [self putText:self.countBackRightDoor withValue:espec.count];
    [self putTextMoney:self.priceBackRightDoor withValue:espec.price_tax_exempt];
    [self putPaint:self.paintBackRightDoor withValue:espec.paint];
    
    espec = NULL;
    espec = parts.left_roof_pillar;
    [self putText:self.damageLeftRoofPilar withValue:espec.type_of_damage];
    [self putText:self.countLeftRoofPilar withValue:espec.count];
    [self putTextMoney:self.priceLeftRoofPilar withValue:espec.price_tax_exempt];
    [self putPaint:self.paintLeftRoofPilar withValue:espec.paint];
    
    espec = NULL;
    espec = parts.right_roof_pillar;
    [self putText:self.damageRightRoofPilar withValue:espec.type_of_damage];
    [self putText:self.countRightRoofPilar withValue:espec.count];
    [self putTextMoney:self.priceRightRoofPilar withValue:espec.price_tax_exempt];
    [self putPaint:self.paintRightRoofPilar withValue:espec.paint];
    
    espec = NULL;
    espec = parts.other;
    [self putText:self.damageOther withValue:espec.type_of_damage];
    [self putText:self.countOther withValue:espec.count];
    [self putTextMoney:self.priceOther withValue:espec.price_tax_exempt];
    [self putPaint:self.paintOther withValue:espec.paint];

    [self putTextMoney:self.dis withValue:parts.dis_reassembly];
    [self putTextMoney:self.total withValue:parts.total];
    

}

-(void )configureDate{
    
    Estimates * estimate = (Estimates *) self.detailItem;
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"dd/MM/yyyy hh:mm"];
    
    NSString * dateProcess = [dateFormatter stringFromDate:estimate.date_estimate];
    
    NSString * dateInitWork = [dateFormatter stringFromDate:estimate.date_init_work];

    [self putText:self.dataProcess withValue:dateProcess];
    [self putText:self.dataInit withValue:dateInitWork];
}


-(void) putText:(UILabel *)label withValue:(NSString *)value{
    NSString * stringNull = @"-------";
    UILabel * textLabel = label;
    if(value != NULL && (![value isEqualToString:@""])&& (![value isEqualToString:@" "]) )
        textLabel.text = value;
    else
        textLabel.text = stringNull;
    
}

-(void) putTextMoney:(UILabel *)label withValue:(NSString *)value{
    NSString * stringNull = @"-------";

    UILabel * textLabel = label;
    if(value != NULL && (![value isEqualToString:@""])&& (![value isEqualToString:@" "]) )
        textLabel.text = [NSString stringWithFormat:@"%@ %@",coin,value];
    else
        textLabel.text = stringNull;
    
}

-(void) putPaint:(UILabel * )switchLabel withValue:(NSNumber *)paint{
    
    NSString * string_paint = [NSString stringWithFormat:@"%@",paint];
    NSString * stringNull = @"-------";
    
    if(paint != NULL){
        if([string_paint isEqualToString:@"0"])
            switchLabel.text = stringNull;
        else{
            // PT
            if([language isEqualToString:@"0"])
                            switchLabel.text = @"SIM";
                else // US OR FR
                            switchLabel.text = @"YES";
        }

        
        
    }else
    switchLabel.text =stringNull;
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
   // NSLog(@"criando pdf");
   // [self createPDFfromUIView:self.containerView saveToDocumentsWithFileName:@"pdf_orc2.pdf"];
}

-(void) configureLabelsIdioma{
    
    arrayLanguage = [languageControl getArrayLanguage:language];
    
    for(NSInteger i = 1;i<=52;i++){

        UILabel * label = (UILabel *)[self.view viewWithTag:i];
        label.text = [arrayLanguage objectAtIndex:i];
    }
    
}

-(void)orientationChanged:(NSNotification *)object{
    UIDeviceOrientation deviceOrientation = [[object object] orientation];
    
    if (deviceOrientation == UIDeviceOrientationLandscapeLeft || deviceOrientation == UIDeviceOrientationLandscapeRight)
    {
        NSLog(@"lands");
        orientation = 1;
    }else{
        orientation = 2;
        NSLog(@"portrait");
    }
    [self resizeView];
    
}

-(void) resizeView{
    if(orientation == 1){
                self.containerView.frame = CGRectMake(xLands,self.containerView.frame.origin.y,self.containerView.frame.size.width,self.containerView.frame.size.height);
    }
    
    if(orientation == 2){
                self.containerView.frame = CGRectMake(xPortrait,self.containerView.frame.origin.y,self.containerView.frame.size.width,self.containerView.frame.size.height);
    }
}
@end
