accessing
availableManPages
	"Return all available man pages"
	
	^(UNIXProcess resultOfCommand: 'man -k .') lines 
			collect: [:line| (line findTokens: Character space) first]