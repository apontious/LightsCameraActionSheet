//
//  ViewController.m
//  LightsCameraActionSheet
//
//  Created by Andrew Pontious on 11/10/15.
//  Copyright © 2015 Andrew Pontious. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) UIAlertController *alertController;

@end

@implementation ViewController

- (IBAction)showSheet:(id)sender {
	self.alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];

	__weak typeof(self) weakSelf = self;
	
	[self.alertController addAction: [UIAlertAction actionWithTitle:@"This Is the Sheet"
																	 style: UIAlertActionStyleDefault
																   handler:^(UIAlertAction *action) {
																	   
																	   // TODO
																	   [weakSelf.alertController dismissViewControllerAnimated:NO completion:^{
																	   }];
																   }]];
	[self.alertController addAction: [UIAlertAction actionWithTitle:@"Cancel"
															  style: UIAlertActionStyleCancel
															handler:^(UIAlertAction *action) {
																
																// TODO
																[weakSelf.alertController dismissViewControllerAnimated:NO completion:^{
																}];
															}]];
	self.alertController.popoverPresentationController.sourceView = sender;
	// Without this, it tries to use UIPopoverArrowDirectionLeft from left border of view, which looks really bad.
	self.alertController.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionDown;
	
	[self presentViewController:self.alertController animated:YES completion:nil];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
	[super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
	
	[self.alertController dismissViewControllerAnimated:YES completion:nil];
}

@end
