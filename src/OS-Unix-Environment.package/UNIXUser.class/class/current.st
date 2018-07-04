defaults
current
	"Return the current user the Pharo process is running in"
	
	^self named: (UNIXProcess resultOfCommand: 'whoami')