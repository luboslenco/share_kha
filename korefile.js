var project = new Project('share_kha');

if (platform === Platform.iOS) {
	project.addFile('ios/sharekore/**');
	project.addIncludeDir('ios/sharekore');
}

return project;
