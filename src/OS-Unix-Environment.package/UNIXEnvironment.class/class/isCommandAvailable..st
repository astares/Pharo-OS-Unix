testing
isCommandAvailable: aCommand
	"Return true if the command is available on the system"
	
	^(LibC system: 'which ',aCommand) = 0