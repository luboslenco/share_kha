#include <ShareKore.h>

#include <jni.h>

JNIEnv* getEnv();

namespace ShareKore {

	void share(const char* subject, const char* body, const char* url, bool attachScreenshot) {	
        
        jclass cls = getEnv()->FindClass("sharekore/ShareKore");

        jmethodID shareId = getEnv()->GetStaticMethodID(cls, "share", "()V");

        jstring jsubject = getEnv()->NewStringUTF(subject);
        jstring jbody = getEnv()->NewStringUTF(body);
        jstring jurl = getEnv()->NewStringUTF(url);

        getEnv()->CallStaticVoidMethod(cls, shareId, jsubject, jbody, jurl, attachScreenshot);
    }
}
