Class {
	#name : #WorkAvailabilityGuide,
	#superclass : #Object,
	#instVars : [
		'employeeRepository',
		'requestRepository'
	],
	#category : #'Workday-Assignments-Model'
}

{ #category : #'instance creation' }
WorkAvailabilityGuide class >> queryingEmployeesFrom: anEmployeeRepository andRequestsFrom: aRequestRepository [

	^ self new
		  initializeQueryingEmployeesFrom: anEmployeeRepository
		  andRequestsFrom: aRequestRepository
]

{ #category : #querying }
WorkAvailabilityGuide >> availableEmployeesOn: aDate [

	^ ((employeeRepository employeesWorkingOn: aDate)
		  reject: [ :employee | 
			  requestRepository isUnavailableByRequest: employee on: aDate ])
		  addAll: (requestRepository availableByRequestEmployeesOn: aDate);
		  yourself
]

{ #category : #initialization }
WorkAvailabilityGuide >> initializeQueryingEmployeesFrom: anEmployeeRepository andRequestsFrom: aRequestRepository [

	employeeRepository := anEmployeeRepository.
	requestRepository := aRequestRepository
]
