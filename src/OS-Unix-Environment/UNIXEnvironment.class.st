"
A class to query various environment settings
"
Class {
	#name : #UNIXEnvironment,
	#superclass : #Object,
	#category : 'OS-Unix-Environment-Environment'
}

{ #category : #accessing }
UNIXEnvironment class >> getEnvironmentVariable: variableName [
	"Return the value of the given environment variable"
	
	 ^ self ffiCall: #( String getenv (String variableName) ) module: LibC
]

{ #category : #'accessing - configuration' }
UNIXEnvironment class >> getPathEntries [
	"Return the PATH entries"
	
	^(self getEnvironmentVariable: 'PATH') findTokens: $:
	
]

{ #category : #testing }
UNIXEnvironment class >> isCommandAvailable: aCommand [
	"Return true if the command is available on the system"
	
	^(LibC system: 'which ',aCommand) = 0
]

{ #category : #testing }
UNIXEnvironment class >> isCommandAvailableInPaths: aCommand [

	| paths |
	paths := self getPathEntries collect: [ :string | string asFileReference ].
	^paths anySatisfy: [ :directory |
		(directory allChildren anySatisfy: [ :any | any isFile and: [ any basename = aCommand ] ]) ]
			
]
