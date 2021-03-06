Class {
	#name : #FamixJavaInheritance,
	#superclass : #FamixJavaAssociation,
	#traits : 'FamixTInheritanceGlue + FamixTSubInheritance + FamixTSuperInheritance',
	#classTraits : 'FamixTInheritanceGlue classTrait + FamixTSubInheritance classTrait + FamixTSuperInheritance classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaInheritance class >> annotation [

	<MSEClass: #Inheritance super: #FamixJavaAssociation>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixJavaInheritance class >> generatedSlotNames [
	<generated>
	'FamixJavaInheritance class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixJavaInheritance class >> generatedTraitNames [
	<generated>
	^ #(FamixTInheritanceGlue FamixTSubInheritance FamixTSuperInheritance)
]

{ #category : #meta }
FamixJavaInheritance class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'as yet unclassified' }
FamixJavaInheritance >> accept: aVisitor [

	aVisitor visitInheritance: self
]

{ #category : #'as yet unclassified' }
FamixJavaInheritance >> copyFrom: anEntity within: aVisitor [

	super copyFrom: anEntity within: aVisitor.
	self superclass: (aVisitor visit: anEntity superclass).
	self subclass: (aVisitor visit: anEntity subclass).
]

{ #category : #'as yet unclassified' }
FamixJavaInheritance >> historicalUniqueName [
	
	^(self subclass mooseName , '->' , self superclass mooseName) asSymbol
]

{ #category : #'as yet unclassified' }
FamixJavaInheritance >> mooseNameOn: aStream [
	self subclass ifNotNil: [ aStream nextPutAll: self subclass name ].
	aStream nextPutAll: ' -> '.
	self superclass ifNotNil: [ aStream nextPutAll: self superclass name ]
]

{ #category : #'as yet unclassified' }
FamixJavaInheritance >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' (Inheritance)'
]
