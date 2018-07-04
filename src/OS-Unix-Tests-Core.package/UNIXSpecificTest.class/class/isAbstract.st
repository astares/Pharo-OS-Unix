testing
isAbstract
	"only run test subclasses on Unix"
	
	 ^(self name = #UNIXSpecificTest)
		  or: [ Smalltalk os isUnix not ]