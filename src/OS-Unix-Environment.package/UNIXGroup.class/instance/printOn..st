printing
printOn: aStream
	self gid ifNil: [ ^super printOn: aStream ].
	
	aStream 
		nextPutAll: self name;
		nextPutAll: '(gid=';
		nextPutAll: self gid asString;	
		nextPut: $)