"
Abstract superclass for named objects used in the context of UNIX
"
Class {
	#name : #UNIXNamedObject,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : 'OS-Unix-Environment-Security'
}

{ #category : #'instance creation' }
UNIXNamedObject class >> named: aName [

	^(self new)
		initFromName: aName;
		yourself
]

{ #category : #comparing }
UNIXNamedObject >> = anotherUser [

	^self name = anotherUser name
]

{ #category : #initialization }
UNIXNamedObject >> initFromName: aName [
	"Initializes the receiver from the given name"
	
	name := aName
]

{ #category : #accessing }
UNIXNamedObject >> name [

	^name
]

{ #category : #accessing }
UNIXNamedObject >> name: aString [

	name := aString
]

{ #category : #printing }
UNIXNamedObject >> printOn: aStream [

	aStream nextPutAll: self name
]
