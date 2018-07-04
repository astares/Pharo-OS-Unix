accessing - configuration
getPathEntries
	"Return the PATH entries"
	
	^(self getEnvironmentVariable: 'PATH') findTokens: $:
	