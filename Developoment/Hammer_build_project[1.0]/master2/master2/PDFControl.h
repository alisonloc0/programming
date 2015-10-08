//
//  PDFControl.h
//  master2
//
//  Created by user on 05/02/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PDFControl : NSObject


+(NSString*)createPDFfromUIView:(UIView*)aView saveToDocumentsWithFileName:(NSString*)aFilename;
+(NSMutableData *)createPDFDatafromUIView:(UIView*)aView;
@end
