private - instance creation
newInstanceFromDFInfos: aCollection
 
	 ^(self new)
			name: aCollection first;
			type: aCollection second;
			usedSpace:  (aCollection at: aCollection size -3);
			availableSpace:  (aCollection at: aCollection size -2);
			capacity: (aCollection at: aCollection size -1);
			mountPoint: aCollection last;

			yourself