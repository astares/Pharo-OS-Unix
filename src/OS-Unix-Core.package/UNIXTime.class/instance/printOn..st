printing
printOn: aStream

	aStream nextPutAll: (self class asctime: self) asString.
	super printOn: aStream