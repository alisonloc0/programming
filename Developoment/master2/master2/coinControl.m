//
//  coinControl.m
//  master2
//
//  Created by user on 15/02/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import "coinControl.h"

@implementation coinControl



+(NSMutableArray *) getArrayLabelCoin{

    NSMutableArray * array = [NSMutableArray arrayWithObjects:@"Real ",@"Euro ",@"Dolár",@"Rand",@"Franco Suiço",@"Libra",@"Peso",@"$",nil];
    
    return array;

}

+(NSString *) getLabelValueCoin:(NSString *)type{
    NSString * coin;
    
    if([type isEqualToString:@"0"])
        coin = @"Real ";
    if([type isEqualToString:@"1"])
        coin = @"Euro";
    if([type isEqualToString:@"2"])
        coin = @"Dolár";
    if([type isEqualToString:@"3"])
        coin = @"Rand ";
    if([type isEqualToString:@"4"])
        coin = @"Franco Suiço";
    if([type isEqualToString:@"5"])
        coin = @"Libra";
    if([type isEqualToString:@"6"])
        coin = @"Peso";
    if([type isEqualToString:@"7"])
        coin = @"$";
    
    return coin;
    
    
}

+(NSMutableArray *) getArrayCoin{
    
    NSMutableArray * array = [NSMutableArray arrayWithObjects:@"R$ ",@"€ ",@"US$ ",@"R ",@"CHF ",@"£ ",@"$ ",@"$ ",nil];
    return array;
    
}

+(NSString *) getValueCoin:(NSString *)type{
    
    NSString * coin;
    
    if([type isEqualToString:@"0"])
        coin = @"R$ ";
    if([type isEqualToString:@"1"])
        coin = @"€ ";
    if([type isEqualToString:@"2"])
        coin = @"US$ ";
    if([type isEqualToString:@"3"])
        coin = @"R ";
    if([type isEqualToString:@"4"])
        coin = @"CHF ";
    if([type isEqualToString:@"5"])
        coin = @"£ ";
    if([type isEqualToString:@"6"])
        coin = @"$ ";
    if([type isEqualToString:@"7"])
        coin = @"$ ";

    
    return coin;
    
}



@end
