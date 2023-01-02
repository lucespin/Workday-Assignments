Class {
	#name : #Approved,
	#superclass : #WorkingDateExceptionRequestState,
	#category : #'Workday-Assignments-Model'
}

{ #category : #asserting }
Approved >> approve: anUnavailabilityRequest [

	"Do nothing."
	
]

{ #category : #asserting }
Approved >> deny: anUnavailabilityRequest [

	"Do nothing."
	
]

{ #category : #'as yet unclassified' }
Approved >> increasesAvailability: aWorkdayExceptionRequest [

	^ aWorkdayExceptionRequest increasesAvailability
]

{ #category : #'as yet unclassified' }
Approved >> reducesAvailability: aWorkdayExceptionRequest [

	^ (self increasesAvailability: aWorkdayExceptionRequest) not
]
