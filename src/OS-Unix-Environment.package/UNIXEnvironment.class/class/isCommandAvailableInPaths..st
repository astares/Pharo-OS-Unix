testing
isCommandAvailableInPaths: aCommand

	| paths |
	paths := self getPathEntries collect: [ :string | string asFileReference ].
	^paths anySatisfy: [ :directory |
		(directory allChildren anySatisfy: [ :any | any isFile and: [ any basename = aCommand ] ]) ]
			