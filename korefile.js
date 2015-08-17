var project = new Project('share_kha');

if (platform === Platform.iOS) {
	project.addFile('ios/sharekore/**');
	project.addIncludeDir('ios/sharekore');
}
else if (platform === Platform.Android) {
	project.addFile('android/sharekore/**');
	project.addIncludeDir('android/sharekore');
	project.addJavaDir('android/java');
}

return project;
