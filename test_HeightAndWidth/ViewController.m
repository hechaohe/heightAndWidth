//
//  ViewController.m
//  test_HeightAndWidth
//
//  Created by hc on 2017/2/17.
//  Copyright © 2017年 hc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UILabel *testLabel;

@property (nonatomic,strong) UILabel *textLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.testLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 100)];
    self.testLabel.text = @"朝辞白帝彩云间,\n朝辞白帝彩云间，千里江陵一日还。\n两岸猿声啼不住";
    self.testLabel.numberOfLines = 0;
    [self.view addSubview:_testLabel];
    
    [self getLabelSizeOfWidth:self.testLabel.text];
    
    
    
    self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, 200, 500)];
    self.textLabel.backgroundColor = [UIColor lightGrayColor];
    self.textLabel.text = @"朝辞白帝彩云间，千里江陵一日还。两岸猿声啼不住,轻舟已过万重山";
    self.textLabel.numberOfLines = 0;
    [self.view addSubview:_textLabel];
    
    [self getLabelSizeOfHeight:_textLabel.text];
}


- (CGSize)getLabelSizeOfWidth:(NSString *)title {
    if (!title || title.length == 0) {
        return CGSizeZero;
    }
    
    CGSize labelSize = [self getTextSizeOfWidth:title];
    
    NSLog(@"width %lf",labelSize.width);
    
    return CGSizeMake(labelSize.width, 20);
    
}
/**
 get width

 @param title string
 @return size
 */
- (CGSize)getTextSizeOfWidth:(NSString *)title {
    
    return [title boundingRectWithSize:CGSizeMake(MAXFLOAT, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;

}



- (CGSize)getLabelSizeOfHeight:(NSString *)title {
    if (!title || title.length == 0) {
        return CGSizeZero;
    }
    
    CGSize labelSize = [self getTextSizeOfHeight:title];
    
    NSLog(@"height %lf",labelSize.height);
    return CGSizeMake(200, labelSize.height);
}


/**
 get height

 @param title string
 @return size
 */
- (CGSize)getTextSizeOfHeight:(NSString *)title {
    return [title boundingRectWithSize:CGSizeMake(200, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
}

@end
