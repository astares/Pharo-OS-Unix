private - utilities
groupsForUser: aUserName
	"Return the groups for the given username."
	
	|res|
	res := UNIXProcess resultOfCommand: 'groups ', aUserName. "On Mac this is already enough"
   Smalltalk os isUnix ifTrue: [ res := (res substrings: ':') second ]. "... on Unix we have to adjust"
	^(res substrings: ' ') collect: #trimmed