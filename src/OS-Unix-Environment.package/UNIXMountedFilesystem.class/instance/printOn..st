printing
printOn: aStream

	self name storeOn: aStream.
	aStream 
		nextPutAll: ' (';
		nextPutAll: capacity asString;
		nextPut: $)