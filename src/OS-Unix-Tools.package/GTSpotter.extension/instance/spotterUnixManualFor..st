*OS-Unix-Tools
spotterUnixManualFor: aStep
	<spotterOrder: 50>
	aStep listProcessor
			title: 'Unix Manual';
			allCandidates: [ UNIXManual availableManPages ];
			itemIcon: [Smalltalk ui icons pageIcon];
			actLogic: [:item | UNIXManual openManualPageFor: item];
			filter: GTFilterSubstring;
			wantsToDisplayOnEmptyQuery: true