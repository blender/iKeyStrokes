//
//  main.m
//  iKeyStrokes
//
//  Created by Tommaso Piazza on 7/1/11.
//  Copyright 2011 ChalmersTH. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "iKeyStrokesAppDelegate.h"

int main(int argc, char *argv[])
{
    int retVal = 0;
    @autoreleasepool {
        retVal = UIApplicationMain(argc, argv, nil, NSStringFromClass([iKeyStrokesAppDelegate class]));
    }
    return retVal;
}
