"
Unit test for UNIXProcess
"
Class {
	#name : #UNIXProcessTest,
	#superclass : #UNIXSpecificTest,
	#category : #'OS-Unix-Environment-Tests-Processing'
}

{ #category : #tests }
UNIXProcessTest >> testCurrentProcessID [

	self assert: UNIXProcess currentProcessId > 0
]

{ #category : #tests }
UNIXProcessTest >> testParentProcessID [

	self assert: UNIXProcess parentProcessId > 0
]
