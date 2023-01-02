Class {
	#name : #Denied,
	#superclass : #WorkingDateExceptionRequestState,
	#category : #'Workday-Assignments-Model'
}

{ #category : #asserting }
Denied >> approve: anUnavailabilityRequest [

	"Do nothing."
	
]

{ #category : #asserting }
Denied >> deny: anUnavailabilityRequest [

	"Do nothing."
	
]

{ #category : #'as yet unclassified' }
Denied >> increasesAvailability: aWorkdayExceptionRequest [

	^ false
]

{ #category : #'as yet unclassified' }
Denied >> reducesAvailability: aWorkdayExceptionRequest [

	^ false
]
