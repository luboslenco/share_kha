#include <ShareKore.h>

#include <Kore/Android.h>

namespace ShareKore {

	void share(const char* subject, const char* body, const char* url, bool attachScreenshot) {	
        JNIEnv* env;
		KoreAndroid::getActivity()->vm->AttachCurrentThread(&env, NULL);
		
        jclass cls = KoreAndroid::findClass(env, "sharekore.ShareKore");

        jmethodID shareId = env->GetStaticMethodID(cls, "share", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V");

        jstring jsubject = env->NewStringUTF(subject);
        jstring jbody = env->NewStringUTF(body);
        jstring jurl = env->NewStringUTF(url);

        env->CallStaticVoidMethod(cls, shareId, jsubject, jbody, jurl, attachScreenshot);

        KoreAndroid::getActivity()->vm->DetachCurrentThread();
    }
}
