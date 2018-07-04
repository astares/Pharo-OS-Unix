accessing
parentProcessId
	"Returns the process ID of the parent of the calling process. "
	 
	 ^self ffiCall: #(int getppid(void)) 
			 module: LibC
			 