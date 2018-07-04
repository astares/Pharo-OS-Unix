private - utilities
groupIDForGroup: aGroupName
	"Return the GID for the given group name."
	
	|id|
	id := UNIXProcess resultOfCommand: 'id -g ', aGroupName.
	^id ifEmpty: nil ifNotEmpty: [ id asNumber ]