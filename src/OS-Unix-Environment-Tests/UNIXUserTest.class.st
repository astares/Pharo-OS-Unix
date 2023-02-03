"
Unit test for UNIXUser
"
Class {
	#name : #UNIXUserTest,
	#superclass : #UNIXSpecificTest,
	#category : #'OS-Unix-Environment-Tests-Security'
}

{ #category : #tests }
UNIXUserTest >> testAllUsersIncludeRootUser [

	self assert: (UNIXUser allUsers includes: (UNIXUser named: 'root'))
]

{ #category : #tests }
UNIXUserTest >> testAllUsersNotEmpty [

	self assert: UNIXUser allUsers notEmpty
]

{ #category : #tests }
UNIXUserTest >> testEqual [

	self assert: UNIXUser root equals: UNIXUser root
]

{ #category : #tests }
UNIXUserTest >> testHasCurrentUser [

	self assert: UNIXUser current name isString
]

{ #category : #tests }
UNIXUserTest >> testPrintString [

	self assert: UNIXUser root printString equals: 'root(uid=0)'
]

{ #category : #tests }
UNIXUserTest >> testRootHasUIDZero [

	self assert: UNIXUser root uid equals: 0
]

{ #category : #tests }
UNIXUserTest >> testRootHomeDirectory [
	| expected |
	expected := Smalltalk os isUnix
						ifTrue: [ '/root' ]
						ifFalse: [ '/var/root' ]. "Mac"
	self assert: UNIXUser root homeDirectory equals: expected
]

{ #category : #tests }
UNIXUserTest >> testRootIsInRootOrAdminGroup [
	| expected |
	expected := Smalltalk os isUnix
						ifTrue: [ 'root' ]
						ifFalse: [ 'admin' ]. "Mac"
	self assert: (UNIXUser root groups includes: expected)
]
