#pragma once

namespace ShareKore {

	int init();

	void share(const char* subject, const char* body, const char* url, bool attachScreenshot);
}
