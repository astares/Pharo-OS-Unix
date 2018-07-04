"
Instances of this class represent native Unix processes
"
Class {
	#name : #UNIXProcess,
	#superclass : #Object,
	#category : 'OS-Unix-Environment-Processing'
}

{ #category : #'process creation' }
UNIXProcess class >> createProcess: cmd [
	"Create a process"
	
	^UNIXSystem system: cmd
]

{ #category : #accessing }
UNIXProcess class >> currentProcessId [
	"Returns the process identifier (PID) of the calling process"
 
	 ^self ffiCall: #(int getpid(void)) 
			 module: LibC
			 
]

{ #category : #private }
UNIXProcess class >> fgetc: stream [
	"Get character from stream"
	 
	 ^self ffiCall: #(int* fgetc(ExternalAddress* stream)) 
			 module: LibC
			 
]

{ #category : #accessing }
UNIXProcess class >> parentProcessId [
	"Returns the process ID of the parent of the calling process. "
	 
	 ^self ffiCall: #(int getppid(void)) 
			 module: LibC
			 
]

{ #category : #private }
UNIXProcess class >> pipe: command mode: mode [
	"Initiate pipe streams to or from a process "
	 
	 ^self ffiCall: #(ExternalAddress* popen(char* command, char* mode)) 
			 module: LibC
			 
]

{ #category : #private }
UNIXProcess class >> pipeClose: stream [
	"Close pipe"
	 
	 ^self ffiCall: #(int* pclose(ExternalAddress* stream)) 
			 module: LibC
			 
]

{ #category : #piping }
UNIXProcess class >> resultOfCommand: cmd [
	|file last s |
	file := self pipe: cmd mode: 'r'.
	s := String new writeStream.
	[ last := (self fgetc: file) value.
	  last = 16rFFFFFFFF ] whileFalse: [ 	 
			s nextPut: (Character value: last)
	].
	self pipeClose: file.
	^s contents
]

{ #category : #piping }
UNIXProcess class >> resultOfCommand: cmd whenRunningAsRootUsingPassword: pwd [
	"Returns the result of a command when evaluated as root user.
	While
		(UNIXProcess resultOfCommand: 'whoami') >>> 'myuser'.
	runs the command with the current user the following expression:	
		(UNIXProcess resultOfCommand: 'whoami' whenRunningAsRootUsingPassword: 'myrootpassword') >>> 'root'
	runs the command as superuser.	
	"
	^UNIXProcess resultOfCommand: 'echo ',pwd,' | sudo -S ', cmd
]
