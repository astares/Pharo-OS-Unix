accessing
getEnvironmentVariable: variableName
	"Return the value of the given environment variable"
	
	 ^ self ffiCall: #( String getenv (String variableName) ) module: LibC