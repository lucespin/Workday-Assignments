Class {
	#name : #UnavailabilityRequest,
	#superclass : #Object,
	#category : #'Workday-Assignments-Model'
}

{ #category : #'instance creation' }
UnavailabilityRequest class >> affectingAvailabilityOf: anEmployee on: aDate [

	self assert: anEmployee worksOn: aDate.

	^ self new initializeAffectingAvailabilityOf: anEmployee on: aDate
]

{ #category : #preconditions }
UnavailabilityRequest class >> assert: anEmployee worksOn: aDate [

	AssertionChecker
		enforce: [ anEmployee worksOn: aDate ]
		because: ('El <1s> no es un día laborable de <2s>.'
				 expandMacrosWith: aDate asString
				 with: anEmployee asString)
		raising: InstanceCreationFailed
]
