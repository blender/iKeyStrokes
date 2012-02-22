//
//  TBMessage.m
//  tommyBros
//
//  Created by Tommaso Piazza on 5/19/11.
//  Copyright 2011 ChalmersTH. All rights reserved.
//

#import "IKMessage.h"


@implementation IKMessage

@synthesize string = _string;

+ (IKMessage *) messageWithString:(NSString *)string
{
    return [[[self alloc] initWithString:string] autorelease];

}

- (id) initWithString:(NSString *)string
{
    
    if((self = [super init]))
    {
    
        self.string = string;
    
    }
    
    return self;
}

#pragma mark NSCoding Protocol

- (id) initWithCoder:(NSCoder *)aDecoder {

    if((self = [super init])){
    
        
        self.string = [aDecoder decodeObjectForKey:@"_string"];
    }

    return self;
}

- (void) encodeWithCoder:(NSCoder*)encoder {
    
    [encoder encodeObject:_string forKey:@"_string"];
    
}

@end
