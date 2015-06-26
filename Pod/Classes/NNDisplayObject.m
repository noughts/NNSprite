//
//  NNDisplayObject.m
//  Pods
//
//  Created by noughts on 2015/06/26.
//
//

#import "NNDisplayObject.h"
#import "CADisplayLink+DisplayObject.h"

@implementation NNDisplayObject{
	void (^_onEnterFrameHandler)();
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
	if( self = [super initWithCoder:aDecoder] ){
		[self initialize];
	}
	return self;
}


-(void)initialize{
	_scaleX = 1;
	_scaleY = 1;
}


-(void)drawRect:(CGRect)rect{
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(render:) name:@"onEnterFrame" object:[CADisplayLink sharedLink]];
}


-(void)dealloc{
	[[NSNotificationCenter defaultCenter] removeObserver:self name:@"onEnterFrame" object:[CADisplayLink sharedLink]];
}


/// onEnterFrameハンドラセット
-(void)setOnEnterFrameHandler:(void (^)())handler{
	_onEnterFrameHandler = handler;
}









-(void)render:(NSNotification*)note{
	NSLog( @"render" );
	CGAffineTransform t = CGAffineTransformMakeScale(_scaleX, _scaleY);
	t = CGAffineTransformRotate(t, _rotation * M_PI / 180.0);
	self.transform = t;
	if( _onEnterFrameHandler ){
		_onEnterFrameHandler();
	}
}


@end
