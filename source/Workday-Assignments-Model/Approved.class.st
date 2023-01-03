Class {
	#name : #Approved,
	#superclass : #WorkingDateExceptionRequestState,
	#category : #'Workday-Assignments-Model'
}

{ #category : #'changing state' }
Approved >> approve: anUnavailabilityRequest [

	"Do nothing."
	
]

{ #category : #'changing state' }
Approved >> deny: anUnavailabilityRequest [

	"Do nothing."
	
]

{ #category : #testing }
Approved >> increasesAvailability: aWorkdayExceptionRequest [

	^ aWorkdayExceptionRequest increasesAvailability
]

{ #category : #testing }
Approved >> reducesAvailability: aWorkdayExceptionRequest [

	^ (self increasesAvailability: aWorkdayExceptionRequest) not
]
