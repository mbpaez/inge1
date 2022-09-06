!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'mbp 9/6/2022 11:48:48'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	self check:[customerBook addCustomerNamed:  'John Lennon'] tookLessThan:100* millisecond.
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'mbp 9/6/2022 12:07:20'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	  
	self check:[customerBook removeCustomerNamed: paulMcCartney] tookLessThan:100* millisecond.
	
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'mbp 9/6/2022 15:47:54'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	self assertThat: [customerBook addCustomerNamed: ''.] 
	      getsSignal: Error 
	      andCheckThat: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]
	! !

!CustomerBookTest methodsFor: 'testing' stamp: 'mbp 9/6/2022 15:47:54'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self assertThat: [ customerBook removeCustomerNamed: 'Paul McCartney']
	      getsSignal: NotFound 
	      andCheckThat: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'mbp 9/6/2022 13:01:32'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	self in: customerBook addAndSuspend: paulMcCartney.
	
	self assertThatIn: customerBook 
		theAmountOfActiveCustomersIs: 0 
		theAmountOfSuspendedCustomersIs: 1 
		theAmountOfCustomersIs: 1
		andAssertThat: paulMcCartney isIncluded: True. 
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'mbp 9/6/2022 13:01:32'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	self in: customerBook addAndSuspend: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assertThatIn: customerBook 
		theAmountOfActiveCustomersIs: 0 
		theAmountOfSuspendedCustomersIs: 0 
		theAmountOfCustomersIs: 0
		andAssertThat: paulMcCartney isIncluded: False. 


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'mbp 9/6/2022 16:01:42'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self assertThatIn: customerBook thisPersonCouldNotBeSuspended: 'George Harrison' thisPersonIsTheOnlyIncluded: johnLennon.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'mbp 9/6/2022 16:01:42'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	self in: customerBook addAndSuspend: johnLennon.
	
	self assertThatIn: customerBook thisPersonCouldNotBeSuspended: johnLennon thisPersonIsTheOnlyIncluded: johnLennon.
! !


!CustomerBookTest methodsFor: 'abstractions' stamp: 'mbp 9/6/2022 15:47:54'!
assertThat: tryClosure getsSignal: aSignal andCheckThat: consecuenceClosure

	[ tryClosure value.
	self fail ]
		on: aSignal 
		do: consecuenceClosure ! !

!CustomerBookTest methodsFor: 'abstractions' stamp: 'mbp 9/6/2022 12:29:44'!
assertThatIn: aCustomerBook theAmountOfActiveCustomersIs: amountOfActiveCustomers theAmountOfSuspendedCustomersIs: amountOfSuspendedCustomers theAmountOfCustomersIs: amountOfCustomers andAssertThat: aPerson isIncluded: aBoolean

	self assert: amountOfActiveCustomers equals: aCustomerBook numberOfActiveCustomers.
	self assert: amountOfSuspendedCustomers equals: aCustomerBook numberOfSuspendedCustomers.
	self assert: amountOfCustomers equals: aCustomerBook numberOfCustomers.
	aBoolean = True ifTrue: [
		self assert: (aCustomerBook includesCustomerNamed: aPerson)].
	aBoolean = False ifTrue: [
		self deny: (aCustomerBook includesCustomerNamed: aPerson).]! !

!CustomerBookTest methodsFor: 'abstractions' stamp: 'mbp 9/6/2022 16:01:42'!
assertThatIn: aCustomerBook thisPersonCouldNotBeSuspended: aPersonToTryToSuspend thisPersonIsTheOnlyIncluded: aPersonInTheCustomerBook
	self assertThat: [ aCustomerBook suspendCustomerNamed: aPersonToTryToSuspend]
		      getsSignal: CantSuspend 
		      andCheckThat: [ :anError |  
				self assert: aCustomerBook numberOfCustomers = 1.
				self assert: (aCustomerBook includesCustomerNamed: aPersonInTheCustomerBook) ]! !

!CustomerBookTest methodsFor: 'abstractions' stamp: 'mbp 9/6/2022 11:51:02'!
check: checkClosure tookLessThan: timeWithUnit

	| millisecondsAfterRunning millisecondsBeforeRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	checkClosure value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (timeWithUnit)! !

!CustomerBookTest methodsFor: 'abstractions' stamp: 'mbp 9/6/2022 13:01:32'!
in: aCustomerBook addAndSuspend: aPerson
	aCustomerBook addCustomerNamed: aPerson.
	aCustomerBook suspendCustomerNamed: aPerson.! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 9/17/2020 07:23:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'abstractions' stamp: 'mbp 9/6/2022 15:41:49'!
from: aListOfCustomers tryToRemove: aName 
	1 to: aListOfCustomers size do: 
		[ :index |
			aName = (aListOfCustomers at: index)
				ifTrue: [
					aListOfCustomers removeAt: index.
					^True
				] 
		].
	^False.! !


!CustomerBook methodsFor: 'customer management' stamp: 'mbp 9/6/2022 14:49:53'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'mbp 9/6/2022 14:51:42'!
numberOfCustomers
	
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers.! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'mbp 9/6/2022 15:42:05'!
removeCustomerNamed: aName 

 	(self from: active tryToRemove: aName) ifTrue:[^aName].
	
 	(self from: suspended tryToRemove: aName) ifTrue:[^aName].
	
	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/11/2022 07:18:12'!
customerAlreadyExistsErrorMessage

	^'Customer already exists!!!!!!'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/11/2022 07:18:16'!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty!!!!!!'! !
