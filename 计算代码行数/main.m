//
//  main.m
//  计算代码行数
//
//  Created by student on 14-10-11.
//  Copyright (c) 2014年 student. All rights reserved.
//

#import <Foundation/Foundation.h>
void test1();
NSUInteger test2(NSString *);
NSUInteger codeLineCount(NSString *path,NSString *rootPath);

// 计算一个文件中的代码的行数，给定一个路径，这个路径又可能是文件，也有可能是文件夹，要求是都要返回代码行数
int main()
{
    // 在这里写下需要统计的代码的目录
    NSString *path = @"/Users/morris/Desktop/百度云同步盘/iOS/学习笔记/Swift";
    NSLog(@"在这个文件中代码行数是：%ld",codeLineCount(path,path));
    return 0;
}
// 这就是实现功能的方法，行参是一个路径
NSUInteger codeLineCount(NSString *path,NSString *rootPath)
{
    NSUInteger num = 0;
    // 判断是否是文件夹，如果说file是文件夹的时候就是YES不是文件夹的话就是NO
    BOOL flag = NO;
    // 首先判断这个文件存不存在，存在的话是文件还是文件夹
    // 关于文件目录的操作，取得文件管理器的单例对象
    NSFileManager *file = [NSFileManager defaultManager];
    BOOL isExit = [file fileExistsAtPath:path isDirectory:&flag];
    if(!isExit){
        NSLog(@"路经有误！！！");
        return 0;
    }else{
        // 如果说他是文件夹的话，就得到他的里面去把文件找出来
        if(flag){
           
            // 获取这个文件夹中的所有的文件名字
            NSArray *a = [file contentsOfDirectoryAtPath:path error:nil];
            for(id fileName in a){
                
                //  获得所有文件的完全路径
                NSString *s1 = [NSString stringWithFormat:@"%@/%@",path,fileName];
                num  = num + codeLineCount(s1,rootPath);
            }
        }else{
            // 如果说是文件并且扩展名是.h 或者是.m的话就直接进行统计
            NSString *h = @"h";
            NSString *m = @"m";
            NSString *c = @"c";
            NSString *mm = @"mm";
            NSString *swift = @"swift";
            //查看扩展名是否是上面这三个但是，扩展名又可能是大写，所以这个时候就要先把扩展名转为小写再比较
            NSString *pathE = [[path pathExtension] lowercaseString];
            NSRange rect = [path rangeOfString:rootPath];
            NSString *newPath = [path stringByReplacingCharactersInRange:rect withString:@""];
            if([pathE isEqualToString:h] || [pathE isEqualToString:m] || [pathE isEqualToString:c] || [pathE isEqualToString:mm]|| [pathE isEqualToString:swift]){
                num = test2(path);
                NSLog(@"%@  ---  %ld行",newPath,num);
                
            }else{
                
                return 0;
            }
        }
    }
    return num;
}
NSUInteger test2(NSString *path)
{
    // 可以首先获取文件中的内容，然后利用字符串分割计数将空格字符串以回车分割，这个时候会生成一个数组，这个时候我就可以通过计算数组中的元素来计算文档中的行数了
    NSString *s1 = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    // 利用字符串分割函数，将字符串分割生成一个数组
    NSArray *a = [s1 componentsSeparatedByString:@"\n"];
   
    return a.count;
}

