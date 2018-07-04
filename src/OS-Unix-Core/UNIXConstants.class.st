"
Shared constants
"
Class {
	#name : #UNIXConstants,
	#superclass : #SharedPool,
	#classVars : [
		'time_t',
		'tm'
	],
	#category : 'OS-Unix-Core-Support'
}

{ #category : #'private - initialization' }
UNIXConstants class >> initTimeTypes [

	time_t := #ulong.
	tm := #UNIXTime
]

{ #category : #initialization }
UNIXConstants class >> initialize [

	self initTimeTypes
]
