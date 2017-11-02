//
//  IPFormatter.m
//  IPFormatterDemo
//
//  Created by Friedrich on 05.07.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
//

#import "IPFormatter.h"


@implementation IPFormatter

int counter;


- (NSString*)stringForObjectValue:(id)obj
{
    return [obj description];
}

- (BOOL)getObjectValue:(id*)obj 
			 forString:(NSString*)string 
	  errorDescription:(NSString**)error
{
    *obj = [string copy];
    return YES;
}


// IP Adresse validieren
-(BOOL)isPartialStringValid:(NSString *)partialString
		   newEditingString:(NSString**)newString
		   errorDescription:(NSString**)error
{
	
	// Ziffern und Punkt
	NSCharacterSet *allowedChars = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789."] invertedSet];
	
	if([partialString rangeOfCharacterFromSet:allowedChars].location != NSNotFound)
	{
		
		// Es wurde keine Ziffer oder Punkt getippt
		NSBeep();
		return NO;
		
	}
	else
	{
		
		// Keine Punktfolge
		if([partialString rangeOfString:@".."].location != NSNotFound)
		{
			
			NSBeep();
			return NO;
			
		}
		
		// Kein Punkt am Anfang
		if([partialString rangeOfString:@"."].location == 0)
		{
			
			NSBeep();
			return NO;
			
		}
      

		// Adress-Segmente bilden
		NSArray *textSegments = [partialString componentsSeparatedByString:@"."];
		
		// Maximal vier Segmente erlauben
		if([textSegments count] > 4)
		{
			
			NSBeep();
			return NO;
		}
		
		// Einzelne Segmente prüfen
		for(NSString *segment in textSegments)
		{
			
			// Keine 0 am Anfang, sonst aber schon
			if([textSegments count] == 1)
			{
				if([segment rangeOfString:@"0"].location == 0)
				{
					NSBeep();
					return NO;
					
				} 
			}
         else
         {
               // Keine 00 in den weiteren Segmenteb 
               if([segment rangeOfString:@"00"].location == 0)
               {
                  NSBeep();
                  return NO;
               }
               else  // wenn eine 0 dann keine weiteren Werte
               if(([segment rangeOfString:@"0"].location == 0) && ([segment length] > 1))
               {
                     
                  NSBeep();
                  return NO;
               }
               
         }
			
			// Maximal 3 Ziffern
			if([segment length] > 3)
			{
				
				NSBeep();
				return NO;
				
			}
			
			// Kleiner gleich 255
			if([segment integerValue] > 255)
			{
				
				NSBeep();
				return NO;
				
			}
			
		}
		
	}
	
	return YES;
}

@end
