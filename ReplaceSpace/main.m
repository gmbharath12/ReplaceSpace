//
//  main.m
//  ReplaceSpace
//
//  Created by Bharath G M on 12/23/14.
//  Copyright (c) 2014 Bharath G M. All rights reserved.
//

#import <Foundation/Foundation.h>

int countNumberOfSpcaes(NSString *string)
{
    int count = 0;
    NSString *emptyString = @" ";
    unichar space = [emptyString characterAtIndex:0];
    for (int i = 0; i < [string length]; i++)
    {
        unichar character = [string characterAtIndex:i];
        if (character == space)
        {
            count++;
        }
    }
    return count;
}


void replaceSpaceWithPercentSymbolTwenty(NSUInteger stringLength, int capacity, unichar* charPtr)
{
    int index = capacity-1;
    for (int i = (int)stringLength - 1; i >= 0 ; i--)
    {
        if (charPtr[i] != ' ')
        {
            charPtr[index] = charPtr[i];
            index--;
        }
        else
        {
            charPtr[index] = '0';
            charPtr[index-1] = '2';
            charPtr[index-2] = '%';
            index -= 3;
        }
    }
}

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        NSString *string = @"abcd e";
        NSUInteger stringLength = [string length];
        int numberOfSpaces = countNumberOfSpcaes(string);
        int capacity = (int)(stringLength + (numberOfSpaces *2));
        unichar characters[capacity];
        unichar *charPtr = characters;
        [string getCharacters:charPtr range:NSMakeRange(0, [string length])];
        replaceSpaceWithPercentSymbolTwenty(stringLength, capacity,charPtr);
        for(int i=0;i<capacity;i++)
        {
            NSLog(@"array[%d] = %c",i,charPtr[i]);
        }
    }
    return 0;
}
