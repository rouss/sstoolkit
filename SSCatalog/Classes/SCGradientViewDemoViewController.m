//
//  SCGradientViewDemoViewController.m
//  SSCatalog
//
//  Created by Sam Soffes on 10/27/09.
//  Copyright 2009 Sam Soffes, Inc. All rights reserved.
//

#import "SCGradientViewDemoViewController.h"
#import <SSToolkit/SSGradientView.h>

@implementation SCGradientViewDemoViewController

#pragma mark Class Methods

+ (NSString *)title {
	return @"Gradient View";
}


#pragma mark NSObject

- (void)dealloc {
	[_gradientView release];
	[super dealloc];
}


#pragma mark UIViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.title = [[self class] title];
	self.view.backgroundColor = [UIColor whiteColor];
	
	// Gradient view
	_gradientView = [[SSGradientView alloc] initWithFrame:CGRectMake(20.0f, 20.0f, 280.0f, 280.0f)];
	[self.view addSubview:_gradientView];
	
	// Change color button
	UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	button.frame = CGRectMake(20.0f, 320.0f, 280.0f, 37.0f);
	[button setTitle:@"Change Color" forState:UIControlStateNormal];
	[button addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:button];
	
	// Scale slider
	UISlider *scaleSlider = [[UISlider alloc] initWithFrame:CGRectMake(20.0f, 377.0f, 280.0f, 20.0f)];
	scaleSlider.value = 1.0f;
	scaleSlider.minimumValue = 0.0f;
	scaleSlider.maximumValue = 1.0f;
	[scaleSlider addTarget:self action:@selector(updateScale:) forControlEvents:UIControlEventValueChanged];
	[self.view addSubview:scaleSlider];
	[scaleSlider release];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
		return toInterfaceOrientation != UIInterfaceOrientationPortraitUpsideDown;
	}
	return YES;
}


#pragma mark Actions

- (void)changeColor:(id)sender {
	if ([_gradientView.topColor isEqual:[SSGradientView defaultTopColor]]) {
		_gradientView.topColor = [UIColor whiteColor];
		_gradientView.bottomColor = [UIColor grayColor];
	} else {
		_gradientView.topColor = [SSGradientView defaultTopColor];
		_gradientView.bottomColor = [SSGradientView defaultBottomColor];
	}	
}


- (void)updateScale:(id)sender {
	_gradientView.gradientScale = [(UISlider *)sender value];
}

@end
