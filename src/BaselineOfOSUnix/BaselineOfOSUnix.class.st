"
Baseline for OS Unix support
"
Class {
	#name : #BaselineOfOSUnix,
	#superclass : #BaselineOf,
	#category : #BaselineOfOSUnix
}

{ #category : #baselines }
BaselineOfOSUnix >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		"Packages"
		spec
			package: #'OS-Unix-Core';
			package: #'OS-Unix-Core-Tests' with: [ spec requires: #(#'OS-Unix-Core' ) ];

			package: #'OS-Unix-Environment' with: [ spec requires: #(#'OS-Unix-Core' ) ];
			package: #'OS-Unix-Environment-Tests' with: [
				spec requires: #(#'OS-Unix-Environment' #'OS-Unix-Core-Tests' ) ];

			package: #'OS-Unix-Tools' with: [ spec requires: #(#'OS-Unix-Core' 'OS-Unix-Environment') ].

		"Groups"
		spec
			group: 'Core' with: #(#'OS-Unix-Core' #'OS-Unix-Environment' );
			group: 'Tests' with: #(#'OS-Unix-Tests-Core' #'OS-Unix-Tests-Environment' );
			group: 'Tools' with: #(#'OS-Unix-Tools');
			group: 'CI' with: #(#'Tests');
			group: 'all' with: #('Core' 'Tests' 'Tools' );
			group: 'default' with: #('all') ]
]
