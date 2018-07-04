piping
resultOfCommand: cmd whenRunningAsRootUsingPassword: pwd
	"Returns the result of a command when evaluated as root user.
	While
		(UNIXProcess resultOfCommand: 'whoami') >>> 'myuser'.
	runs the command with the current user the following expression:	
		(UNIXProcess resultOfCommand: 'whoami' whenRunningAsRootUsingPassword: 'myrootpassword') >>> 'root'
	runs the command as superuser.	
	"
	^UNIXProcess resultOfCommand: 'echo ',pwd,' | sudo -S ', cmd