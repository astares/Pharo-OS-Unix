piping
resultOfCommand: cmd
	|file last s |
	file := self pipe: cmd mode: 'r'.
	s := String new writeStream.
	[ last := (self fgetc: file) value.
	  last = 16rFFFFFFFF ] whileFalse: [ 	 
			s nextPut: (Character value: last)
	].
	self pipeClose: file.
	^s contents