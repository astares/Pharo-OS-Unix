"
A unix group
"
Class {
	#name : #UNIXGroup,
	#superclass : #UNIXNamedObject,
	#instVars : [
		'gid'
	],
	#category : 'OS-Unix-Environment-Security'
}

{ #category : #accessing }
UNIXGroup class >> allGroups [
	"Return all user groups in the system"
	
	^((UNIXProcess resultOfCommand: 'groups') substrings: ' ')
		collect: [:each | self named: each ]
]

{ #category : #'private - utilities' }
UNIXGroup class >> groupIDForGroup: aGroupName [
	"Return the GID for the given group name."
	
	|id|
	id := UNIXProcess resultOfCommand: 'id -g ', aGroupName.
	^id ifEmpty: nil ifNotEmpty: [ id asNumber ]
]

{ #category : #accessing }
UNIXGroup >> gid [
	"Returns the groups GID"
	
	^gid
]

{ #category : #initialization }
UNIXGroup >> initFromName: aName [
	"Initializes the receiver from the given name"
	
	super initFromName: aName.
	gid := self class groupIDForGroup: aName
	
]

{ #category : #printing }
UNIXGroup >> printOn: aStream [
	self gid ifNil: [ ^super printOn: aStream ].
	
	aStream 
		nextPutAll: self name;
		nextPutAll: '(gid=';
		nextPutAll: self gid asString;	
		nextPut: $)
]
