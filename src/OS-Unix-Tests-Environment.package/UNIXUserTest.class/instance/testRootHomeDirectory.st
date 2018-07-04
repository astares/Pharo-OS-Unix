tests
testRootHomeDirectory
	| expected |
	expected := Smalltalk os isUnix 
						ifTrue: [ '/root' ] 
						ifFalse: [ '/var/root' ]. "Mac"
	self assert: UNIXUser root homeDirectory = expected