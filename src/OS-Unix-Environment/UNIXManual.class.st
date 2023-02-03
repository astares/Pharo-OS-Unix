"
Interface to the on-line reference manuals

"
Class {
	#name : #UNIXManual,
	#superclass : #Object,
	#category : #'OS-Unix-Environment-Help'
}

{ #category : #accessing }
UNIXManual class >> availableManPages [
	"Return all available man pages"

	^(UNIXProcess resultOfCommand: 'man -k .') lines
			collect: [:line| (line findTokens: Character space) first]
]

{ #category : #accessing }
UNIXManual class >> manualPageFor: aCommand [
	"Return the manual page for the given command"

	^UNIXProcess resultOfCommand: 'man ', aCommand
]
