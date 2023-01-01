Class {
	#name : #WorkdayAssignmentsTest,
	#superclass : #TestCase,
	#category : #'Workday-Assignments-Tests'
}

{ #category : #accessing }
WorkdayAssignmentsTest >> employeeWorkingOnFridays [

	^ Employee
		  named: 'Luna'
		  workingOn: (Array with: (DayOfWeek on: Friday))
]

{ #category : #accessing }
WorkdayAssignmentsTest >> sundayDate [
	
	^ December twentyfifth, 2022
]

{ #category : #tests }
WorkdayAssignmentsTest >> testsA [

	self
		should: [ 
			UnavailabilityRequest
				affectingAvailabilityOf: self employeeWorkingOnFridays
				on: self sundayDate ]
		raise: InstanceCreationFailed
		withMessageText: 'El 25/12/2022 no es un día laborable de Luna.'
]
