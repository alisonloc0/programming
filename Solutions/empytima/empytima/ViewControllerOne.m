//
//  ViewControllerOne.m
//  empytima
//
//  Created by user on 07/09/13.
//  Copyright (c) 2013 User. All rights reserved.
//

#import "ViewControllerOne.h"

@interface ViewControllerOne ()
{
    // *  Usado para controlar as pesquisas
    
    NSString * query;
    NSString * urlPage;
    NSString * namePage;
    NSString * concatPage;

    // *  Usado para controlar o progressView do browser
    
    BOOL documentLoadComplete;
    BOOL documentAnimating;
    


}
@end

@implementation ViewControllerOne
@synthesize cancelButtonView,searchBar,webView,toolBar,blackOverlay,progressLineView;


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
    
    [self initPreferences];
    
    [searchBar setDelegate:self];
    [webView setDelegate:self];
    
    [self webViewPullRefresh];
    webView.scalesPageToFit = YES;

    [searchBar becomeFirstResponder];

    documentLoadComplete = true;
    documentAnimating = false;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) initPreferences
{
    NSString * keySearchDefault = @"searchDefault";
    NSString * keyNameOfSearchDefault = @"nameOfSearchDefault";
    NSString * keyConcatOfSearchDefault = @"concatOfSearchDefault";
    
    // Procurando por padrões de busca
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *searchDefault = [defaults objectForKey:keySearchDefault];
    NSString *nameOfSearchDefault = [defaults objectForKey:keyNameOfSearchDefault];
    NSString *concatOfSearchDefault = [defaults objectForKey:keyConcatOfSearchDefault];
    
    if(searchDefault ==  nil && nameOfSearchDefault == nil && concatOfSearchDefault == nil)
    {
     
        urlPage = @"http://m.buscape.com.br/result_search?keyword=";
        namePage = @"Buscapé";
        concatPage = @"+";
        
        [defaults setObject:urlPage forKey:keySearchDefault];
        [defaults setObject:namePage forKey:keyNameOfSearchDefault];
        [defaults setObject:concatPage forKey:keyConcatOfSearchDefault];
        
        NSLog(@"Preferencia de buscador inicial criada");
        
    }else
    {
        
        urlPage = searchDefault;
        namePage = nameOfSearchDefault;
        concatPage = concatOfSearchDefault;
    }
    

    // Procurando por padrões de busca e histórico
    
    NSString * keyNumberOfHistoryDefault = @"numberOfHistoryDefault";
    NSString * keyTypeOfListDefault = @"typeOfListDefault";
    
    if([defaults objectForKey:keyNumberOfHistoryDefault] == nil)
    {
        [defaults setInteger:0 forKey:keyNumberOfHistoryDefault];
        NSLog(@"Preferencia de histórico criada");
    }
    
    
    //Buscando preferencias de tipo de visualizacao da lista de lojas
    
    if([defaults objectForKey:keyTypeOfListDefault] == nil)
    {
        [defaults setInteger:0 forKey:keyTypeOfListDefault];
        NSLog(@"Preferencia de lista criada");
    }
    
    
}

#pragma mark webView
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    // Tratar fila de back e forward aqui
    
    NSLog([NSString stringWithFormat:@"%@",request.URL]);
    return YES;
}

-(void) webViewDidStartLoad:(UIWebView *)webView
{
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    documentLoadComplete = false;

    if(documentAnimating == false)
    [self webViewProgressAnimation];
}

-(void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;

    documentLoadComplete = true;
    
    
}

-(void) webViewDidFinishLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    documentLoadComplete = true;
}

-(void) webViewNavigate
{
    // Removendo acentuação
    NSData * data = [query dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString * str = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    
    // Removendo os espaços e colocando o concatenador;
    NSString * prepareUserQuery = [str stringByReplacingOccurrencesOfString:@" " withString:concatPage];
    
    [self.webView loadRequest:
     [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",urlPage,prepareUserQuery]]]];
    

}

-(void) webViewPullRefresh
{
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(webViewHandleRefresh:) forControlEvents:UIControlEventValueChanged];
    [self.webView.scrollView addSubview:refreshControl];
}

-(void) webViewHandleRefresh:(UIRefreshControl *)refresh
{
    
    [self.webView reload];
    
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:0
                     animations:^{
                     }
                     completion:^(BOOL completion){
                         [refresh endRefreshing];
                     }
     ];
    
    
    
    
}

-(void) webViewProgressAnimation
{
    if( documentLoadComplete == false)
    {
        documentAnimating = true;
    [UIView animateWithDuration:1
                          delay:0.0
                        options:0
                     animations:^{
                         self.progressLineView.frame = CGRectMake(self.progressLineView.frame.origin.x,self.progressLineView.frame.origin.y, self.view.frame.size.width , 1);
                     }
                     completion:^(BOOL completion){
                         
                         [UIView animateWithDuration:1
                                               delay:0.0
                                             options:0
                                          animations:^{
                                              self.progressLineView.frame = CGRectMake(self.progressLineView.frame.size.width,self.progressLineView.frame.origin.y, 0 , 1);

                                          }
                                          completion:^(BOOL completion){
                                              self.progressLineView.frame = CGRectMake(0,self.progressLineView.frame.origin.y, 0 , 1);
                                              documentAnimating = false;
                                              
                                              [self webViewProgressAnimation];


                                          }];
                         
                         
                         
                     }];
        }
  

}

-(IBAction)webViewGoBack;
{
        [webView goBack];
}

-(IBAction)webViewGoForward;
{
 
    [self.webView goForward];
    
}


#pragma mark searchBar

-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    [self searchBarAddCancelButton];
    [self searchBarAddBlackOverlay];


    return YES;
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    query = searchText;
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self searchBarRemoveCancelButton];
    [self searchBarRemoveBlackOverlay];
    [self webViewNavigate];
    [self saveQuery];

    

}

-(void) searchBarAddCancelButton
{
    
    [UIView animateWithDuration:0.3
     delay:0.0
     options:0
     animations:^{
     self.searchBar.frame = CGRectMake(
                            self.searchBar.frame.origin.x,
                            self.searchBar.frame.origin.y,
                            self.searchBar.frame.size.width - self.cancelButtonView.frame.size.width -10,
                            self.searchBar.frame.size.height
                                       ) ;
                            cancelButtonView.alpha = 1;

         
     }
     
     completion:^(BOOL completion){

     
     }];
    
}

-(void) searchBarRemoveCancelButton
{
    [searchBar resignFirstResponder];
    cancelButtonView.alpha = 0;
    
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options:0
                     animations:^{

                         self.searchBar.frame = CGRectMake(
                                                           self.searchBar.frame.origin.x,
                                                           self.searchBar.frame.origin.y,
                                                           self.searchBar.frame.size.width + self.cancelButtonView.frame.size.width +10,
                                                           self.searchBar.frame.size.height
                                                           ) ;

                         
                         

                         
                     }
     
                     completion:^(BOOL completion){
                         
                         
                     }];
}

-(void) searchBarAddBlackOverlay
{
 


    [UIView beginAnimations:@"FadeIn" context:nil];
    [UIView setAnimationDuration:0.5];
    
    self.blackOverlay.alpha = 0.6;
   
    [UIView commitAnimations];


}

-(void) searchBarRemoveBlackOverlay
{
    
    [UIView beginAnimations:@"FadeOut" context:nil];
    [UIView setAnimationDuration:0.5];
    
    self.blackOverlay.alpha = 0.0;
    
    [UIView commitAnimations];
}

-(IBAction)searchBarActionCancel;
{
    self.searchBar.text = @"";
    [self searchBarRemoveCancelButton];
    [self searchBarRemoveBlackOverlay];
    
}

#pragma mark PROCEDURES

-(void) saveQuery
{
    NSString * keyNumberOfHistoryDefault = @"numberOfHistoryDefault";
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    
    if([defaults integerForKey:keyNumberOfHistoryDefault] == 0)
    {
        // Salvar historico
        
        NSLog(@"SAVE QUERY = YES");
    }else
        NSLog(@"SAVE QUERY = NO");
}

-(void) swapPage:(NSString *) url withName:(NSString *)name withConcat:(NSString *)concat
{
    // Atualiza URL e NOME da pagina vindos do click no grid
    
    urlPage = url;
    namePage = name;
    concatPage = concat;
    
    // Chama funcão para carregar outra pagina
    
    if(query != nil && ![query isEqual: @""])
        [self webViewNavigate];
    else
    {
        [searchBar becomeFirstResponder];
    }
    
}




@end
