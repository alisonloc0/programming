//
//  formPriceViewController.h
//  master2
//
//  Created by user on 01/02/14.
//  Copyright (c) 2014 User. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface formPriceViewController : UIViewController<NSFetchedResultsControllerDelegate,UISplitViewControllerDelegate,UINavigationControllerDelegate,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIPopoverController *masterPopoverController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UIView *containerView;

@property (weak, nonatomic) IBOutlet UIView *backgroundView;
@property (weak, nonatomic) IBOutlet UITableView *presetTable;

@property (weak, nonatomic) IBOutlet UIView *tablePDF;

// Form
@property (weak, nonatomic) IBOutlet UITextField *textTipo;
@property (weak, nonatomic) IBOutlet UITextField *textDe;
@property (weak, nonatomic) IBOutlet UITextField *textAte;
@property (weak, nonatomic) IBOutlet UITextField *textValor;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentCategoria;

@property (weak, nonatomic) IBOutlet UITextField *textNome;



@end
