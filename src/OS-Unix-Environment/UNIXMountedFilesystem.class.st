"
The Unix file system
"
Class {
	#name : #UNIXMountedFilesystem,
	#superclass : #Object,
	#instVars : [
		'name',
		'mountPoint',
		'type',
		'usedSpace',
		'availableSpace',
		'capacity'
	],
	#category : 'OS-Unix-Environment-FileSystem'
}

{ #category : #accessing }
UNIXMountedFilesystem class >> availableFileSystems [
	"Query infos about file system by using the disk filesystem command with POSIX formatting option"
	
	<script: 'self availableFileSystems inspect'> 	
	|coll|
	coll := (UNIXProcess resultOfCommand: 'df -P -T') lines allButFirst 
				collect: [:line | 					
					self newInstanceFromDFInfos: (line findTokens: (Character space))].
	^coll			
	
]

{ #category : #'private - instance creation' }
UNIXMountedFilesystem class >> newInstanceFromDFInfos: aCollection [
 
	 ^(self new)
			name: aCollection first;
			type: aCollection second;
			usedSpace:  (aCollection at: aCollection size -3);
			availableSpace:  (aCollection at: aCollection size -2);
			capacity: (aCollection at: aCollection size -1);
			mountPoint: aCollection last;

			yourself
]

{ #category : #accessing }
UNIXMountedFilesystem >> availableSpace [
	^ availableSpace
]

{ #category : #accessing }
UNIXMountedFilesystem >> availableSpace: anObject [
	availableSpace := anObject
]

{ #category : #accessing }
UNIXMountedFilesystem >> capacity [
	^ capacity
]

{ #category : #accessing }
UNIXMountedFilesystem >> capacity: anObject [
	capacity := anObject
]

{ #category : #accessing }
UNIXMountedFilesystem >> mountPoint [
	^ mountPoint
]

{ #category : #accessing }
UNIXMountedFilesystem >> mountPoint: anObject [
	mountPoint := anObject
]

{ #category : #accessing }
UNIXMountedFilesystem >> name [ 
	^ name
]

{ #category : #accessing }
UNIXMountedFilesystem >> name: anObject [
	name := anObject
]

{ #category : #printing }
UNIXMountedFilesystem >> printOn: aStream [

	self name storeOn: aStream.
	aStream 
		nextPutAll: ' (';
		nextPutAll: capacity asString;
		nextPut: $)
]

{ #category : #accessing }
UNIXMountedFilesystem >> type [
	^ type
]

{ #category : #accessing }
UNIXMountedFilesystem >> type: anObject [
	type := anObject
]

{ #category : #accessing }
UNIXMountedFilesystem >> usedSpace [
	^ usedSpace
]

{ #category : #accessing }
UNIXMountedFilesystem >> usedSpace: anObject [
	usedSpace := anObject
]
