//
//  NNDisplayObject.m
//  Pods
//
//  Created by noughts on 2015/06/26.
//
//

#import "NNSprite.h"
#import "CADisplayLink+NNSprite.h"

@implementation NNSprite{
	void (^_onEnterFrameHandler)(NNSprite*);
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
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(render:) name:@"onEnterFrame" object:[CADisplayLink sharedLink]];
}




-(void)dealloc{
	[[NSNotificationCenter defaultCenter] removeObserver:self name:@"onEnterFrame" object:[CADisplayLink sharedLink]];
}


/// onEnterFrameハンドラセット
-(void)setOnEnterFrameHandler:(void (^)(NNSprite* sprite))handler{
	_onEnterFrameHandler = handler;
}









-(void)render:(NSNotification*)note{
	CGAffineTransform t = CGAffineTransformMakeScale(_scaleX, _scaleY);
	t = CGAffineTransformRotate(t, _rotation * M_PI / 180.0);
	self.transform = t;
	if( _onEnterFrameHandler ){
		_onEnterFrameHandler( self );
	}
}


@end
