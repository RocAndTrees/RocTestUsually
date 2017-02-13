//
//  PXRadialMenuComponet.m
//  RocUsually
//
//  Created by pxl on 2017/2/9.
//  Copyright © 2017年 pxl. All rights reserved.
//

#import "PXRadialMenuComponet.h"
#import "ALRadialMenu.h"
#import <IQUIView+Hierarchy.h>
#define KScreenHeight ([UIScreen mainScreen].bounds.size.height)
#define KScreenWidth ([UIScreen mainScreen].bounds.size.width)

@interface PXRadialMenuComponet()<ALRadialMenuDelegate>

@property (nonatomic , strong) ALRadialMenu *collect;
@property (nonatomic , strong) UIButton *homeAddbtn;

@end

@implementation PXRadialMenuComponet

#pragma mark - ---- lefe cycle 🍏
-(void)layoutDidFinish{
    
}

- (UIView *)loadView
{
    

    

    
    _homeAddbtn = [UIButton  buttonWithType:UIButtonTypeCustom];
    _homeAddbtn.frame = CGRectMake(0,0 , 50, 50);
    [_homeAddbtn setImage:[UIImage imageNamed:@"home_add"] forState:UIControlStateNormal];
    [_homeAddbtn addTarget:self action:@selector(homeAddBtnDown:) forControlEvents:UIControlEventTouchUpInside];
    
    
    return _homeAddbtn;
}

-(void)viewWillLoad{
    NSLog(@"viewWillLoad");
}

-(void)viewDidLoad{
    [super viewDidLoad];
    _collect = [[ALRadialMenu alloc] init];
    _collect.backgroundColor = [UIColor clearColor];
    _collect.delegate = self;

    [self.view.viewController.view addSubview:_collect];
    
    NSLog(@"viewDidLoad");
}

-(void)viewWillUnload{
    NSLog(@"viewWillUnload");
}

-(void)updateStyles:(NSDictionary *)styles{
    NSLog(@"updateStyles %@ ", styles);
}

-(void)updateAttributes:(NSDictionary *)attributes{
    NSLog(@"updateAttributes %@", attributes);
    
}

-(void)addEvent:(NSString *)eventName{
    NSLog(@"addEvent %@", eventName);
}

-(void)removeEvent:(NSString *)eventName{
    NSLog(@"removeEvent %@", eventName);

}
#pragma mark - ---- event response 🍐

#pragma mark - ---- private methods 🍊
-(instancetype)initWithRef:(NSString *)ref type:(NSString *)type styles:(NSDictionary *)styles attributes:(NSDictionary *)attributes events:(NSArray *)events weexInstance:(WXSDKInstance *)weexInstance{
    
    if (self = [super initWithRef:ref type:type styles:styles attributes:attributes events:events weexInstance:weexInstance]) {
        
        NSLog(@"ref %@----toopokikmype %@ --- styles %@ -- attributes %@ -- events %@ --- weexInstance %@", ref, type, styles, attributes, events, weexInstance);
    }

    
    return self;
}







#pragma mark-----加号按钮
-(void)createAddBtns
{
    _collect = [[ALRadialMenu alloc] init];
    _collect.backgroundColor = [UIColor clearColor];
    _collect.delegate = self;
//    [self.view addSubview:_collect];
    
    _homeAddbtn = [UIButton  buttonWithType:UIButtonTypeCustom];
    _homeAddbtn.frame = CGRectMake(KScreenWidth-60,20 , 50, 50);
    [_homeAddbtn setImage:[UIImage imageNamed:@"home_add"] forState:UIControlStateNormal];
    [_homeAddbtn addTarget:self action:@selector(homeAddBtnDown:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:_homeAddbtn];
}

#pragma mark  ===弹出扫码 充值 ===
-(void)homeAddBtnDown:(UIButton*)send
{

    [_collect buttonsWillAnimateFromButton:send withFrame:_homeAddbtn.frame inView:self.view.viewController.view];
    
}


#pragma mark - _collect代理
- (NSInteger) numberOfItemsInRadialMenu:(ALRadialMenu *)radialMenu {
    return 4;
}


- (NSInteger) arcSizeForRadialMenu:(ALRadialMenu *)radialMenu {
    return  360;
}

- (NSInteger) arcRadiusForRadialMenu:(ALRadialMenu *)radialMenu {
    return 45;
}

- (ALRadialButton *) radialMenu:(ALRadialMenu *)radialMenu buttonForIndex:(NSInteger)index {
    
    ALRadialButton *button = [[ALRadialButton alloc] initWithFrame:CGRectMake(0, 0,275, 275)];
    if (index == 3) {
        [button setImage:[UIImage imageNamed:@"home_scan"] forState:UIControlStateNormal];
    } else if(index == 2){
        [button setImage:[UIImage imageNamed:@"home_congzhi"] forState:UIControlStateNormal];
        
    }else{
        return button;
    }
    
    return button;
}

- (void) radialMenu:(ALRadialMenu *)radialMenu didSelectItemAtIndex:(NSInteger)index {
    
    [_collect itemsWillDisapearIntoButton:_homeAddbtn];
    if (index==3) { //扫码
//        isAlert = NO;
//        [self scanTowCode];
        
    }else if(index==2) // 充值
    {
    
  //      [self  chongzhiAction];
    }
}

#pragma mark - ---- delegate 🍎

#pragma mark - ---- getters and setters 🍋





@end
