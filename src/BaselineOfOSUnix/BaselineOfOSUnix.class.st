"
Baseline for OS Unix support
"
Class {
	#name : #BaselineOfOSUnix,
	#superclass : #BaselineOf,
	#category : 'BaselineOfOSUnix'
}

{ #category : #baseline }
BaselineOfOSUnix >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec 
			package: #'OS-Unix-Core';
			package: #'OS-Unix-Environment' with: [
				spec requires: #(#'OS-Unix-Core' ). ];
			package: #'OS-Unix-Tools' with: [
				spec requires: #(#'OS-Unix-Core' 'OS-Unix-Environment'). ];
			package: #'OS-Unix-Tests-Core' with: [
				spec requires: #(#'OS-Unix-Core' ). ];
			package: #'OS-Unix-Tests-Environment' with: [
				spec requires: #(#'OS-Unix-Environment' #'OS-Unix-Tests-Core' ). ].
		spec 
			group: 'Core' with: #(#'OS-Unix-Core' #'OS-Unix-Environment' );
			group: 'Tests' with: #(#'OS-Unix-Tests-Core' #'OS-Unix-Tests-Environment' );
			group: 'Tools' with: #(#'OS-Unix-Tools'  );
			group: 'default' with: #('Core' 'Tests' 'Tools' ). ].

]
