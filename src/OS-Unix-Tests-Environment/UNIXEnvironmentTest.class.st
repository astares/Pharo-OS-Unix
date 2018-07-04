"
Unit test for UNIXEnvironment
"
Class {
	#name : #UNIXEnvironmentTest,
	#superclass : #UNIXSpecificTest,
	#category : 'OS-Unix-Tests-Environment-Environment'
}

{ #category : #tests }
UNIXEnvironmentTest >> testCommandIsAvailable [
	"The ls command usually is available on all unix systems"
	
	self assert: (UNIXEnvironment isCommandAvailable: 'ls').
]

{ #category : #tests }
UNIXEnvironmentTest >> testPathEntries [

	self assert: UNIXEnvironment getPathEntries isCollection
]
