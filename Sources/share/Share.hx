package share;

#if sys_ios
@:headerCode('
#include <ShareKore.h>
')
#end

class Share {

	// TODO: use __cpp__
	#if sys_ios
	@:functionCode('return ShareKore::init();')
	#end
	public static function init():Int {
		return 0;
	}

	#if sys_ios
	@:functionCode('ShareKore::share(subject, body, url, attachScreenshot);')
	#end
	public static function share(subject:String, body:String, url:String, attachScreenshot:Bool):Void {
	}
}
