//
//  iKeyStrokesViewController.h
//  iKeyStrokes
//
//  Created by Tommaso Piazza on 7/1/11.
//  Copyright 2011 ChalmersTH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServerController.h"
#import "IKActionPassingProtocolDelegate.h"
#import "ClientControllerProtocolDelegate.h"
#import "ClientController.h"

@interface iKeyStrokesViewController : UIViewController <UITextFieldDelegate, IKActionPassingProtocolDelegate, ClientControllerProtocolDelegate>
{
    UITextField *_iPhoneTextField;
    UITextView *_iPadTextView;
    UIBarButtonItem *_searchButton;
    UIBarButtonItem *_connectButton;
    
    ClientController *_sharedClientController;
    ServerController *_sharedServerController;
    
    id<IKActionPassingProtocolDelegate> _delegate;

}

+(BOOL)isDeviceAniPad;
-(void) keyPressed:(NSString *) string;

@property (nonatomic, retain) IBOutlet UITextField *iPhoneTextField;
@property (nonatomic, retain) IBOutlet UITextView *iPadTextView;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *searchButton;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *connectButton;

@end
