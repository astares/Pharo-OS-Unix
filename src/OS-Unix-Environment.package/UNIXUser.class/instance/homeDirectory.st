accessing
homeDirectory

	^(UNIXProcess resultOfCommand: ('echo ~{1}' format: (Array with: self name))) trimRight