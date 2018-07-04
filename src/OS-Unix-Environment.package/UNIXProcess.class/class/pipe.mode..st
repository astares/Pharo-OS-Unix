private
pipe: command mode: mode
	"Initiate pipe streams to or from a process "
	 
	 ^self ffiCall: #(ExternalAddress* popen(char* command, char* mode)) 
			 module: LibC
			 