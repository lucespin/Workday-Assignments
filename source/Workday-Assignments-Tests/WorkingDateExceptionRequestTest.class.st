Class {
	#name : #WorkingDateExceptionRequestTest,
	#superclass : #TestCase,
	#category : #'Workday-Assignments-Tests'
}

{ #category : #accessing }
WorkingDateExceptionRequestTest >> employeeWorkingOn: aDay [

	^ Employee
		  named: 'Luna'
		  workingOn: (Array with: (DayOfWeek on: aDay))
]

{ #category : #accessing }
WorkingDateExceptionRequestTest >> employeeWorkingOnFridays [

	^ self employeeWorkingOn: Friday
]

{ #category : #accessing }
WorkingDateExceptionRequestTest >> employeeWorkingOnMondays [

	^ self employeeWorkingOn: Monday
]

{ #category : #accessing }
WorkingDateExceptionRequestTest >> fridayDate [

	^ January sixth, 2023
]

{ #category : #accessing }
WorkingDateExceptionRequestTest >> sundayDate [

	^ December twentyfifth, 2022
]

{ #category : #tests }
WorkingDateExceptionRequestTest >> testADeniedWorkingDateExceptionRequestIncreasingAvailabilityDoesNotChangeEmployeeAvailability [

	| employee date request |
	
	employee := self employeeWorkingOnMondays.
	date := self fridayDate.
	request := WorkingDateExceptionRequest
		           increasingAvailabilityOf: employee
		           on: date.
	request deny.

	self
		deny: (request makesUnavailableTo: employee on: date);
		deny: (request makesAvailableEmployeeOn: date)
]

{ #category : #tests }
WorkingDateExceptionRequestTest >> testADeniedWorkingDateExceptionRequestReducingAvailabilityDoesNotChangeEmployeeAvailability [

	| employee date request |
	
	employee := self employeeWorkingOnFridays.
	date := self fridayDate.
	request := WorkingDateExceptionRequest
		           reducingAvailabilityOf: employee
		           on: date.
	request deny.

	self
		deny: (request makesUnavailableTo: employee on: date);
		deny: (request makesAvailableEmployeeOn: date)
]

{ #category : #tests }
WorkingDateExceptionRequestTest >> testAPendingWorkingDateExceptionRequestIncreasingAvailabilityDoesNotChangeAnEmployeeAvailability [

	| employee date request |
	
	employee := self employeeWorkingOnMondays.
	date := self fridayDate.
	request := WorkingDateExceptionRequest
		           increasingAvailabilityOf: employee
		           on: date.

	self
		deny: (request makesUnavailableTo: employee on: date);
		deny: (request makesAvailableEmployeeOn: date)
		
]

{ #category : #tests }
WorkingDateExceptionRequestTest >> testAPendingWorkingDateExceptionRequestReducingAvailabilityDoesNotChangeAnEmployeeAvailability [

	| employee date request |
	
	employee := self employeeWorkingOnFridays.
	date := self fridayDate.
	request := WorkingDateExceptionRequest
		           reducingAvailabilityOf: employee
		           on: date.

	self
		deny: (request makesUnavailableTo: employee on: date);
		deny: (request makesAvailableEmployeeOn: date)
]

{ #category : #tests }
WorkingDateExceptionRequestTest >> testAWorkingDateExceptionRequestIncreasingAvailabilityMustBeForNonEmployeeWorkday [

	self
		should: [ 
			WorkingDateExceptionRequest
				increasingAvailabilityOf: self employeeWorkingOnFridays
				on: self fridayDate ]
		raise: InstanceCreationFailed
		withMessageText: 'El 6/1/2023 ya es un día laborable de Luna.'
]

{ #category : #tests }
WorkingDateExceptionRequestTest >> testAWorkingDateExceptionRequestReducingAvailabilityMustBeForAnEmployeeWorkday [

	self
		should: [ 
			WorkingDateExceptionRequest
				reducingAvailabilityOf: self employeeWorkingOnFridays
				on: self sundayDate ]
		raise: InstanceCreationFailed
		withMessageText: 'El 25/12/2022 no es un día laborable de Luna.'
]

{ #category : #tests }
WorkingDateExceptionRequestTest >> testAnApprovedWorkingDateExceptionRequestIncreasingAvailabilityMakesAvailableToAnEmployeeOnNonWorkday [

	| employee date request |
	
	employee := self employeeWorkingOnMondays.
	date := self fridayDate.
	request := WorkingDateExceptionRequest
		           increasingAvailabilityOf: employee
		           on: date.
	request approve.

	self
		assert: (request makesAvailableEmployeeOn: date);
		deny: (request makesUnavailableTo: employee on: date)
]

{ #category : #tests }
WorkingDateExceptionRequestTest >> testAnApprovedWorkingDateExceptionRequestThatReducesAvailabilityMakesUnavailableToAnEmployeeOnWorkday [

	| employee date request |
	
	employee := self employeeWorkingOnFridays.
	date := self fridayDate.
	request := WorkingDateExceptionRequest
		           reducingAvailabilityOf: employee
		           on: date.
	request approve.

	self
		assert: (request makesUnavailableTo: employee on: date);
		deny: (request makesAvailableEmployeeOn: date)
]
