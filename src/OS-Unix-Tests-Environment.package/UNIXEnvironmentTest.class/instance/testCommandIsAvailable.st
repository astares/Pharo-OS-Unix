tests
testCommandIsAvailable
	"The ls command usually is available on all unix systems"
	
	self assert: (UNIXEnvironment isCommandAvailable: 'ls').