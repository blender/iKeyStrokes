//
//  TBMessage.h
//  tommyBros
//
//  Created by Tommaso Piazza on 5/19/11.
//  Copyright 2011 ChalmersTH. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface IKMessage : NSObject <NSCoding> {
    
    NSString *_string;
    
}

@property (nonatomic, copy) NSString *string;

+ (IKMessage *) messageWithString:(NSString *) string;
- (id) initWithString:(NSString *) string;

@end
