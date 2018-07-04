tests - DST
testDaylightSavingsTimeInfoUnavailable

	self assert: (UNIXTime localTime isDaylightSavingTimeInfoUnavailable isKindOf: Boolean)