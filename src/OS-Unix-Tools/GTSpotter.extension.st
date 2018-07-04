Extension { #name : #GTSpotter }

{ #category : #'*OS-Unix-Tools' }
GTSpotter >> spotterUnixManualFor: aStep [
	<spotterOrder: 50>
	aStep listProcessor
			title: 'Unix Manual';
			allCandidates: [ UNIXManual availableManPages ];
			itemIcon: [Smalltalk ui icons pageIcon];
			actLogic: [:item | UNIXManual openManualPageFor: item];
			filter: GTFilterSubstring;
			wantsToDisplayOnEmptyQuery: true
]
