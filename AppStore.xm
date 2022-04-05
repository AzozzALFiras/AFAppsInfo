// By Azozz ALFiras
// github : https://github.com/AzozzALFiras/AFAppsInfo
// Thx @CrazyMind90
// https://itunes.apple.com/lookup?id=389801252
// https://itunes.apple.com/lookup?id=488106216

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>




#pragma GCC diagnostic ignored "-Wunused-variable"
#pragma GCC diagnostic ignored "-Wprotocol"
#pragma GCC diagnostic ignored "-Wmacro-redefined"
#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
#pragma GCC diagnostic ignored "-Wincomplete-implementation"
#pragma GCC diagnostic ignored "-Wunknown-pragmas"
#pragma GCC diagnostic ignored "-Wformat"
#pragma GCC diagnostic ignored "-Wunknown-warning-option"
#pragma GCC diagnostic ignored "-Wincompatible-pointer-types"


static NSString *BundleID;
static NSString *trackName;
static NSString *description;
static NSString *TrackIDJson;
static NSString *artworkUrl60;
static NSString *artworkUrl100;
static NSString *artworkUrl512;
static NSString *artistViewUrl;
static BOOL DidFindBundleID = NO;



@interface UIView (AFAppsInfo)
-(UIViewController *) NearestViewController;
-(NSMutableArray *) allSubViews;
@end

@implementation UIView (AFAppsInfo)
- (UIViewController *) NearestViewController {
UIResponder *responder = self;
while ([responder isKindOfClass:[UIView class]])
responder = [responder nextResponder];
return (UIViewController *)responder;
}

- (NSMutableArray *) allSubViews {

NSMutableArray *arr= [[NSMutableArray alloc] init];
[arr addObject:self];
for (UIView *subview in self.subviews)
{
[arr addObjectsFromArray:(NSArray*)[subview allSubViews]];
}
return arr;
}

@end

@interface UIColor ()
+ (id)labelColor;
@end

static UIViewController *_topMostController(UIViewController *cont) {
UIViewController *topController = cont;
while (topController.presentedViewController) {
topController = topController.presentedViewController;
}
if ([topController isKindOfClass:[UINavigationController class]]) {
UIViewController *visible = ((UINavigationController *)topController).visibleViewController;
if (visible) {
topController = visible;
}
}
return (topController != cont ? topController : nil);
}
static UIViewController *topMostController() {
UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
UIViewController *next = nil;
while ((next = _topMostController(topController)) != nil) {
topController = next;
}
return topController;
}



void Alert(NSString *message){

dispatch_async(dispatch_get_main_queue(), ^{

UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Info Data" message:message preferredStyle:UIAlertControllerStyleAlert];
@try {
[alert.view setTintColor:[UIColor labelColor]];
}@catch(NSException*e){
}
UIAlertAction *Dismiss = [UIAlertAction actionWithTitle:@"Ok, Thanks" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
}];
[alert addAction:Dismiss];

[topMostController() presentViewController:alert animated:true completion:nil];

});
}

/// Sorry, the download library is private and I cannot open its source. You need to build a code to download images via the link

void Download(NSString *LinkSave){

NSURL * directURL = [NSURL URLWithString:LinkSave];
NSString* title = [[directURL lastPathComponent] stringByDeletingPathExtension];
NSString * pathFileVideo = [NSTemporaryDirectory() stringByAppendingPathComponent:[directURL lastPathComponent]];

dispatch_async(dispatch_get_main_queue(), ^{




// You need the azfLibrary library because the App Store does not have the validity of the images
// // https://github.com/AzozzALFiras/azfLibrary
BOOL isFileVideo = NO;

NSURL *url = [NSURL URLWithString:[@"http://127.0.0.1:1357/" stringByAppendingPathComponent:@"cameraImport"]];
NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:60.0];
[request setHTTPMethod:@"POST"];
[request setHTTPBody:[NSJSONSerialization dataWithJSONObject:@{@"path": pathFileVideo?:@"", @"video": @(isFileVideo),} options:0 error:nil]];
NSData *receivedData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil]?:[NSData data];
NSDictionary *jsonResp = [NSJSONSerialization JSONObjectWithData:receivedData options:0 error:nil]?:@{};

if([jsonResp[@"status"]?:@NO boolValue]) {
Alert(@"Saved!");
} else {
Alert(@"Save Failed!");
}



});


}


void SaveImageQuality(NSString *Q60x60,NSString *Q100x100,NSString *Q512x512){

dispatch_async(dispatch_get_main_queue(), ^{

UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Info Data" message:@"Choose Your Quality" preferredStyle:UIAlertControllerStyleActionSheet];
@try {
[alert.view setTintColor:[UIColor labelColor]];
}@catch(NSException*e){
}
UIAlertAction *Quality60 = [UIAlertAction actionWithTitle:@"60x60" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
Download(Q60x60);
}];
UIAlertAction *Quality100 = [UIAlertAction actionWithTitle:@"100x100" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
Download(Q100x100);
}];
UIAlertAction *Quality512 = [UIAlertAction actionWithTitle:@"512x512" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
Download(Q512x512);
}];
UIAlertAction *Dismiss = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];


[alert addAction:Quality60];
[alert addAction:Quality100];
[alert addAction:Quality512];
[alert addAction:Dismiss];

[topMostController() presentViewController:alert animated:true completion:nil];


});

}
void ShowAlert(NSString *BundleID_azf,NSString *trackName_azf,NSString *description_azf,NSString *TrackIDJson_azf,NSString *artworkUrl60_azf,NSString *artworkUrl100_azf,NSString *artworkUrl512_azf,NSString *artistViewUrl_azf) {

dispatch_async(dispatch_get_main_queue(), ^{


UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Info Data" message:@"Choose Your Option" preferredStyle:UIAlertControllerStyleActionSheet];
@try {
[alert.view setTintColor:[UIColor labelColor]];
}@catch(NSException*e){
}
UIAlertAction *CopyBundleid = [UIAlertAction actionWithTitle:@"Copy Bundleid" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {

UIPasteboard *Pasteboard = [UIPasteboard generalPasteboard];
Pasteboard.string = BundleID_azf;
Alert(@"Copied!");


}];

UIAlertAction *CopyName = [UIAlertAction actionWithTitle:@"Copy Name" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {

UIPasteboard *Pasteboard = [UIPasteboard generalPasteboard];
Pasteboard.string = trackName_azf;
Alert(@"Copied!");

}];

UIAlertAction *CopyDescription = [UIAlertAction actionWithTitle:@"Copy Description" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {

UIPasteboard *Pasteboard = [UIPasteboard generalPasteboard];
Pasteboard.string = description_azf;
Alert(@"Copied!");

}];

UIAlertAction *CopyLink = [UIAlertAction actionWithTitle:@"Copy Link" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {

UIPasteboard *Pasteboard = [UIPasteboard generalPasteboard];
Pasteboard.string = artistViewUrl_azf;
Alert(@"Copied!");

}];

UIAlertAction *Save = [UIAlertAction actionWithTitle:@"Save App Image" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {


SaveImageQuality(artworkUrl60_azf,artworkUrl100_azf,artworkUrl512_azf);

}];

UIAlertAction *Dismiss = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];


[alert addAction:CopyBundleid];
[alert addAction:CopyName];
[alert addAction:CopyDescription];
[alert addAction:CopyLink];
[alert addAction:Save];
[alert addAction:Dismiss];

[topMostController() presentViewController:alert animated:true completion:nil];


});


}


NSString *ExportTrackId(NSString *From,NSString *To,id String) {

NSString *str = [NSString stringWithFormat:@"%@",String];
NSString *stringlast = nil;

NSScanner *scanner = [NSScanner scannerWithString:str];
[scanner scanUpToString:[NSString stringWithFormat:@"%@",From] intoString:nil];

while (![scanner isAtEnd]) {

[scanner scanString:[NSString stringWithFormat:@"%@",From] intoString:nil];
[scanner scanUpToString:[NSString stringWithFormat:@"%@",To] intoString:&stringlast];
[scanner scanUpToString:[NSString stringWithFormat:@"%@",From] intoString:nil];

}
return stringlast;
}


UIButton *InitButtonWithName(NSString *BuName,UIView *InView,id Target, SEL Action) {

UIButton *Button = [UIButton buttonWithType:UIButtonTypeCustom];

[Button setTitle:BuName forState:UIControlStateNormal];

[Button addTarget:Target action:Action forControlEvents:UIControlEventTouchUpInside];

[InView addSubview:Button];


return Button;
}



NSString *ExportCountryCode(NSLocale *Locale) {

NSString *CountryCode = [[Locale objectForKey:NSLocaleCountryCode] lowercaseString];
if([CountryCode isEqualToString:@"iq"]){
return @"us";
} else {
return CountryCode;
}
return CountryCode;

}

%hook AMSURLRequest
-(id) initWithRequest:(id)Request {
%orig;
if (DidFindBundleID)
return %orig;

NSLocale *CurrentLocale = [NSLocale currentLocale];
__block NSString *CountryId = ExportCountryCode(CurrentLocale);


NSString *RequestString = [NSString stringWithFormat:@"%@",Request];

NSString *LinkwithContry = [NSString stringWithFormat:@"https://amp-api.apps.apple.com/v1/catalog/%@/apps/", CountryId];


if ([RequestString containsString:@"https://amp-api.apps.apple.com/v1/catalog/us/apps/"]) {

__block NSString *TrackID = ExportTrackId(@"apps/",@"?",RequestString);
dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

NSURL *urlX = [NSURL URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/lookup?id=%@",TrackID]];
NSData *dataX = [NSData dataWithContentsOfURL:urlX];

if (dataX) {

NSDictionary *lookupX = [NSJSONSerialization JSONObjectWithData:dataX options:0 error:nil];
BundleID      = lookupX[@"results"][0][@"bundleId"];
trackName     = lookupX[@"results"][0][@"trackName"];
description   = lookupX[@"results"][0][@"description"];
TrackIDJson   = lookupX[@"results"][0][@"TrackIDJson"];
artworkUrl60  = lookupX[@"results"][0][@"artworkUrl60"];
artworkUrl100 = lookupX[@"results"][0][@"artworkUrl100"];
artworkUrl512 = lookupX[@"results"][0][@"artworkUrl512"];
artistViewUrl = lookupX[@"results"][0][@"artistViewUrl"];

if (BundleID)
DidFindBundleID = YES;
}
});

} else if ([RequestString containsString:LinkwithContry]) {

__block NSString *TrackID = ExportTrackId(@"apps/",@"?",RequestString);
dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

NSURL *urlX = [NSURL URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/lookup?id=%@",TrackID]];
NSData *dataX = [NSData dataWithContentsOfURL:urlX];

if (dataX) {

NSDictionary *lookupX = [NSJSONSerialization JSONObjectWithData:dataX options:0 error:nil];
BundleID = lookupX[@"results"][0][@"bundleId"];
trackName     = lookupX[@"results"][0][@"trackName"];
description   = lookupX[@"results"][0][@"description"];
TrackIDJson   = lookupX[@"results"][0][@"TrackIDJson"];
artworkUrl60  = lookupX[@"results"][0][@"artworkUrl60"];
artworkUrl100 = lookupX[@"results"][0][@"artworkUrl100"];
artworkUrl512 = lookupX[@"results"][0][@"artworkUrl512"];
artistViewUrl = lookupX[@"results"][0][@"artistViewUrl"];

if (BundleID)
DidFindBundleID = YES;
}
});

}
return %orig;
}
%end


@interface _TtC8AppStore21ProductViewController : UIViewController
-(void) AFAppsInfoButtonTapped;
-(void) azflibrary;
@end

@interface _TtC8AppStore16ProductTitleView : UIView

@end


%hook _TtC8AppStore21ProductViewController
-(void) viewDidLoad {
%orig;

DidFindBundleID = NO;

dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

[NSThread sleepForTimeInterval:0.30];

dispatch_async(dispatch_get_main_queue(), ^{

_TtC8AppStore16ProductTitleView *ProductTitleView;
for (UIView *view in [topMostController().view allSubViews]) {

if ([view isKindOfClass:[%c(_TtC8AppStore16ProductTitleView) class]]) {

ProductTitleView = (_TtC8AppStore16ProductTitleView *)view;

}
}


UIButton *AFAppsInfoButton = InitButtonWithName(@"AFAppsInfo",ProductTitleView,self,@selector(AFAppsInfoButtonTapped));

AFAppsInfoButton.layer.backgroundColor = UIColor.redColor.CGColor;
AFAppsInfoButton.layer.cornerRadius = 10;
[AFAppsInfoButton.titleLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:14.0f]];
[AFAppsInfoButton setTranslatesAutoresizingMaskIntoConstraints:NO];
[NSLayoutConstraint activateConstraints:@[
[AFAppsInfoButton.topAnchor constraintEqualToAnchor:ProductTitleView.topAnchor constant:8],
[AFAppsInfoButton.leadingAnchor constraintEqualToAnchor:ProductTitleView.centerXAnchor constant:-43],
[AFAppsInfoButton.trailingAnchor constraintEqualToAnchor:ProductTitleView.centerXAnchor constant:43],
[AFAppsInfoButton.bottomAnchor constraintEqualToAnchor:ProductTitleView.bottomAnchor constant:-7.2],
]];


});

});

return %orig;
}

%new
-(void)AFAppsInfoButtonTapped{
@try {
ShowAlert(BundleID,trackName,description,TrackIDJson,artworkUrl60,artworkUrl100,artworkUrl512,artistViewUrl);
} @catch(NSException* e) {
}
}
%end
