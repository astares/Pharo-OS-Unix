"
A test for UNIXMountedFilesystem
"
Class {
	#name : #UNIXMountedFilesystemTest,
	#superclass : #UNIXSpecificTest,
	#category : #'OS-Unix-Environment-Tests-FileSystem'
}

{ #category : #tests }
UNIXMountedFilesystemTest >> testAvailableFileSystems [

	self assert: UNIXMountedFilesystem availableFileSystems notEmpty
]

{ #category : #tests }
UNIXMountedFilesystemTest >> testFirstFileSystemStartsWithRoot [

	self assert: (UNIXMountedFilesystem availableFileSystems first mountPoint beginsWith: '/')
]
