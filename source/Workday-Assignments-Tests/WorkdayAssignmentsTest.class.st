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
