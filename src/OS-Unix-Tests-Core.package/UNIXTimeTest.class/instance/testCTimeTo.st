tests - primitives
testCTimeTo

	self assert: (UNIXTime ctime: (UNIXTime getTime: nil)) notEmpty