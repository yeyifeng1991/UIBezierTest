//
//  ViewController.m
//  Quartz2DUITest
//
//  Created by 叶子 on 2018/1/18.
//  Copyright © 2018年 叶义峰. All rights reserved.
//

#import "ViewController.h"
#import "cyView.h"

@interface ViewController ()
@property (nonatomic,strong) cyView * imageView;
@property (nonatomic,strong) UIImageView * myImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.imageView = [[cyView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
//    self.imageView.backgroundColor = [UIColor cyanColor];
//    [self.view addSubview:self.imageView];
    self.myImage = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 150, 150)];
    self.myImage.image = [UIImage imageNamed:@"1"];
    [self.view addSubview:self.myImage];
 
}

#pragma mark - 保存图片
- (IBAction)saveImage:(id)sender {
    
 //    开启图片context
    UIGraphicsBeginImageContextWithOptions(self.myImage.bounds.size, NO, 0);
    // 获取图片的范围
    [self.myImage drawViewHierarchyInRect:self.myImage.bounds afterScreenUpdates:YES];
// 从上下文context中获取图片
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    //结束context,记得关闭
    UIGraphicsEndImageContext();
    // 写入相册
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
    /*
     This app has crashed because it attempted to access privacy-sensitive data without a usage description.  The app's Info.plist must contain an NSPhotoLibraryAddUsageDescription key with a string value explaining to the user how the app uses this data.
     ios 8.0之后，添加权限提示

     */
}
//系统指定的保存后结束要执行的方法
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    NSLog(@"保存成功");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
