//
//  languageControl.m
//  master2
//
//  Created by user on 12/02/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import "languageControl.h"

@implementation languageControl

+(NSMutableArray *) getArrayLanguage:(NSString *)type{
    
    // 0 = PT
    // 1 = FR
    // 2 = US
    
    
    NSMutableArray * labelEnglish = [[NSMutableArray alloc]initWithObjects:
                    @"",
                    @"INSURANCE",
                    @"Name",
                    @"Contract No.",
                    @"Agency",
                    @"Tel",
                    @"Insured for Climate Damage",
                    @"BODY SHOP REPAIRE",
                    @"Name",
                    @"Adress",
                    @"Postal Code",
                    @"City",
                    @"Tel",
                    @"VEICLE",
                    @"Brand",
                    @"Model",
                    @"Color",
                    @"License No.",
                    @"Car frame No.",
                    @"Year",
                    @"KM Counter",
                    @"REPAIRED FOR",
                    @"PARTS",
                    @"TYPE OF",
                    @"DAMAGE",
                    @"COUNT",
                    @"PRICE TAX",
                    @"EXEMPT",
                    @"PAINT",
                    @"1. Bonnet",
                    @"2. Roof",
                    @"3. Sun Roof",
                    @"4. Boot",
                    @"5. Front left Wing",
                    @"6. Front right wing",
                    @"7. Back left wing",
                    @"8. Back right wing",
                    @"9. Front left door",
                    @"10. Front right door",
                    @"11. Back left door",
                    @"12. Back right door",
                    @"13. Left roof pilar",
                    @"14. Right roof pilar",
                    @"15. Other",
                    @"Dis/Reassembly",
                    @"TOTAL",
                    @"Expert’s Signature",
                    @"Manager’s Signature",
                    @"Parts to change",
                    @"Quote Date:",
                    @"Date of start repair",
                    @"VEHICLE",
                    @"VALUATION FORM",
                    nil];
    
        NSMutableArray * labelFrench = [[NSMutableArray alloc]initWithObjects:
                   @"",
                   @"ASSURANCE",
                   @"Name",
                   @"Contract No.",
                   @"Agency",
                   @"Tel",
                   @"Insured for Climate Damage",
                   @"GARAGE",
                   @"Name",
                   @"Adress",
                   @"Postal Code",
                   @"City",
                   @"Tel",
                   @"VEICLE",
                   @"Brand",
                   @"Model",
                   @"Color",
                   @"License No.",
                   @"Car frame No.",
                   @"Year",
                   @"KM Counter",
                   @"REPAIRED FOR",
                   @"PARTS",
                   @"TYPE OF",
                   @"DAMAGE",
                   @"COUNT",
                   @"PRICE TAX",
                   @"EXEMPT",
                   @"PAINT",
                   @"1. Capot",
                   @"2. Pavillon",
                   @"3. Toit ouvrant",
                   @"4. Cofre",
                   @"5. Aile avant gauche",
                   @"6. Aile avant droite",
                   @"7. Aile arrière gauche",
                   @"8. Aile arrière droite",
                   @"9. Porte avant gauche",
                   @"10. Porte avant droite",
                   @"11. Porte arrière gauche",
                   @"12. Porte arrière droite",
                   @"13. Brancard gauche",
                   @"14. Brancard droite",
                   @"15. Autre",
                   @"Dis/Reassembly",
                   @"TOTAL",
                   @"Expert’s Signature",
                   @"Manager’s Signature",
                   @"Parts to change",
                   @"Quote Date:",
                   @"Date of start repair",
                    @"VEHICLE",
                    @"VALUATION FORM",
                   nil];
    
        NSMutableArray * labelPortuguese = [[NSMutableArray alloc]initWithObjects:
                       @"",
                       @"SEGURADORA",
                       @"Nome",
                       @"No. contrato",
                       @"Agência",
                       @"Telefone",
                       @"Nome da seguradora",
                       @"OFICINA",
                       @"Nome",
                       @"Endereço",
                       @"Código postal",
                       @"Cidade",
                       @"Telefone",
                       @"VEÍCULO",
                       @"Marca",
                       @"Modelo",
                       @"Cor",
                       @"Placa",
                       @"No. do orçamento",
                       @"Ano",
                       @"Quilometragem",
                       @"Reparado por:",
                       @"PARTES",
                       @"TIPO DE",
                       @"DANO",
                       @"   QTD.",
                       @"    PREÇO",
                       @"    PARTE",
                       @"PINTURA",
                       @"1. Capo",
                       @"2. Teto",
                       @"3. Teto solar",
                       @"4. Tampa",
                       @"5. Paralama dianteiro esquerdo",
                       @"6. Paralama dianteiro direito",
                       @"7. Paralama traseiro esquerdo",
                       @"8. Paralama traseiro esquerdo",
                       @"9. Porta frontal esquerda     ",
                       @"10. Porta frontal direita       ",
                       @"11. Porta traseira esquerda  ",
                       @"12. Porta traseira direita    ",
                       @"13. Parante esquerdo     ",
                       @"14. Parante direito            ",
                       @"15. Outros                     ",
                       @"Montagem",
                       @"TOTAL",
                       @"Assinatura Perito",
                       @"Assinatura Gerente",
                       @"Peças",
                       @"Data orçamento:",
                       @"Data início dos reparos",
                       @"ORÇAMENTO",
                        @"VEÍCULO",
                       nil];
    
     if( [type isEqualToString:@"0"]){
         NSLog(@"Linguagem portugues");
         return labelPortuguese;
     }else
     if( [type isEqualToString:@"1"]){
                  NSLog(@"Linguagem frances");
            return labelFrench;
     }else
         if( [type isEqualToString:@"2"]){

             NSLog(@"Linguagem ingles");
             return labelEnglish;
         }else{
                               NSLog(@"Linguagem default");
                                return labelEnglish;
         }

}

+(NSMutableArray *) getArrayLanguageAdd:(NSString *)type{

    // 0 = PT
    // 1 = FR
    // 2 = US
    
    
    NSMutableArray * labelEnglish = [[NSMutableArray alloc]initWithObjects:
                                     @"DATE OF INIT",
                                     @"process",
                                     @"USE PRESET",
                                     @"LAST USED :",
                                     @"Process Number",
                                     @"SETTINGS",
                                     @"Language",
                                     @"Coin",
                                    nil];
    
    NSMutableArray * labelFrench = [[NSMutableArray alloc]initWithObjects:
                                    @"DATE OF INIT",
                                    @"process",
                                    @"USE PRESET",
                                    @"LAST USED :",
                                    @"Process Number",
                                    @"SETTINGS",
                                    @"Language",
                                    @"Coin",
                                    nil];
    
    NSMutableArray * labelPortuguese = [[NSMutableArray alloc]initWithObjects:
                                        @"DATA DE INÍCIO",
                                        @"Reparos",
                                        @"USAR PRESET",
                                        @"ÚLTIMO USADO :",
                                        @"Protocolo",
                                        @"AJUSTES",
                                        @"Linguagem",
                                        @"Moeda",
                                        nil];
    
    if( [type isEqualToString:@"0"]){
        NSLog(@"Linguagem add portugues");
        return labelPortuguese;
    }else
        if( [type isEqualToString:@"1"]){
            NSLog(@"Linguagem add frances");
            return labelFrench;
        }else
            if( [type isEqualToString:@"2"]){

                NSLog(@"Linguagem add ingles");
                return labelEnglish;
            }else{
                NSLog(@"Linguagem add default");
                return labelEnglish;
            }
}



@end
