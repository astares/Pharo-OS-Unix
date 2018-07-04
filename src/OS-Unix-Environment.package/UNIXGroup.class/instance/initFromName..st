initialization
initFromName: aName
	"Initializes the receiver from the given name"
	
	super initFromName: aName.
	gid := self class groupIDForGroup: aName
	