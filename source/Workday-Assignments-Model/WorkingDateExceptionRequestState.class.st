Class {
	#name : #WorkingDateExceptionRequestState,
	#superclass : #Object,
	#category : #'Workday-Assignments-Model'
}

{ #category : #asserting }
WorkingDateExceptionRequestState >> approve: anUnavailabilityRequest [

	self subclassResponsibility
]

{ #category : #asserting }
WorkingDateExceptionRequestState >> deny: anUnavailabilityRequest [

	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
WorkingDateExceptionRequestState >> increasesAvailability: aWorkdayExceptionRequest [

	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
WorkingDateExceptionRequestState >> reducesAvailability: aWorkdayExceptionRequest [

	^ self subclassResponsibility
]
