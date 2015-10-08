//
//  preferencesDefault.m
//  master2
//
//  Created by user on 15/02/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import "preferencesDefault.h"

@implementation preferencesDefault


+(NSString *) getLanguagePreference{

        NSString * ret;
        
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        
        NSInteger index;
        NSString * language = [prefs stringForKey:@"preferenceLanguage"];
        
        if(language == NULL){
            index = 0;
            NSLog(@"Iniciando com preferencia de linguagem = 0 ( PT )");
            [prefs setInteger:index forKey:@"preferenceLanguage"];
            
        }else{
            index = [prefs integerForKey:@"preferenceLanguage"];
            NSLog(@"Preferencia de linguagem  >>>> %ld",(long)index);
        }
        
        return ret = [NSString stringWithFormat:@"%ld",(long)index];

}


+(NSString *) getCoinPreference{
    
    NSString * ret;
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    NSInteger index;
    NSString * coin = [prefs stringForKey:@"preferenceCoin"];
    
    if(coin == NULL){
        index = 0;
        NSLog(@"Iniciando com preferencia de moeda = 0 ( R$ )");
        [prefs setInteger:index forKey:@"preferenceCoin"];
        
    }else{
        index = [prefs integerForKey:@"preferenceCoin"];
        NSLog(@"Preferencia de moeda  >>>> %ld",(long)index);
    }
    
    return ret = [NSString stringWithFormat:@"%ld",(long)index];
    
}

+(void) setLanguagePreference:(NSInteger)index{
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    NSString * language = [prefs stringForKey:@"preferenceLanguage"];
    
    if(language != NULL){
        NSLog(@"Modificando preferencia de linguagem para >>> %d",index);
        [prefs setInteger:index forKey:@"preferenceLanguage"];
    }

}

+(void) setCoinPreference:(NSInteger)index{
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString * coin = [prefs stringForKey:@"preferenceCoin"];
    
    if(coin != NULL){
        NSLog(@"Modificando preferencia de moeda para >>> %d",index);
        [prefs setInteger:index forKey:@"preferenceCoin"];
    
    }

}

@end
