Class {
	#name : #WorkingDateExceptionRequestState,
	#superclass : #Object,
	#category : #'Workday-Assignments-Model'
}

{ #category : #'changing state' }
WorkingDateExceptionRequestState >> approve: anUnavailabilityRequest [

	self subclassResponsibility
]

{ #category : #'changing state' }
WorkingDateExceptionRequestState >> deny: anUnavailabilityRequest [

	self subclassResponsibility
]

{ #category : #testing }
WorkingDateExceptionRequestState >> increasesAvailability: aWorkdayExceptionRequest [

	^ self subclassResponsibility
]

{ #category : #testing }
WorkingDateExceptionRequestState >> reducesAvailability: aWorkdayExceptionRequest [

	^ self subclassResponsibility
]
