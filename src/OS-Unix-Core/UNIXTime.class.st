"
Represents the unix time
"
Class {
	#name : #UNIXTime,
	#superclass : #FFIExternalStructure,
	#pools : [
		'UNIXConstants'
	],
	#category : 'OS-Unix-Core-Base'
}

{ #category : #'private - primitives' }
UNIXTime class >> asctime: timeptr [	

	 ^ self ffiCall: #(char* asctime(tm* timeptr) ) 
			  module: LibC
]

{ #category : #'private - primitives' }
UNIXTime class >> ctime: t [
	
	 ^ self ffiCall: #(char* ctime(time_t* t) ) 
			  module: LibC
]

{ #category : #example }
UNIXTime class >> example [

	 self localTime inspect
]

{ #category : #'private - accessing' }
UNIXTime class >> fieldsDesc [
	"self rebuildFieldAccessors "
	^ #(
		int tm_sec;         " seconds,  range 0 to 59          "
   		int tm_min;         " minutes, range 0 to 59           "
   		int tm_hour;        " hours, range 0 to 23             "
   		int tm_mday;        " day of the month, range 1 to 31  "
   		int tm_mon;         " month, range 0 to 11             "
   		int tm_year;        " The number of years since 1900   "
   		int tm_wday;        " day of the week, range 0 to 6    "
   		int tm_yday;        " day in the year, range 0 to 365  "
   		int tm_isdst;       " daylight saving time             "
		)
]

{ #category : #'private - primitives' }
UNIXTime class >> getTime: t [
	
	 ^self ffiCall: #(time_t time(time_t* t) ) 
			 module: LibC
			 options: #(+ optCoerceNilToNull)
]

{ #category : #accessing }
UNIXTime class >> localTime [

	 ^UNIXTime localTime: (UNIXTime getTime: nil)
]

{ #category : #'private - primitives' }
UNIXTime class >> localTime: time [	
		
	 ^ self ffiCall: #(tm* localtime(time_t* time) ) 
			  module: LibC
]

{ #category : #accessing }
UNIXTime >> day [

	 ^self tm_mday
]

{ #category : #accessing }
UNIXTime >> dayOfWeek [

	 ^self tm_wday
]

{ #category : #accessing }
UNIXTime >> hour [

	 ^self tm_hour
]

{ #category : #testing }
UNIXTime >> isDaylightSavingTimeInEffect [
	"Return true if the daylight savings time is in effect, false otherwise"
	
	 ^self tm_isdst > 0
]

{ #category : #testing }
UNIXTime >> isDaylightSavingTimeInfoUnavailable [
	"Return true if the daylight savings time info is not available, false otherwise"
	
	 ^self tm_isdst < 0
]

{ #category : #testing }
UNIXTime >> isDaylightSavingTimeNotInEffect [
	"Return true if the daylight savings time is not in effect, false otherwise"
	
	 ^self tm_isdst = 0
]

{ #category : #accessing }
UNIXTime >> minute [

	 ^self tm_min
]

{ #category : #accessing }
UNIXTime >> month [

	 ^self tm_mon
]

{ #category : #printing }
UNIXTime >> printOn: aStream [

	aStream nextPutAll: (self class asctime: self) asString.
	super printOn: aStream
]

{ #category : #accessing }
UNIXTime >> second [

	 ^self tm_sec
]

{ #category : #'accessing structure variables' }
UNIXTime >> tm_hour [
	"This method was automatically generated"
	^handle signedLongAt: 9
]

{ #category : #'accessing structure variables' }
UNIXTime >> tm_hour: anObject [
	"This method was automatically generated"
	handle signedLongAt: 9 put: anObject
]

{ #category : #'accessing structure variables' }
UNIXTime >> tm_isdst [
	"This method was automatically generated"
	^handle signedLongAt: 33
]

{ #category : #'accessing structure variables' }
UNIXTime >> tm_isdst: anObject [
	"This method was automatically generated"
	handle signedLongAt: 33 put: anObject
]

{ #category : #'accessing structure variables' }
UNIXTime >> tm_mday [
	"This method was automatically generated"
	^handle signedLongAt: 13
]

{ #category : #'accessing structure variables' }
UNIXTime >> tm_mday: anObject [
	"This method was automatically generated"
	handle signedLongAt: 13 put: anObject
]

{ #category : #'accessing structure variables' }
UNIXTime >> tm_min [
	"This method was automatically generated"
	^handle signedLongAt: 5
]

{ #category : #'accessing structure variables' }
UNIXTime >> tm_min: anObject [
	"This method was automatically generated"
	handle signedLongAt: 5 put: anObject
]

{ #category : #'accessing structure variables' }
UNIXTime >> tm_mon [
	"This method was automatically generated"
	^handle signedLongAt: 17
]

{ #category : #'accessing structure variables' }
UNIXTime >> tm_mon: anObject [
	"This method was automatically generated"
	handle signedLongAt: 17 put: anObject
]

{ #category : #'accessing structure variables' }
UNIXTime >> tm_sec [
	"This method was automatically generated"
	^handle signedLongAt: 1
]

{ #category : #'accessing structure variables' }
UNIXTime >> tm_sec: anObject [
	"This method was automatically generated"
	handle signedLongAt: 1 put: anObject
]

{ #category : #'accessing structure variables' }
UNIXTime >> tm_wday [
	"This method was automatically generated"
	^handle signedLongAt: 25
]

{ #category : #'accessing structure variables' }
UNIXTime >> tm_wday: anObject [
	"This method was automatically generated"
	handle signedLongAt: 25 put: anObject
]

{ #category : #'accessing structure variables' }
UNIXTime >> tm_yday [
	"This method was automatically generated"
	^handle signedLongAt: 29
]

{ #category : #'accessing structure variables' }
UNIXTime >> tm_yday: anObject [
	"This method was automatically generated"
	handle signedLongAt: 29 put: anObject
]

{ #category : #'accessing structure variables' }
UNIXTime >> tm_year [
	"This method was automatically generated"
	^handle signedLongAt: 21
]

{ #category : #'accessing structure variables' }
UNIXTime >> tm_year: anObject [
	"This method was automatically generated"
	handle signedLongAt: 21 put: anObject
]

{ #category : #accessing }
UNIXTime >> year [

	^1900 + self tm_year
]
