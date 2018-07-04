accessing
currentProcessId
	"Returns the process identifier (PID) of the calling process"
 
	 ^self ffiCall: #(int getpid(void)) 
			 module: LibC
			 