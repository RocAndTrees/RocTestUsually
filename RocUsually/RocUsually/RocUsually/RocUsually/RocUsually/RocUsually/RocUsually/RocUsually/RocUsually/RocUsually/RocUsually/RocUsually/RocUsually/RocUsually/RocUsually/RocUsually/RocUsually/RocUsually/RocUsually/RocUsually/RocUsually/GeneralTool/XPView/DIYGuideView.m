//
//  DIYGuideView.m
//  yunbo2016
//
//  Created by Hanks on 16/1/4.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "DIYGuideView.h"
#import <Masonry.h>

@implementation DIYGuideView

-(instancetype)initShowGuidWithImage:(NSString *)imageName andContentMode:(UIViewContentMode)contentMode inView:(UIView *)showView

{
    if (self = [super init]) {
        
        [showView addSubview:self];
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8];
        _guidImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
        _guidImageView.contentMode = contentMode;
        [self addSubview:_guidImageView];
        _guidImageView.userInteractionEnabled =YES;
        UITapGestureRecognizer  *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismisCover:)];
        [_guidImageView addGestureRecognizer:tap];
    }
    
    return self;
}

-(void)dismisCover:(UITapGestureRecognizer*)tap
{
    if (tap.view.superview) {
        [tap.view removeFromSuperview];
        [self removeFromSuperview];
    }
    
}


@end
