Class {
	#name : #WorkingDateExceptionRequest,
	#superclass : #Object,
	#instVars : [
		'employee',
		'date',
		'state',
		'increasesAvailability'
	],
	#category : #'Workday-Assignments-Model'
}

{ #category : #preconditions }
WorkingDateExceptionRequest class >> assert: anEmployee doesNotWorkOn: aDate [

	AssertionChecker
		refuse: [ anEmployee worksOn: aDate ]
		because: ('El <1s> ya es un día laborable de <2s>.'
				 expandMacrosWith: aDate asString
				 with: anEmployee asString)
		raising: InstanceCreationFailed
]

{ #category : #preconditions }
WorkingDateExceptionRequest class >> assert: anEmployee worksOn: aDate [

	AssertionChecker
		enforce: [ anEmployee worksOn: aDate ]
		because: ('El <1s> no es un día laborable de <2s>.'
				 expandMacrosWith: aDate asString
				 with: anEmployee asString)
		raising: InstanceCreationFailed
]

{ #category : #'instance creation' }
WorkingDateExceptionRequest class >> increasingAvailability: aBoolean of: anEmployee on: aDate [

	^ self new
		  initializeIncreasingAvailability: aBoolean
		  of: anEmployee
		  on: aDate
]

{ #category : #'instance creation' }
WorkingDateExceptionRequest class >> increasingAvailabilityOf: anEmployee on: aDate [

	self assert: anEmployee doesNotWorkOn: aDate.

	^ self increasingAvailability: true of: anEmployee on: aDate
]

{ #category : #'instance creation' }
WorkingDateExceptionRequest class >> reducingAvailabilityOf: anEmployee on: aDate [

	self assert: anEmployee worksOn: aDate.

	^ self increasingAvailability: false of: anEmployee on: aDate
]

{ #category : #'changing state' }
WorkingDateExceptionRequest >> approve [

	state approve: self
]

{ #category : #'changing state' }
WorkingDateExceptionRequest >> changeTo: aState [

	state := aState
]

{ #category : #'changing state' }
WorkingDateExceptionRequest >> deny [

	state deny: self
]

{ #category : #accessing }
WorkingDateExceptionRequest >> employee [

	^ employee
]

{ #category : #testing }
WorkingDateExceptionRequest >> increasesAvailability [

	^ increasesAvailability
]

{ #category : #initialization }
WorkingDateExceptionRequest >> initializeIncreasingAvailability: aBoolean of: anEmployee on: aDate [

	increasesAvailability := aBoolean.
	employee := anEmployee.
	date := aDate.
	state := Pending new
]

{ #category : #testing }
WorkingDateExceptionRequest >> isRelatedTo: anEmployee on: aDate [

	^ anEmployee = employee and: [ aDate = date ]
]

{ #category : #testing }
WorkingDateExceptionRequest >> makesAvailableEmployeeOn: aDate [

	^ aDate = date and: [ state increasesAvailability: self ]
]

{ #category : #testing }
WorkingDateExceptionRequest >> makesUnavailableTo: anEmployee on: aDate [

	^ (self isRelatedTo: anEmployee on: aDate) and: [ 
		  state reducesAvailability: self ]
]
