Class {
	#name : #Pending,
	#superclass : #WorkingDateExceptionRequestState,
	#category : #'Workday-Assignments-Model'
}

{ #category : #'changing state' }
Pending >> approve: anUnavailabilityRequest [

	anUnavailabilityRequest changeTo: Approved new
]

{ #category : #'changing state' }
Pending >> deny: anUnavailabilityRequest [

	anUnavailabilityRequest changeTo: Denied new
]

{ #category : #testing }
Pending >> increasesAvailability: aWorkdayExceptionRequest [

	^ false
]

{ #category : #testing }
Pending >> reducesAvailability: aWorkdayExceptionRequest [

	^ false
]
