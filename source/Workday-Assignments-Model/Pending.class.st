Class {
	#name : #Pending,
	#superclass : #WorkingDateExceptionRequestState,
	#category : #'Workday-Assignments-Model'
}

{ #category : #asserting }
Pending >> approve: anUnavailabilityRequest [

	anUnavailabilityRequest changeTo: Approved new
]

{ #category : #asserting }
Pending >> deny: anUnavailabilityRequest [

	anUnavailabilityRequest changeTo: Denied new
]

{ #category : #'as yet unclassified' }
Pending >> increasesAvailability: aWorkdayExceptionRequest [

	^ false
]

{ #category : #'as yet unclassified' }
Pending >> reducesAvailability: aWorkdayExceptionRequest [

	^ false
]
