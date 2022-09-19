!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 9/16/2021 17:40:17'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'firstSomething'.
	secondPushedObject := 'secondSomething'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'assert messages' stamp: 'mbp 9/18/2022 23:36:57'!
assertThatACollection: aCollection equalsTo: collectionExpected
	self assert: aCollection = collectionExpected		! !

!SentenceFinderByPrefixTest methodsFor: 'assert messages' stamp: 'mbp 9/18/2022 23:44:42'!
assertThatTheStack: aStack keepsSize: sizeNumber andTopElement: topElement 
	self assert: (aStack size = sizeNumber and:[aStack top = topElement]).! !


!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'mbp 9/19/2022 00:21:06'!
test01EmptyStackFindsNoCoincidences
	|aStack|
	aStack := OOStack new.
	self assert: (SentenceFinderByPrefix new findSequencesWithPrefix: 'hola' fromAStack:aStack) isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'mbp 9/19/2022 00:21:06'!
test02StackWithOneElementFindsACoincidence
	|aStack collection element|
	element := 'hola'.
	aStack := OOStack new.
	aStack push: element.
	collection := SentenceFinderByPrefix new findSequencesWithPrefix: element fromAStack:aStack.
	
	self assert: collection = (OrderedCollection with: element).
	self assertThatTheStack: aStack keepsSize: 1 andTopElement: element.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'mbp 9/19/2022 00:21:06'!
test03StackWithOneElementFindsNoCoincidence
	|aStack collection element|
	element := 'hola'.
	aStack := OOStack new.
	aStack push: element.
	collection := SentenceFinderByPrefix new findSequencesWithPrefix: 'chau' fromAStack:aStack.
	
	self assert: collection isEmpty.
	self assertThatTheStack: aStack keepsSize: 1 andTopElement: element.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'mbp 9/19/2022 00:21:07'!
test04StackWithMultipleElementsFindsSomeCoincidences
	|aStack collection|
	aStack := OOStack new.
	aStack push: 'hola como te va'.
	aStack push: 'hola'.
	aStack push: 'hola buen dia'.
	aStack push: 'chau'.
	aStack push: 'buenas noches'.
	aStack push: 'holaa'.
	collection := SentenceFinderByPrefix new findSequencesWithPrefix: 'hola' fromAStack:aStack.
	
	self assert: collection = (OrderedCollection with: 'hola como te va' with: 'hola' with: 'hola buen dia' with: 'holaa').
	self assertThatTheStack: aStack keepsSize: 6 andTopElement: 'holaa'.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'mbp 9/19/2022 00:21:07'!
test05StackWithMultipleElementsFindsNoCoincidence
	|aStack collection|
	aStack := OOStack new.
	aStack push: 'hola como te va'.
	aStack push: 'hola'.
	aStack push: 'hola buen dia'.
	aStack push: 'chau'.
	aStack push: 'buenas noches'.
	aStack push: 'holaa'.
	collection := SentenceFinderByPrefix new findSequencesWithPrefix: 'adios' fromAStack:aStack.

	self assert: collection isEmpty.
	self assertThatTheStack: aStack keepsSize: 6 andTopElement: 'holaa'.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'mbp 9/19/2022 00:21:06'!
test06StackWithMultipleElementsFindsNoCoincidenceWithPrefixInTheMiddle
	|aStack collection|
	aStack := OOStack new.
	aStack push: 'hola como te va'.
	aStack push: 'hola como estas'.
	collection := SentenceFinderByPrefix new findSequencesWithPrefix: 'como' fromAStack:aStack.
	
	self assert: collection isEmpty.
	self assertThatTheStack: aStack keepsSize: 2 andTopElement: 'hola como estas'.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'mbp 9/19/2022 00:21:06'!
test07StackWithMultipleElementsIsCaseSensitive
	|aStack collection|
	aStack := OOStack new.
	aStack push: 'hola como te va'.
	aStack push: 'hola'.
	aStack push: 'Hola buen dia'.
	aStack push: 'chau'.
	aStack push: 'buenas noches'.
	aStack push: 'Holaa'.
	collection := SentenceFinderByPrefix new findSequencesWithPrefix: 'Hola' fromAStack:aStack.
	
	self assert: collection = (OrderedCollection with:'Hola buen dia' with: 'Holaa').
	self assertThatTheStack: aStack keepsSize: 6 andTopElement: 'Holaa'.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'mbp 9/19/2022 00:21:07'!
test08TryToFindAnEmptyPrefix
	|aStack |
	aStack := OOStack new.
	self
		should: [SentenceFinderByPrefix new findSequencesWithPrefix: '' fromAStack:aStack ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix emptyPrefixError]! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'mbp 9/19/2022 00:21:06'!
test09TryToFindAPrefixWithAnSpace
	|aStack |
	aStack := OOStack new.
	self
		should: [SentenceFinderByPrefix new findSequencesWithPrefix: 'hola chau' fromAStack:aStack ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixIncludesAnSpaceError]! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'topElement size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'stack messages' stamp: 'mbp 9/18/2022 20:14:47'!
isEmpty
	^topElement isEmptySegunElementos: self! !

!OOStack methodsFor: 'stack messages' stamp: 'mbp 9/18/2022 20:14:48'!
pop
	^ topElement popSegunPila: self.
	! !

!OOStack methodsFor: 'stack messages' stamp: 'mbp 9/18/2022 20:14:48'!
push: anElement
	topElement := Element newWithValue: anElement andAnterior: topElement.
	self increaseSize 
	! !

!OOStack methodsFor: 'stack messages' stamp: 'mbp 9/18/2022 16:15:24'!
size
	^ size! !

!OOStack methodsFor: 'stack messages' stamp: 'mbp 9/18/2022 20:14:48'!
top
	^topElement topSegunPila: self! !


!OOStack methodsFor: 'double dispatch messages' stamp: 'mbp 9/18/2022 20:07:05'!
decreaseSize
	size := size-1! !

!OOStack methodsFor: 'double dispatch messages' stamp: 'mbp 9/18/2022 20:09:11'!
increaseSize
	size := size+1! !

!OOStack methodsFor: 'double dispatch messages' stamp: 'mbp 9/18/2022 15:56:25'!
isNotEmpty
	^false! !

!OOStack methodsFor: 'double dispatch messages' stamp: 'mbp 9/19/2022 00:02:12'!
isTrulyEmpty
	^true! !

!OOStack methodsFor: 'double dispatch messages' stamp: 'mbp 9/18/2022 16:17:25'!
popFromEmptyStack
	self error: OOStack stackEmptyErrorDescription! !

!OOStack methodsFor: 'double dispatch messages' stamp: 'fat 9/19/2022 10:40:49'!
popFromStackWithElements: theTopElement
	|elementToReturn|
	elementToReturn := self top.
	self decreaseSize.
	self replaceTopElement: theTopElement previous.
	^elementToReturn! !

!OOStack methodsFor: 'double dispatch messages' stamp: 'mbp 9/18/2022 20:15:16'!
replaceTopElement: anElement
	topElement := anElement! !

!OOStack methodsFor: 'double dispatch messages' stamp: 'mbp 9/18/2022 16:30:20'!
topFromEmptyStack
	self error: OOStack stackEmptyErrorDescription! !

!OOStack methodsFor: 'double dispatch messages' stamp: 'mbp 9/18/2022 20:21:34'!
topFromStackWithElements
	^topElement value! !


!OOStack methodsFor: 'initialization' stamp: 'mbp 9/18/2022 20:14:48'!
initialize
	topElement := NoElement new.
	size := 0.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 9/16/2021 17:39:43'!
stackEmptyErrorDescription
	
	^ 'stack is empty!!!!!!'! !


!OOStack class methodsFor: 'instance creation' stamp: 'mbp 9/18/2022 15:44:25'!
new
	^super new initialize! !


!classDefinition: #OOStackComponents category: 'Stack-Exercise'!
Object subclass: #OOStackComponents
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackComponents methodsFor: 'double dispatch messages' stamp: 'mbp 9/18/2022 15:59:03'!
isEmptySegunElementos: anElement
	self subclassResponsibility ! !

!OOStackComponents methodsFor: 'double dispatch messages' stamp: 'mbp 9/18/2022 16:17:51'!
popSegunPila: aStack
	self subclassResponsibility ! !

!OOStackComponents methodsFor: 'double dispatch messages' stamp: 'mbp 9/18/2022 16:44:40'!
topSegunPila: aStack
	self subclassResponsibility ! !


!classDefinition: #Element category: 'Stack-Exercise'!
OOStackComponents subclass: #Element
	instanceVariableNames: 'previous value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Element methodsFor: 'initialization' stamp: 'fat 9/19/2022 10:37:43'!
initializeWithValue: anElement andAnterior: tope
	value := anElement.
	previous := tope! !


!Element methodsFor: 'double dispatch messages' stamp: 'mbp 9/18/2022 15:59:03'!
isEmptySegunElementos: aStack
	^aStack isNotEmpty! !

!Element methodsFor: 'double dispatch messages' stamp: 'fat 9/19/2022 10:39:47'!
popSegunPila: aStack
	^aStack popFromStackWithElements: self! !

!Element methodsFor: 'double dispatch messages' stamp: 'mbp 9/19/2022 00:01:07'!
topSegunPila: aStack
	^aStack topFromStackWithElements! !


!Element methodsFor: 'accessing' stamp: 'fat 9/19/2022 10:39:10'!
previous
	^previous! !

!Element methodsFor: 'accessing' stamp: 'mbp 9/18/2022 16:24:29'!
value
	^value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Element class' category: 'Stack-Exercise'!
Element class
	instanceVariableNames: ''!

!Element class methodsFor: 'instance creation' stamp: 'mbp 9/18/2022 15:54:47'!
newWithValue: anElement andAnterior: tope
	^self new initializeWithValue: anElement andAnterior: tope.! !


!classDefinition: #NoElement category: 'Stack-Exercise'!
OOStackComponents subclass: #NoElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NoElement methodsFor: 'double dispatch messages' stamp: 'mbp 9/19/2022 00:02:13'!
isEmptySegunElementos: aStack
	^aStack isTrulyEmpty! !

!NoElement methodsFor: 'double dispatch messages' stamp: 'mbp 9/18/2022 16:17:02'!
popSegunPila: aStack
	aStack popFromEmptyStack.! !

!NoElement methodsFor: 'double dispatch messages' stamp: 'mbp 9/18/2022 16:30:20'!
topSegunPila: aStack
	aStack topFromEmptyStack! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'check prefix format' stamp: 'mbp 9/18/2022 20:25:06'!
checkPrefixIsNotEmpty: prefix
	prefix isEmpty ifTrue: [self error: SentenceFinderByPrefix emptyPrefixError ].
	! !

!SentenceFinderByPrefix methodsFor: 'check prefix format' stamp: 'mbp 9/18/2022 20:25:54'!
checkPrefixNotContainsAnEmptySpace: prefix
	((prefix indexOf: $  ifAbsent: [-1]) =-1) ifFalse: [self error: SentenceFinderByPrefix prefixIncludesAnSpaceError].! !


!SentenceFinderByPrefix methodsFor: 'finder - private' stamp: 'mbp 9/18/2022 21:11:18'!
createACollectionBasedOn: aStack
	|collectionToFill|
	collectionToFill := OrderedCollection new.
	self popElementsFromAStack: aStack toFill: collectionToFill.
	self pushElementsBackToStack: aStack from: collectionToFill.
	^collectionToFill 
	! !

!SentenceFinderByPrefix methodsFor: 'finder - private' stamp: 'mbp 9/19/2022 09:55:56'!
fill: collectionToReturn withElementsWithPrefix: prefix from: aStack andSaveAllElementsIn: backupCollection
	|anElement|
	[aStack isEmpty] whileFalse: [
		anElement := aStack pop.
		backupCollection addFirst: anElement.
		(anElement beginsWith: prefix) ifTrue: [
				collectionToReturn addFirst: anElement.
			]
		].
	! !

!SentenceFinderByPrefix methodsFor: 'finder - private' stamp: 'fat 9/19/2022 11:08:50'!
getACollectionOfElementsWithPrefix: prefix from: aStack
	|backupCollection collectionToReturn |
	collectionToReturn := OrderedCollection new.
	backupCollection := OrderedCollection new.
	self fill: collectionToReturn withElementsWithPrefix: prefix from: aStack andSaveAllElementsIn: backupCollection.
	self pushElementsBackToStack: aStack from: backupCollection .
	^ collectionToReturn 
	! !

!SentenceFinderByPrefix methodsFor: 'finder - private' stamp: 'mbp 9/18/2022 21:10:41'!
keepElementsWithPrefix: prefix in: aCollection
	^aCollection select: [:element | element beginsWith: prefix].! !

!SentenceFinderByPrefix methodsFor: 'finder - private' stamp: 'mbp 9/18/2022 23:50:53'!
popElementsFromAStack: aStack toFill: aCollection
	[aStack size > 0] whileTrue: [aCollection addFirst: aStack pop].! !

!SentenceFinderByPrefix methodsFor: 'finder - private' stamp: 'mbp 9/18/2022 23:51:57'!
pushElementsBackToStack: aStack from: aCollection
	aCollection do: [:element | aStack push: element].! !


!SentenceFinderByPrefix methodsFor: 'finder' stamp: 'fat 9/19/2022 11:08:51'!
findSequencesWithPrefix: prefix fromAStack: aStack
	self checkPrefixIsNotEmpty: prefix.
	self checkPrefixNotContainsAnEmptySpace: prefix.
	^self getACollectionOfElementsWithPrefix: prefix from: aStack 
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'error messages' stamp: 'mbp 9/18/2022 18:57:16'!
emptyPrefixError
	^'El prefijo ingresado es vacío'! !

!SentenceFinderByPrefix class methodsFor: 'error messages' stamp: 'mbp 9/18/2022 18:58:33'!
prefixIncludesAnSpaceError
	^'El prefijo ingresado contiene espacios en blanco'! !
