printing
printOn: aStream

	aStream 
		nextPutAll: self name;
		nextPutAll: '(uid=';
		nextPutAll: self uid asString;	
		nextPut: $)