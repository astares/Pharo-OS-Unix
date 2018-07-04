tests
testRootIsInRootOrAdminGroup
	| expected |
	expected := Smalltalk os isUnix 
						ifTrue: [ 'root' ] 
						ifFalse: [ 'admin' ]. "Mac"
	self assert: (UNIXUser root groups includes: expected)