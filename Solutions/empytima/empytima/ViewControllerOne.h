//
//  ViewControllerOne.h
//  empytima
//
//  Created by user on 07/09/13.
//  Copyright (c) 2013 User. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerOne : UIViewController<UIWebViewDelegate,UISearchBarDelegate>

@property(nonatomic,retain) IBOutlet UIButton * cancelButtonView;
@property(nonatomic,retain) IBOutlet UISearchBar * searchBar;
@property(nonatomic,retain) IBOutlet UIToolbar * toolBar;
@property(nonatomic,retain) IBOutlet UIWebView * webView;
@property(nonatomic,retain) IBOutlet UIView * blackOverlay;
@property(nonatomic,retain) IBOutlet UIView * progressLineView;


-(IBAction)searchBarActionCancel;

-(IBAction)webViewGoBack;
-(IBAction)webViewGoForward;

@end
