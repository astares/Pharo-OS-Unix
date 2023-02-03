"
SUnit tests for UnixTime
"
Class {
	#name : #UNIXTimeTest,
	#superclass : #UNIXSpecificTest,
	#instVars : [
		'localTime'
	],
	#category : #'OS-Unix-Core-Tests-Base'
}

{ #category : #running }
UNIXTimeTest >> setUp [

	super setUp.
	localTime := UNIXTime localTime
]

{ #category : #'tests - primitives' }
UNIXTimeTest >> testCTimeTo [

	self assert: (UNIXTime ctime: (UNIXTime getTime: nil)) notEmpty
]

{ #category : #'tests - fields' }
UNIXTimeTest >> testDay [

	self assert: localTime day < 32
]

{ #category : #'tests - fields' }
UNIXTimeTest >> testDayOfWeek [

	self assert: localTime dayOfWeek < 7
]

{ #category : #'tests - DST' }
UNIXTimeTest >> testDaylightSavingsTimeInEffect [

	self assert: (UNIXTime localTime isDaylightSavingTimeInEffect isKindOf: Boolean)
]

{ #category : #'tests - DST' }
UNIXTimeTest >> testDaylightSavingsTimeInfoUnavailable [

	self assert: (UNIXTime localTime isDaylightSavingTimeInfoUnavailable isKindOf: Boolean)
]

{ #category : #'tests - DST' }
UNIXTimeTest >> testDaylightSavingsTimeNotInEffect [

	self assert: (UNIXTime localTime isDaylightSavingTimeNotInEffect isKindOf: Boolean)
]

{ #category : #'tests - primitives' }
UNIXTimeTest >> testGetTime [

	self assert: (UNIXTime getTime: nil) > 0
]

{ #category : #'tests - fields' }
UNIXTimeTest >> testHour [

	self assert: localTime hour < 24
]

{ #category : #tests }
UNIXTimeTest >> testLocalTime [

	self assert: UNIXTime localTime notNil
]

{ #category : #'tests - fields' }
UNIXTimeTest >> testMinute [

	self assert: localTime minute < 60
]

{ #category : #'tests - fields' }
UNIXTimeTest >> testMonth [

	self assert: localTime month < 13
]

{ #category : #'tests - fields' }
UNIXTimeTest >> testSecond [

	self assert: localTime second < 60
]

{ #category : #'tests - fields' }
UNIXTimeTest >> testYear [

	self assert: localTime year > 2014
]
