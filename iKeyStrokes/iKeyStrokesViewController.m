//
//  iKeyStrokesViewController.m
//  iKeyStrokes
//
//  Created by Tommaso Piazza on 7/1/11.
//  Copyright 2011 ChalmersTH. All rights reserved.
//

#import "iKeyStrokesViewController.h"

@implementation iKeyStrokesViewController

@synthesize iPhoneTextField = _iPhoneTextField, iPadTextView = _iPadTextView;
@synthesize connectButton = _connectButton, searchButton = _searchButton;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    if([iKeyStrokesViewController isDeviceAniPad]){
        
        _sharedServerController = [ServerController sharedServerController];
        [_sharedServerController startService];
        
        _sharedServerController.delegate = self;
        
    }
    else{
        
        [_iPhoneTextField becomeFirstResponder];
        _iPhoneTextField.hidden = YES;
        _iPhoneTextField.delegate = self;
        _iPhoneTextField.text = @"A";
    }

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

#pragma mark Device Detection

+(BOOL)isDeviceAniPad {
    
#ifdef UI_USER_INTERFACE_IDIOM()
    return UI_USER_INTERFACE_IDIOM();
#else
    return NO;
#endif
}

#pragma mark iPhone Methods

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string {
    
    if (string.length >0) {
        NSLog(@"%@ Pressed", string);
        
        [self keyPressed:string];
    }
    else if([string isEqualToString:@""]){
        NSLog(@"Backspace pressed");
        
        [self keyPressed:@""];
    }
    
    return NO;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"return pressed");
    return YES;
}

-(IBAction) searchForDevice:(id)sender{
    
    
    _sharedClientController = [ClientController sharedClientController];
    _delegate = _sharedClientController;
    _sharedClientController.delegate = self;
    
    [[ClientController  sharedClientController] search];
    
}

- (IBAction) connectToDevice:(id)sender{
    
    NSMutableArray * services = [[ClientController sharedClientController] services];
    
    if([services count] > 0){
        
        
        [[ClientController sharedClientController] connectToService:[services objectAtIndex:0]];
        
    }
    else{
        
        _connectButton.enabled = NO;
    }
    
}

- (void) didFindService:(NSNetService *)aService{
    
    _connectButton.enabled = YES;
}

- (void) keyPressed:(NSString *) string {
    
    if(_delegate && [_delegate respondsToSelector:@selector(willSendMessageWithString:)]){
        
        [_delegate willSendMessageWithString:string];
        
    }
    
    
}

#pragma mark iPad Methods

-(void) didReceiveMessageWithString:(NSString *)string{

    
    if([string isEqualToString:@""]){
        
        //TODO ADD BACKSPACE AND CARRIAGE RETURN SUPPORT_iPadTextView.text = [NSstring stringwith
    
    }else{
    }
    _iPadTextView.text = [NSString stringWithFormat:@"%@%@", _iPadTextView.text, string];
       
}



@end
