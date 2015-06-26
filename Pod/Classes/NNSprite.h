//
//  NNDisplayObject.h
//  Pods
//
//  Created by noughts on 2015/06/26.
//
//

#import <UIKit/UIKit.h>

@interface NNSprite : UIView

/// オブジェクトのスケール（パーセンテージ）を示します。 1.0 は縮尺 100% と同等です。
@property CGFloat scaleX;
@property CGFloat scaleY;

/// DisplayObject インスタンスの元の位置からの回転角を度単位で示します。時計回りに回転させる場合は 0 ～ 180 の値を指定します。反時計回りに回転させる場合は 0 ～ -180 の値を指定します。この範囲を超える値は、360 を加算または減算して、範囲内に収まる値になるように調整されます。
@property CGFloat rotation;



/// onEnterFrameハンドラセット
-(void)setOnEnterFrameHandler:(void (^)(NNSprite* sprite))handler;



@end
