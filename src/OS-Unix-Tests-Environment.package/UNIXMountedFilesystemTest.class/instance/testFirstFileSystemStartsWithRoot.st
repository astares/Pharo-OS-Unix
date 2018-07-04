tests
testFirstFileSystemStartsWithRoot

	self assert: (UNIXMountedFilesystem availableFileSystems first mountPoint beginsWith: '/')