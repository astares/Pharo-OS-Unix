Extension { #name : #UNIXManual }

{ #category : #'*OS-Unix-Tools' }
UNIXManual class >> openManualPageFor: cmd [

	 |  window text |
    text := RubScrolledTextMorph new.
	 text setText: (self manualPageFor: cmd).
    window := StandardWindow new.
    window addMorph: text fullFrame: (0@0 corner: 1@1) asLayoutFrame.
    window title: 'Man page for ', cmd.
    window openInWorld.
]
