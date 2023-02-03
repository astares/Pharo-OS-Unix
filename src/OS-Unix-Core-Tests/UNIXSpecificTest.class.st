"
Subclasses represent tests that only run on Unix operating systems
"
Class {
	#name : #UNIXSpecificTest,
	#superclass : #TestCase,
	#category : #'OS-Unix-Core-Tests-Common'
}

{ #category : #testing }
UNIXSpecificTest class >> isAbstract [
	"only run test subclasses on Unix"
	
	 ^(self name = #UNIXSpecificTest)
		  or: [ Smalltalk os isUnix not ]
]
