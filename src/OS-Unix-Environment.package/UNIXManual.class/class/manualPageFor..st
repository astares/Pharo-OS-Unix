accessing
manualPageFor: aCommand
	"Return the manual page for the given command"
	
	^UNIXProcess resultOfCommand: 'man ', aCommand 