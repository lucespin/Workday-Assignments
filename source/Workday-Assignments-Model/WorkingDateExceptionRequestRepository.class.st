Class {
	#name : #WorkingDateExceptionRequestRepository,
	#superclass : #Object,
	#instVars : [
		'requests'
	],
	#category : #'Workday-Assignments-Model'
}

{ #category : #asserting }
WorkingDateExceptionRequestRepository >> assertNotManaged: aWorkingDateExceptionRequest [

	AssertionChecker
		refuse: [ requests includes: aWorkingDateExceptionRequest ]
		because:
			('El pedido de excepción <1s> ya fue dado de alta.' 
				 expandMacrosWith: aWorkingDateExceptionRequest asString)
		raising: ObjectAlreadyManaged
]

{ #category : #querying }
WorkingDateExceptionRequestRepository >> availableByRequestEmployeesOn: aDate [

	| makingAvailableRequests |
	makingAvailableRequests := requests select: [ :request | 
		                           request makesAvailableEmployeeOn: aDate ].

	^ makingAvailableRequests collect: [ :request | request employee ]
]

{ #category : #initialization }
WorkingDateExceptionRequestRepository >> initialize [

	requests := OrderedCollection new
]

{ #category : #querying }
WorkingDateExceptionRequestRepository >> isUnavailableByRequest: anEmployee on: aDate [

	^ requests anySatisfy: [ :request | 
		  request makesUnavailableTo: anEmployee on: aDate ]
]

{ #category : #managing }
WorkingDateExceptionRequestRepository >> startManaging: aRequest [

	self assertNotManaged: aRequest.
	
	requests add: aRequest
]
