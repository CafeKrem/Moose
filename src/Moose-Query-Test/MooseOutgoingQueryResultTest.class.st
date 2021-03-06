Class {
	#name : #MooseOutgoingQueryResultTest,
	#superclass : #MooseQueryResultTest,
	#category : #'Moose-Query-Test'
}

{ #category : #asserting }
MooseOutgoingQueryResultTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #helper }
MooseOutgoingQueryResultTest >> actualClass [
	^ MooseOutgoingQueryResult
]

{ #category : #tests }
MooseOutgoingQueryResultTest >> testWithoutSelfLoops [
	| model namespace1 namespace2 class1 class2 |
	model := MooseModel new.
	namespace1 := (FAMIXNamespace named: 'namespace1')
		mooseModel: model;
		yourself.
	namespace2 := (FAMIXNamespace named: 'namespace2')
		mooseModel: model;
		parentScope: namespace1;
		yourself.
	class1 := (FAMIXClass named: 'class1')
		mooseModel: model;
		container: namespace2;
		yourself.
	class2 := (FAMIXClass named: 'class2')
		mooseModel: model;
		container: namespace2;
		yourself.
	FAMIXInheritance new
		mooseModel: model;
		superclass: class1;
		subclass: class2.
	self assert: (namespace1 queryOutgoing: FAMIXInheritance) size equals: 1.
	self assert: (namespace1 queryOutgoing: FAMIXInheritance) withoutSelfLoops isEmpty
]
