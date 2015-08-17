package share;

#if (sys_ios || sys_android_native)
@:headerCode('
#include <ShareKore.h>
')
#end

class Share {

	#if (sys_ios || sys_android_native)
	@:functionCode('ShareKore::share(subject, body, url, attachScreenshot);')
	#end
	public static function share(subject:String, body:String, url:String, attachScreenshot:Bool):Void {
	}
}
