//
//  FISCaesarCipher.m
//  CaesarCipher
//
//  Created by Chris Gonzales on 5/29/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISCaesarCipher.h"

@implementation FISCaesarCipher


-(BOOL)isLetterInRangeEncode:(NSInteger)letter withOffset:(NSInteger)key {
    
    NSInteger offsettedLetterValue = letter + key;
    
    if ((offsettedLetterValue >= 97 && offsettedLetterValue <= 122) || (offsettedLetterValue >= 65 && offsettedLetterValue <= 90)) {
        return YES;
    } else {
        return NO;
    }
    
}

-(BOOL)isLetterInRangeDecode:(NSInteger)letter withOffset:(NSInteger)key {
    
    NSInteger offsettedLetterValue = letter - key;
    
    if ((offsettedLetterValue >= 97 && offsettedLetterValue <= 122) || (offsettedLetterValue >= 65 && offsettedLetterValue <= 90)) {
        return YES;
    } else {
        return NO;
    }
    
}

-(BOOL)isCapitalLetter:(NSString *)originalString uppercaseString:(NSString *)uppercasedString {
    
    if ([[NSString stringWithFormat:@"%@", originalString] isEqualToString:[NSString stringWithFormat:@"%@", uppercasedString]]) {
        return YES;
    }
    
    return NO;
}

-(NSString *)encodeMessage:(NSString *)message withOffset:(NSInteger)key {
    
    NSMutableString *encodedMessageReturn = [@"" mutableCopy];
    key = key % 26;
    for (NSUInteger i = 0; i < [message length]; i++) {
        unichar stringToEncode = [message characterAtIndex:i];
        if (!((stringToEncode >=65 && stringToEncode <= 91) || (stringToEncode >=97 && stringToEncode <= 122))) {
            [encodedMessageReturn appendString:[NSString stringWithFormat:@"%c", stringToEncode]];
            continue;
        }
        if (![self isLetterInRangeEncode:stringToEncode withOffset:key]) {
            stringToEncode = stringToEncode - 26;
        }
        stringToEncode = stringToEncode + key;
        [encodedMessageReturn appendString:[NSString stringWithFormat:@"%c", stringToEncode]];
    }
    return encodedMessageReturn;
}

-(NSString *)decodeMessage:(NSString *)encodedMessage withOffset:(NSInteger)key {
    NSMutableString *encodedMessageReturn = [@"" mutableCopy];
    key = key % 26;
    
    for (NSUInteger i = 0; i < [encodedMessage length]; i++) {
        unichar stringToEncode = [encodedMessage characterAtIndex:i];
        if (!((stringToEncode >=65 && stringToEncode <= 91) || (stringToEncode >=97 && stringToEncode <= 122))) {
            [encodedMessageReturn appendString:[NSString stringWithFormat:@"%c", stringToEncode]];
            continue;
        }
        if (![self isLetterInRangeDecode:stringToEncode withOffset:key]) {
            stringToEncode = stringToEncode + 26;
        }
        stringToEncode = stringToEncode - key;
        [encodedMessageReturn appendString:[NSString stringWithFormat:@"%c", stringToEncode]];
    }
    return encodedMessageReturn;
}

@end
