accessing
allUsers
	"Return all users in the system"
	| all |
	all := OrderedCollection new.
	(UNIXProcess resultOfCommand: 'cut -d: -f1 /etc/passwd')
		linesDo: [ :each | (each beginsWith: '#') 
				ifFalse: [ all add: (self named: each) ]].
	^ all