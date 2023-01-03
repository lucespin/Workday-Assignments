Class {
	#name : #Denied,
	#superclass : #WorkingDateExceptionRequestState,
	#category : #'Workday-Assignments-Model'
}

{ #category : #'changing state' }
Denied >> approve: anUnavailabilityRequest [

	"Do nothing."
	
]

{ #category : #'changing state' }
Denied >> deny: anUnavailabilityRequest [

	"Do nothing."
	
]

{ #category : #testing }
Denied >> increasesAvailability: aWorkdayExceptionRequest [

	^ false
]

{ #category : #testing }
Denied >> reducesAvailability: aWorkdayExceptionRequest [

	^ false
]
