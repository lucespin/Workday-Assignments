Class {
	#name : #Availability,
	#superclass : #Object,
	#category : #'Workday-Assignments-Model'
}

{ #category : #'instance creation' }
Availability class >> on: aDayOrDate [

	^ self subclassResponsibility
]

{ #category : #testing }
Availability >> satisfies: aDate [

	^ self subclassResponsibility
]
