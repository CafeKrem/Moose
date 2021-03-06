Class {
	#name : #FamixJavaReference,
	#superclass : #FamixJavaAssociation,
	#traits : 'FamixTReference',
	#classTraits : 'FamixTReference classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaReference class >> annotation [

	<MSEClass: #Reference super: #FamixJavaAssociation>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixJavaReference class >> generatedSlotNames [
	<generated>
	'FamixJavaReference class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixJavaReference class >> generatedTraitNames [
	<generated>
	^ #(FamixTReference)
]

{ #category : #meta }
FamixJavaReference class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'as yet unclassified' }
FamixJavaReference >> accept: aVisitor [

	aVisitor visitReference: self
]

{ #category : #'as yet unclassified' }
FamixJavaReference >> copyFrom: anEntity within: aVisitor [

	super copyFrom: anEntity within: aVisitor.
	self source: (aVisitor visit: anEntity source).
	self target: (aVisitor visit: anEntity target).
]

{ #category : #'as yet unclassified' }
FamixJavaReference >> mooseNameOn: aStream [
	"aStream nextPutAll: 'Reference'."

	self from ifNotNil: [ aStream nextPutAll: self from name ].
	aStream nextPutAll: ' refers to '.
	self to ifNotNil: [ aStream nextPutAll: self to name ]
]

{ #category : #'as yet unclassified' }
FamixJavaReference >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' (Reference)'
]
