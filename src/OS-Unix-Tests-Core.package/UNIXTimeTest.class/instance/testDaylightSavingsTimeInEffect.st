tests - DST
testDaylightSavingsTimeInEffect

	self assert: (UNIXTime localTime isDaylightSavingTimeInEffect isKindOf: Boolean)