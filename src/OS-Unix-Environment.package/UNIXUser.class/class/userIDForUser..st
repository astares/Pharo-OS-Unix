private - utilities
userIDForUser: aUserName
	"Return the UID for the given username."
	
	^(UNIXProcess resultOfCommand: 'id -u ', aUserName) asNumber