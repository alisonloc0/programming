
// TIRAR A BIBLIOTECA UIImage pq nao esta usando mais
// chegar quando for iphone 4 para ajustar os botoes

#import "MainContentViewController.h"
#import "INITViewController.h"

@interface MainContentViewController ()
{

 
}
@end

@implementation MainContentViewController
@synthesize backImageView,frontImageView,middleImageView,btLeft,btRight;


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
    _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width+30, _scrollView.frame.size.width +30);
    
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = 0.01;
    self.motionManager.gyroUpdateInterval = 0.01;
    
    [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue]
                                             withHandler:^(CMAccelerometerData  *accelerometerData, NSError *error) {
                                                 [self outputAccelertionData:accelerometerData.acceleration];
                                                 if(error){
                                                     
                                                     NSLog(@"%@", error);
                                                 }
                                             }];
    
    

    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.pageController.dataSource = self;
    [[self.pageController view] setFrame:[[self view] bounds]];
    
    INITViewController *initialViewController = [self viewControllerAtIndex:1];
    
    NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
    
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    [self addChildViewController:self.pageController];
    [[self view] addSubview:[self.pageController view]];
    [self.pageController didMoveToParentViewController:self];
    
}

-(void)outputAccelertionData:(CMAcceleration)acceleration
{
    
    float yy = (acceleration.y +0.f)*2.0f;
    
    float accelDirY;
    
    if(yvel * -1.0 > 0){
        accelDirY = 1.0;
    }else{
        accelDirY = -1.0;
    }
    
    float newDirY;
    if(yy>0){
        newDirY = 1.0;
    }else{
        newDirY = -1.0;
    }
    if (accelDirY == newDirY) {
        xoff = acceleration.x;
        yoff = acceleration.y * 20;
    }

    _scrollView.contentOffset = CGPointMake(xoff, yoff);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{

    [self.view bringSubviewToFront:btRight];
        [self.view bringSubviewToFront:btLeft];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(INITViewController *)viewController index];
    
    if (index == 0) {
        return nil;
    }
    
    index--;
    
    return [self viewControllerAtIndex:index];
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(INITViewController *)viewController index];
    
    
    index++;
    
    if (index == 3) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
    
}
- (INITViewController *)viewControllerAtIndex:(NSUInteger)index {
    
    INITViewController *childViewController = [[INITViewController alloc] initWithNibName:@"INITViewController" bundle:nil];
    childViewController.index = index;
    childViewController.delegate = self;
    childViewController.indexImage = (int)index;
    
    if(index == 0){

        childViewController.pathImage = @"pai2.png";
        childViewController.NSlabel1 = [NSString stringWithFormat:@"%d",10+index];
        childViewController.NSlabel2 = [NSString stringWithFormat:@"ONTEM"];
        childViewController.NSlabel3 = [NSString stringWithFormat:@"YESTERDAY"];
        childViewController.NSlabel4 = [NSString stringWithFormat:@"SEG"];
        childViewController.NSlabel5 = [NSString stringWithFormat:@"OUT"];
        childViewController.NSlabel6 = [NSString stringWithFormat:@"DIA DOS PAIS"];
        childViewController.NSlabel7 = [NSString stringWithFormat:@"Father's day"];
        childViewController.NSlabel8 = [NSString stringWithFormat:@"Ser pai é mais"];
        childViewController.NSlabel9 = [NSString stringWithFormat:@"Criado por Willian Douglas B. D"];
        
        UIImage * newImg = [UIImage imageNamed:@"pai2.png"];
        self.frontImageView.image = newImg;

    }else if(index == 1){
    
        childViewController.pathImage = @"mae2.png";
        childViewController.NSlabel1 = [NSString stringWithFormat:@"%d",10+index];
        childViewController.NSlabel2 = [NSString stringWithFormat:@"HOJE"];
        childViewController.NSlabel3 = [NSString stringWithFormat:@"TODAY"];
        childViewController.NSlabel4 = [NSString stringWithFormat:@"TER"];
        childViewController.NSlabel5 = [NSString stringWithFormat:@"OUT"];
        childViewController.NSlabel6 = [NSString stringWithFormat:@"DIA DAS MÃES"];
        childViewController.NSlabel7 = [NSString stringWithFormat:@"Mamy's day"];
        childViewController.NSlabel8 = [NSString stringWithFormat:@"Ser mãe é mais"];
        childViewController.NSlabel9 = [NSString stringWithFormat:@"Criado por Willian Douglas B. D"];
        UIImage * newImg = [UIImage imageNamed:@"mae2.png"];
        self.middleImageView.image = newImg;
    }
    
    else{
        childViewController.pathImage = @"adv.png";
        childViewController.NSlabel1 = [NSString stringWithFormat:@"%d",10+index];
        childViewController.NSlabel2 = [NSString stringWithFormat:@"AMANHÃ"];
        childViewController.NSlabel3 = [NSString stringWithFormat:@"TOMOROW"];
        childViewController.NSlabel4 = [NSString stringWithFormat:@"QUA"];
        childViewController.NSlabel5 = [NSString stringWithFormat:@"OUT"];
        childViewController.NSlabel6 = [NSString stringWithFormat:
                                        @"  DIA DO ADVOGADO          "];
        childViewController.NSlabel7 = [NSString stringWithFormat:@"Mamy's day"];
        childViewController.NSlabel8 = [NSString stringWithFormat:@"Ser mãe é mais"];
        childViewController.NSlabel9 = [NSString stringWithFormat:@"Criado por Willian Douglas B. D"];
        
        UIImage * newImg = [UIImage imageNamed:@"adv.png"];
        self.backImageView.image = newImg;
    }
    
    
    return childViewController;
    
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    // The number of items reflected in the page indicator.
    return 3;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    // The selected item reflected in the page indicator.
    return 1;
}

- (UIStatusBarStyle)preferredStatusBarStyle{return UIStatusBarStyleLightContent;
}

-(void)transitionBackgroundImage:(int)indexImage{
    
    
        [UIView animateWithDuration:0.6
                              delay:0.0
                            options:0
                         animations:^{
                             
                             if(indexImage == 0 ){

                                 self.backImageView.alpha = 0;
                                 self.middleImageView.alpha = 0;
                                 self.frontImageView.alpha = 1;
                                 
                             }
                             if(indexImage == 1){
                                 
                                 self.backImageView.alpha = 0;
                                 self.middleImageView.alpha = 1;
                                 self.frontImageView.alpha = 0;
                             }
                             
                             if(indexImage == 2){

                                 self.backImageView.alpha = 1;
                                 self.middleImageView.alpha = 0;
                                 self.frontImageView.alpha = 0;
                             }
                             
                         }
                         completion:^(BOOL completion){     
                             
                         }];
    
    

}



@end
