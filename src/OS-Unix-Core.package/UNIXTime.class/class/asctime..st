private - primitives
asctime: timeptr	

	 ^ self ffiCall: #(char* asctime(tm* timeptr) ) 
			  module: LibC