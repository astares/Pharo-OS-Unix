accessing
allGroups
	"Return all user groups in the system"
	
	^((UNIXProcess resultOfCommand: 'groups') substrings: ' ')
		collect: [:each | self named: each ]