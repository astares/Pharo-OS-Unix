"
The unix system
"
Class {
	#name : #UNIXSystem,
	#superclass : #Object,
	#category : #'OS-Unix-Core-Base'
}

{ #category : #'private - utilities' }
UNIXSystem class >> contentsOf: fileName [

	 ^fileName asFileReference readStreamDo: [:s | s upToEnd asString ]
]

{ #category : #primitives }
UNIXSystem class >> system: command [

	 ^ self ffiCall: #(int system(char* command) )
			  module: LibC
]

{ #category : #accessing }
UNIXSystem class >> upTime [

	^ self contentsOf: '/proc/uptime/'
]
