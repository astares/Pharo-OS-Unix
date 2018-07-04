initialization
initFromName: aName
	"Initializes the receiver from the given name"
	
	super initFromName: aName.
	uid := self class userIDForUser: aName
	