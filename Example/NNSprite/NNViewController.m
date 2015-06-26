//
//  NNViewController.m
//  NNDisplayPackage
//
//  Created by Koichi Yamamoto on 06/26/2015.
//  Copyright (c) 2014 Koichi Yamamoto. All rights reserved.
//

#import "NNViewController.h"
#import <NNSprite/NNSprite.h>

@implementation NNViewController{
	__weak IBOutlet NNSprite* _obj;
}

- (void)viewDidLoad{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


-(IBAction)onAddButtonTap:(id)sender{
	
}
-(IBAction)onRemoveButtonTap:(id)sender{
	[_obj removeFromSuperview];
}
-(IBAction)onStartButtonTap:(id)sender{
	[_obj setOnEnterFrameHandler:^{
		_obj.scaleX += 0.01;
		_obj.scaleY += 0.01;
		_obj.rotation += 1;
	}];
}
-(IBAction)onStopButtonTap:(id)sender{
	[_obj setOnEnterFrameHandler:nil];
}



@end
