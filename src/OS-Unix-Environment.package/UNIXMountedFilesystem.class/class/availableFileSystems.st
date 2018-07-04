accessing
availableFileSystems
	"Query infos about file system by using the disk filesystem command with POSIX formatting option"
	
	<script: 'self availableFileSystems inspect'> 	
	|coll|
	coll := (UNIXProcess resultOfCommand: 'df -P -T') lines allButFirst 
				collect: [:line | 					
					self newInstanceFromDFInfos: (line findTokens: (Character space))].
	^coll			
	