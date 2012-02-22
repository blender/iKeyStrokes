//
//  TBActionPassingDelegate.h
//  iJPad
//
//  Created by Tommaso Piazza on 5/19/11.
//  Copyright 2011 ChalmersTH. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IKActionPassingProtocolDelegate <NSObject>
@optional

-(void) willSendMessageWithString:(NSString *) string;
-(void) didReceiveMessageWithString:(NSString *) string;

@end
