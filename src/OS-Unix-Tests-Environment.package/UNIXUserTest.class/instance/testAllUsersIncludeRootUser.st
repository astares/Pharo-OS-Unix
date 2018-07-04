tests
testAllUsersIncludeRootUser

	self assert: (UNIXUser allUsers includes: (UNIXUser named: 'root'))