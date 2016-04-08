//
//     ____    _                        __     _      _____
//    / ___\  /_\     /\/\    /\ /\    /__\   /_\     \_   \
//    \ \    //_\\   /    \  / / \ \  / \//  //_\\     / /\/
//  /\_\ \  /  _  \ / /\/\ \ \ \_/ / / _  \ /  _  \ /\/ /_
//  \____/  \_/ \_/ \/    \/  \___/  \/ \_/ \_/ \_/ \____/
//
//	Copyright Samurai development team and other contributors
//
//	http://www.samurai-framework.com
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy
//	of this software and associated documentation files (the "Software"), to deal
//	in the Software without restriction, including without limitation the rights
//	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//	copies of the Software, and to permit persons to whom the Software is
//	furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in
//	all copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//	THE SOFTWARE.
//

#import "Samurai_Config.h"
#import "Samurai_CoreConfig.h"

#import "Samurai_Property.h"
#import "Samurai_Singleton.h"

#pragma mark -

typedef void ( *ImpFuncType )( id a, SEL b, void * c );

#pragma mark -

#undef	joint
#define joint( name )						property (nonatomic, readonly) NSString * __name

#undef	def_joint
#define def_joint( name	)					dynamic __name

#define	hookBefore( name, ... )				hookBefore_( macro_concat(before_, name), __VA_ARGS__)
#define	hookBefore_( name, ... )			- (void) macro_join(name, __VA_ARGS__)

#define	hookAfter( name, ... )				hookAfter_( macro_concat(after_, name), __VA_ARGS__)
#define	hookAfter_( name, ... )				- (void) macro_join(name, __VA_ARGS__)

#pragma mark -

#define trigger( target, prefix, name )		[target performCallChainWithPrefix:macro_string(macro_concat(prefix, name)) reversed:NO]
#define triggerR( target, prefix, name )	[target performCallChainWithPrefix:macro_string(macro_concat(prefix, name)) reversed:YES]

#define triggerBefore( target, name )		[target performCallChainWithPrefix:macro_string(macro_concat(before_, name)) reversed:NO]
#define triggerBeforeR( target, name )		[target performCallChainWithPrefix:macro_string(macro_concat(before_, name)) reversed:YES]

#define triggerAfter( target, name )		[target performCallChainWithPrefix:macro_string(macro_concat(after_, name)) reversed:NO]
#define triggerAfterR( target, name )		[target performCallChainWithPrefix:macro_string(macro_concat(after_, name)) reversed:YES]

#define	callChain( target, name )			[target performCallChainWithName:@(#name) reversed:NO]
#define	callChainR( target, name )			[target performCallChainWithName:@(#name) reversed:YES]

#pragma mark -

@interface NSObject(Loader)

- (void)load;
- (void)unload;

- (void)performLoad;
- (void)performUnload;

@end

#pragma mark -

@interface NSObject(Trigger)

+ (void)performSelectorWithPrefix:(NSString *)prefix;
- (void)performSelectorWithPrefix:(NSString *)prefix;

- (id)performCallChainWithSelector:(SEL)sel;
- (id)performCallChainWithSelector:(SEL)sel reversed:(BOOL)flag;

- (id)performCallChainWithPrefix:(NSString *)prefix;
- (id)performCallChainWithPrefix:(NSString *)prefix reversed:(BOOL)flag;

- (id)performCallChainWithName:(NSString *)name;
- (id)performCallChainWithName:(NSString *)name reversed:(BOOL)flag;

@end
