Extension { #name : #PPCompositeParser }

{ #category : #'*PetitGui' }
PPCompositeParser class >> debug: anObject [
	^ self debug: anObject startingAt: self startSymbol
]

{ #category : #'*PetitGui' }
PPCompositeParser class >> debug: anObject onError: aBlock [
	^ self debug: anObject startingAt: self startSymbol onError: aBlock
]

{ #category : #'*PetitGui' }
PPCompositeParser class >> debug: anObject startingAt: aSymbol [
	^ (self newStartingAt: aSymbol) debug: anObject
]

{ #category : #'*PetitGui' }
PPCompositeParser class >> debug: anObject startingAt: aSymbol onError: aBlock [
	^ (self newStartingAt: aSymbol) debug: anObject onError: aBlock
]

{ #category : #'*PetitGui' }
PPCompositeParser >> spotterForProductionsFor: aStep [
	<spotterOrder: 10>
	
	aStep listProcessor
		title: 'Productions';
		allCandidates: [ (self productionNames collect: #value) asOrderedCollection ];
		candidatesLimit: 5;
		filter: GTFilterSubstring;
		wantsToDisplayOnEmptyQuery: true
]
