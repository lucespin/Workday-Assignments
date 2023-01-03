Class {
	#name : #WorkAvailabilityGuideTest,
	#superclass : #TestCase,
	#instVars : [
		'employeeRepository',
		'requestRepository',
		'workAvailabilityGuide',
		'employeeWorkingOnFridays',
		'anotherEmployeeWorkingOnFridays'
	],
	#category : #'Workday-Assignments-Tests'
}

{ #category : #accessing }
WorkAvailabilityGuideTest >> christmas [

	^ December twentyfifth, 2022
]

{ #category : #accessing }
WorkAvailabilityGuideTest >> fridayDate [

	^ January sixth, 2023
]

{ #category : #running }
WorkAvailabilityGuideTest >> setUp [

	super setUp.
	self setUpEmployees.
	employeeRepository := EmployeeRepository new.
	requestRepository := WorkingDateExceptionRequestRepository new.
	workAvailabilityGuide := WorkAvailabilityGuide
		                         queryingEmployeesFrom: employeeRepository
		                         andRequestsFrom: requestRepository
]

{ #category : #running }
WorkAvailabilityGuideTest >> setUpEmployees [

	employeeWorkingOnFridays := 
		Employee
			named: 'Juan'
		  	workingOn: (Array with: (DayOfWeek on: Friday)).
				
	anotherEmployeeWorkingOnFridays := 
		Employee 
			named: 'Alba' 
			workingOn: (Array with: (DayOfWeek on: Friday))
]

{ #category : #'test support' }
WorkAvailabilityGuideTest >> startManagingAnotherEmployeeWorkingOnFridays [

	employeeRepository startManaging: anotherEmployeeWorkingOnFridays
]

{ #category : #'test support' }
WorkAvailabilityGuideTest >> startManagingApprovedRequestIncreasingAvailabilityOf: anEmployee on: aDate [

	requestRepository startManaging: (
		WorkingDateExceptionRequest
			 increasingAvailabilityOf: anEmployee
			 on: aDate) approve
]

{ #category : #'test support' }
WorkAvailabilityGuideTest >> startManagingApprovedRequestReducingAvailabilityOf: anEmployee on: aDate [

	requestRepository startManaging: (
		WorkingDateExceptionRequest
			 reducingAvailabilityOf: anEmployee
			 on: aDate) approve
]

{ #category : #'test support' }
WorkAvailabilityGuideTest >> startManagingEmployeeWorkingOnFridays [
	
	employeeRepository startManaging: employeeWorkingOnFridays
]

{ #category : #tests }
WorkAvailabilityGuideTest >> testA [

	self startManagingEmployeeWorkingOnFridays.

	self
		withTheOnlyOneIn:
			(workAvailabilityGuide availableEmployeesOn: self fridayDate)
		do: [ :availableEmployee | 
			self assert: availableEmployee equals: employeeWorkingOnFridays ]
]

{ #category : #tests }
WorkAvailabilityGuideTest >> testB [

	self startManagingEmployeeWorkingOnFridays.
	self startManagingAnotherEmployeeWorkingOnFridays.

	self
		assertCollection:
			(workAvailabilityGuide availableEmployeesOn: self fridayDate)
		hasSameElements: (
			Array
				 with: employeeWorkingOnFridays
				 with: anotherEmployeeWorkingOnFridays)
]

{ #category : #tests }
WorkAvailabilityGuideTest >> testC [

	self startManagingEmployeeWorkingOnFridays.
	self
		startManagingApprovedRequestReducingAvailabilityOf:
			employeeWorkingOnFridays
		on: self fridayDate.

	self
		assertEmpty: 
			(workAvailabilityGuide availableEmployeesOn: self fridayDate)
]

{ #category : #tests }
WorkAvailabilityGuideTest >> testD [

	self startManagingEmployeeWorkingOnFridays.
	self
		startManagingApprovedRequestIncreasingAvailabilityOf:
			employeeWorkingOnFridays
		on: self christmas.

	self
		withTheOnlyOneIn:
			(workAvailabilityGuide availableEmployeesOn: self christmas)
		do: [ :availableEmployee | 
			availableEmployee = employeeWorkingOnFridays ]
]
