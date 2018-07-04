tests - DST
testDaylightSavingsTimeNotInEffect

	self assert: (UNIXTime localTime isDaylightSavingTimeNotInEffect isKindOf: Boolean)