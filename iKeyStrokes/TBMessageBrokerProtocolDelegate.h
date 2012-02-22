//
//  TBMessageBrokerProtocolDelegate.h
//  tommyBros
//
//  Created by Tommaso Piazza on 5/19/11.
//  Copyright 2011 ChalmersTH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBMessageBroker.h"
#import "IKMessage.h"

@class TBMessageBroker;

@protocol TBMessageBrokerProtocolDelegate <NSObject>
@optional

-(void)messageBroker:(TBMessageBroker *)server didSendMessage:(IKMessage *)message;
-(void)messageBroker:(TBMessageBroker *)server didReceiveMessage:(IKMessage *)message;
-(void)messageBrokerDidDisconnectUnexpectedly:(TBMessageBroker *)server;

@end
