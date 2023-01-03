Class {
	#name : #WorkAvailabilityGuideTest,
	#superclass : #TestCase,
	#instVars : [
		'employeeRepository',
		'requestRepository',
		'workAvailabilityGuide',
		'employeeWorkingOnFridays',
		'anotherEmployeeWorkingOnFridays',
		'employeeWorkingOnWeekends',
		'employeeWorkingOnChristmas'
	],
	#category : #'Workday-Assignments-Tests'
}

{ #category : #accessing }
WorkAvailabilityGuideTest >> anotherEmployeeWorkingOnFridays [

	^ Employee
		  named: 'Alba'
		  workingOn: (Array with: (DayOfWeek on: Friday))
]

{ #category : #accessing }
WorkAvailabilityGuideTest >> christmas [

	^ December twentyfifth, 2022
]

{ #category : #accessing }
WorkAvailabilityGuideTest >> employeeWorkingOnChristmas [

	^ Employee
		  named: 'Benjamín'
		  workingOn: (Array with: (SpecificDate on: self christmas))
]

{ #category : #accessing }
WorkAvailabilityGuideTest >> employeeWorkingOnFridays [

	^ Employee
		  named: 'Dante'
		  workingOn: (Array with: (DayOfWeek on: Friday))
]

{ #category : #accessing }
WorkAvailabilityGuideTest >> employeeWorkingOnWeekends [

	^ Employee
		  named: 'Renata'
		  workingOn:
		  	(Array 
				with: (DayOfWeek on: Saturday) 
				with: (DayOfWeek on: Sunday))
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

	employeeWorkingOnFridays := self employeeWorkingOnFridays.
	anotherEmployeeWorkingOnFridays := self anotherEmployeeWorkingOnFridays.
	employeeWorkingOnWeekends := self employeeWorkingOnWeekends.
	employeeWorkingOnChristmas := self employeeWorkingOnChristmas
]

{ #category : #'test support' }
WorkAvailabilityGuideTest >> startManagingAndApprove: aWorkingDateExceptionRequest [

	self startManagingRequest: aWorkingDateExceptionRequest.

	aWorkingDateExceptionRequest approve
]

{ #category : #'test support' }
WorkAvailabilityGuideTest >> startManagingAndApproveRequestIncreasingAvailabilityOf: anEmployee on: aDate [

	| request |
	
	request := WorkingDateExceptionRequest
		           increasingAvailabilityOf: anEmployee
		           on: aDate.

	self startManagingAndApprove: request
]

{ #category : #'test support' }
WorkAvailabilityGuideTest >> startManagingAndApproveRequestReducingAvailabilityOf: anEmployee on: aDate [

	| request |
	
	request := WorkingDateExceptionRequest
		           reducingAvailabilityOf: anEmployee
		           on: aDate.

	self startManagingAndApprove: request
]

{ #category : #'test support' }
WorkAvailabilityGuideTest >> startManagingAndDeny: aWorkingDateExceptionRequest [

	self startManagingRequest: aWorkingDateExceptionRequest.

	aWorkingDateExceptionRequest deny
]

{ #category : #'test support' }
WorkAvailabilityGuideTest >> startManagingAndDenyRequestIncreasingAvailabilityOf: anEmployee on: aDate [

	| request |
	
	request := WorkingDateExceptionRequest
		           increasingAvailabilityOf: anEmployee
		           on: aDate.

	self startManagingAndDeny: request
]

{ #category : #'test support' }
WorkAvailabilityGuideTest >> startManagingAndDenyRequestReducingAvailabilityOf: anEmployee on: aDate [

	| request |
	
	request := WorkingDateExceptionRequest
		           reducingAvailabilityOf: anEmployee
		           on: aDate.

	self startManagingAndDeny: request
]

{ #category : #'test support' }
WorkAvailabilityGuideTest >> startManagingEmployee: anEmployee [

	employeeRepository startManaging: anEmployee
]

{ #category : #'test support' }
WorkAvailabilityGuideTest >> startManagingRequest: aWorkingDateExceptionRequest [

	requestRepository startManaging: aWorkingDateExceptionRequest
]

{ #category : #tests }
WorkAvailabilityGuideTest >> test01HavingAnEmployeeWorkingOnFridaysWithoutExceptionRequestsThenIsTheOnlyOneAvailableOnFridayDate [

	self startManagingEmployee: employeeWorkingOnFridays.

	self
		withTheOnlyOneIn:
			(workAvailabilityGuide availableEmployeesOn: self fridayDate)
		do: [ :availableEmployee | 
			self assert: availableEmployee equals: employeeWorkingOnFridays ]
]

{ #category : #tests }
WorkAvailabilityGuideTest >> test02HavingOnlyOneEmployeeWithApprovedExceptionToNotWorkOnADateThenThereAreNoAvailableEmployeesOnThatDate [

	self startManagingEmployee: employeeWorkingOnFridays.
	self
		startManagingAndApproveRequestReducingAvailabilityOf:
			employeeWorkingOnFridays
		on: self fridayDate.

	self
		assertEmpty: 
			(workAvailabilityGuide availableEmployeesOn: self fridayDate)
]

{ #category : #tests }
WorkAvailabilityGuideTest >> test03HavingOnlyOneEmployeeWithApprovedExceptionToWorkOnADateThenIsTheOnlyOneAvailableOnThatDate [

	self startManagingEmployee: employeeWorkingOnFridays.
	self
		startManagingAndApproveRequestIncreasingAvailabilityOf:
			employeeWorkingOnFridays
		on: self christmas.

	self
		withTheOnlyOneIn:
			(workAvailabilityGuide availableEmployeesOn: self christmas)
		do: [ :availableEmployee | 
			availableEmployee = employeeWorkingOnFridays ]
]

{ #category : #tests }
WorkAvailabilityGuideTest >> test04HavingEmployeesWorkingOnFridaysWithoutExceptionRequestsThenThereAreAllAvailableOnFridayDate [

	self startManagingEmployee: employeeWorkingOnFridays.
	self startManagingEmployee: anotherEmployeeWorkingOnFridays.

	self
		assertCollection:
			(workAvailabilityGuide availableEmployeesOn: self fridayDate)
		hasSameElements: (
			Array
				 with: employeeWorkingOnFridays
				 with: anotherEmployeeWorkingOnFridays)
]

{ #category : #tests }
WorkAvailabilityGuideTest >> test05HavingAnEmployeeWithExceptionToWorkOnADateAndOthersEmployeesWorkingOnTheSameThenThereAreAllAvailableOnThatDate [

	self test03HavingOnlyOneEmployeeWithApprovedExceptionToWorkOnADateThenIsTheOnlyOneAvailableOnThatDate.
	self startManagingEmployee: employeeWorkingOnWeekends.
	self startManagingEmployee: employeeWorkingOnChristmas.

	self
		assertCollection:
		(workAvailabilityGuide availableEmployeesOn: self christmas)
		hasSameElements: (Array
				 with: employeeWorkingOnFridays
				 with: employeeWorkingOnWeekends
				 with: employeeWorkingOnChristmas)
]

{ #category : #tests }
WorkAvailabilityGuideTest >> test06AvailableEmployeesOnADateHavingAStrongMixOfEmployeesAndWorkingDateExceptions [

	self test05HavingAnEmployeeWithExceptionToWorkOnADateAndOthersEmployeesWorkingOnTheSameThenThereAreAllAvailableOnThatDate.
	self 	startManagingAndApproveRequestReducingAvailabilityOf:
				employeeWorkingOnWeekends
			on: self christmas.
	self startManagingAndDenyRequestReducingAvailabilityOf: 
				employeeWorkingOnChristmas 
			on: self christmas.
	self startManagingAndDenyRequestIncreasingAvailabilityOf:
				anotherEmployeeWorkingOnFridays
			on: self christmas.

	self
		assertCollection:
			(workAvailabilityGuide availableEmployeesOn: self christmas)
		hasSameElements: (Array
				 with: employeeWorkingOnFridays
				 with: employeeWorkingOnChristmas)
]
