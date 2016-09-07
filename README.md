# StatisticsAmountOfCode
统计你写的代码行数

计算代码行数使用手册

使用方式 

// 在这里写下需要统计的代码的目录
NSString *path = @"/Users/morris/Desktop/百度云同步盘/iOS/学习笔记/Swift";


demo中现在只是支持统计这几种后缀名的文件
NSString *h = @"h";
NSString *m = @"m";
NSString *c = @"c";
NSString *mm = @"mm";
NSString *swift = @"swift";

有需要可以自行添加
if([pathE isEqualToString:h] || [pathE isEqualToString:m] || [pathE isEqualToString:c] || [pathE isEqualToString:mm]|| [pathE isEqualToString:swift])

  
