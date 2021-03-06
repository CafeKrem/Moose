Extension { #name : #MooseQueryResult }

{ #category : #'*moose-finder' }
MooseQueryResult >> gtInspectorItemsIn: composite [
	^ composite list
		title: 'Items';
		display: [ :aCollection | self sorted: [ :a :b | a printString <= b printString ] ];
		beMultiple;
		withSmalltalkSearch;
		format: [ :each | GTObjectPrinter new asTruncatedTextFrom: each ];
		send: [ :result | 
			result isNil
				ifTrue: [ nil ]
				ifFalse: [ result size = 1
						ifTrue: [ result anyOne ]
						ifFalse: [ self species withAll: result ] ] ];
		showOnly: 50;
		helpMessage: 'Quick selection field. Given your INPUT, it executes: self select: [:each | INPUT ]'
]

{ #category : #'*moose-finder' }
MooseQueryResult >> mooseInterestingEntity [ 
	"For a group with one element,  it returns that element, instead of the group, useful in the finder to remove extra step when navigating"

	^self size = 1 
		ifTrue: [ self anyOne ] 
		ifFalse: [ self asMooseGroup ]
]
