Extension { #name : #FixedDate }

{ #category : #'*Workday-Assignments-Model' }
FixedDate >> printOn: aStream [

	self dayNumber printOn: aStream.
	aStream nextPut: $/.
	self month number printOn: aStream.
	aStream nextPut: $/.
	self year number printOn: aStream
]
