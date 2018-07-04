"
The unix user
"
Class {
	#name : #UNIXUser,
	#superclass : #UNIXNamedObject,
	#instVars : [
		'uid'
	],
	#category : 'OS-Unix-Environment-Security'
}

{ #category : #accessing }
UNIXUser class >> allUsers [
	"Return all users in the system"
	| all |
	all := OrderedCollection new.
	(UNIXProcess resultOfCommand: 'cut -d: -f1 /etc/passwd')
		linesDo: [ :each | (each beginsWith: '#') 
				ifFalse: [ all add: (self named: each) ]].
	^ all
]

{ #category : #defaults }
UNIXUser class >> current [
	"Return the current user the Pharo process is running in"
	
	^self named: (UNIXProcess resultOfCommand: 'whoami')
]

{ #category : #'private - utilities' }
UNIXUser class >> groupsForUser: aUserName [
	"Return the groups for the given username."
	
	|res|
	res := UNIXProcess resultOfCommand: 'groups ', aUserName. "On Mac this is already enough"
   Smalltalk os isUnix ifTrue: [ res := (res substrings: ':') second ]. "... on Unix we have to adjust"
	^(res substrings: ' ') collect: #trimmed
]

{ #category : #defaults }
UNIXUser class >> root [

	^self named: 'root'
]

{ #category : #'private - utilities' }
UNIXUser class >> userIDForUser: aUserName [
	"Return the UID for the given username."
	
	^(UNIXProcess resultOfCommand: 'id -u ', aUserName) asNumber
]

{ #category : #accessing }
UNIXUser >> groups [

	^self class groupsForUser: self name
]

{ #category : #accessing }
UNIXUser >> homeDirectory [

	^(UNIXProcess resultOfCommand: ('echo ~{1}' format: (Array with: self name))) trimRight
]

{ #category : #initialization }
UNIXUser >> initFromName: aName [
	"Initializes the receiver from the given name"
	
	super initFromName: aName.
	uid := self class userIDForUser: aName
	
]

{ #category : #testing }
UNIXUser >> isRoot [

	^self name = 'root'
]

{ #category : #printing }
UNIXUser >> printOn: aStream [

	aStream 
		nextPutAll: self name;
		nextPutAll: '(uid=';
		nextPutAll: self uid asString;	
		nextPut: $)
]

{ #category : #accessing }
UNIXUser >> uid [
	"Returns the users UID"
	
	^uid
]
