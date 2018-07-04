private - primitives
getTime: t
	
	 ^self ffiCall: #(time_t time(time_t* t) ) 
			 module: LibC
			 options: #(+ optCoerceNilToNull)