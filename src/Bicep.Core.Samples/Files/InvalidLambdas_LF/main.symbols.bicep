var flatten1 = flatten('abc')
//@[04:12) Variable flatten1. Type: error. Declaration start char: 0, length: 29
var flatten2 = flatten(['abc'], 'def')
//@[04:12) Variable flatten2. Type: error. Declaration start char: 0, length: 38

var map1 = map('abc')
//@[04:08) Variable map1. Type: error. Declaration start char: 0, length: 21
var map2 = map('abc', 'def')
//@[04:08) Variable map2. Type: error. Declaration start char: 0, length: 28
var map3 = map(range(0, 10), 'def')
//@[04:08) Variable map3. Type: error. Declaration start char: 0, length: 35
var map4 = map(range(0, 10), () => null)
//@[04:08) Variable map4. Type: error. Declaration start char: 0, length: 40

var filter1 = filter('abc')
//@[04:11) Variable filter1. Type: error. Declaration start char: 0, length: 27
var filter2 = filter('abc', 'def')
//@[04:11) Variable filter2. Type: error. Declaration start char: 0, length: 34
var filter3 = filter(range(0, 10), 'def')
//@[04:11) Variable filter3. Type: error. Declaration start char: 0, length: 41
var filter4 = filter(range(0, 10), () => null)
//@[04:11) Variable filter4. Type: error. Declaration start char: 0, length: 46
var filter5 = filter(range(0, 10), i => i)
//@[35:36) Local i. Type: int. Declaration start char: 35, length: 1
//@[04:11) Variable filter5. Type: error. Declaration start char: 0, length: 42
var filter6 = filter([true, 'hello!'], i => i)
//@[39:40) Local i. Type: any. Declaration start char: 39, length: 1
//@[04:11) Variable filter6. Type: array. Declaration start char: 0, length: 46

var sort1 = sort('abc')
//@[04:09) Variable sort1. Type: error. Declaration start char: 0, length: 23
var sort2 = sort('abc', 'def')
//@[04:09) Variable sort2. Type: error. Declaration start char: 0, length: 30
var sort3 = sort(range(0, 10), 'def')
//@[04:09) Variable sort3. Type: error. Declaration start char: 0, length: 37
var sort4 = sort(range(0, 10), () => null)
//@[04:09) Variable sort4. Type: error. Declaration start char: 0, length: 42
var sort5 = sort(range(0, 10), i => i)
//@[31:32) Local i. Type: int. Declaration start char: 31, length: 1
//@[04:09) Variable sort5. Type: error. Declaration start char: 0, length: 38
var sort6 = sort(range(0, 10), (i, j) => i)
//@[32:33) Local i. Type: int. Declaration start char: 32, length: 1
//@[35:36) Local j. Type: int. Declaration start char: 35, length: 1
//@[04:09) Variable sort6. Type: error. Declaration start char: 0, length: 43

var reduce1 = reduce('abc')
//@[04:11) Variable reduce1. Type: error. Declaration start char: 0, length: 27
var reduce2 = reduce('abc', 'def', 'ghi')
//@[04:11) Variable reduce2. Type: error. Declaration start char: 0, length: 41
var reduce3 = reduce(range(0, 10), 0, 'def')
//@[04:11) Variable reduce3. Type: error. Declaration start char: 0, length: 44
var reduce4 = reduce(range(0, 10), 0, () => null)
//@[04:11) Variable reduce4. Type: error. Declaration start char: 0, length: 49
var reduce5 = reduce(range(0, 10), 0, i => i)
//@[38:39) Local i. Type: int. Declaration start char: 38, length: 1
//@[04:11) Variable reduce5. Type: error. Declaration start char: 0, length: 45

var ternary = map([123], true ? i => '${i}' : i => 'hello!')
//@[32:33) Local i. Type: int. Declaration start char: 32, length: 1
//@[46:47) Local i. Type: int. Declaration start char: 46, length: 1
//@[04:11) Variable ternary. Type: any. Declaration start char: 0, length: 60

var outsideArgs = i => 123
//@[18:19) Local i. Type: any. Declaration start char: 18, length: 1
//@[04:15) Variable outsideArgs. Type: any => int. Declaration start char: 0, length: 26
var outsideArgs2 = (x, y, z) => '${x}${y}${z}'
//@[20:21) Local x. Type: any. Declaration start char: 20, length: 1
//@[23:24) Local y. Type: any. Declaration start char: 23, length: 1
//@[26:27) Local z. Type: any. Declaration start char: 26, length: 1
//@[04:16) Variable outsideArgs2. Type: (any, any, any) => string. Declaration start char: 0, length: 46
var partial = i =>
//@[14:15) Local i. Type: any. Declaration start char: 14, length: 1
//@[04:11) Variable partial. Type: any => any. Declaration start char: 0, length: 18


var inObject = {
//@[04:12) Variable inObject. Type: object. Declaration start char: 0, length: 30
  a: i => i
//@[05:06) Local i. Type: any. Declaration start char: 5, length: 1
}

var inArray = [
//@[04:11) Variable inArray. Type: array. Declaration start char: 0, length: 35
  i => i
//@[02:03) Local i. Type: any. Declaration start char: 2, length: 1
  j => j
//@[02:03) Local j. Type: any. Declaration start char: 2, length: 1
]

resource resLoop 'Microsoft.Storage/storageAccounts@2021-09-01' existing = [for item in range(0, 5): {
//@[80:84) Local item. Type: int. Declaration start char: 80, length: 4
//@[09:16) Resource resLoop. Type: Microsoft.Storage/storageAccounts@2021-09-01[]. Declaration start char: 0, length: 126
  name: 'foo${item}'
}]
var resLoopNames = map(resLoop, i => i.name)
//@[32:33) Local i. Type: Microsoft.Storage/storageAccounts@2021-09-01. Declaration start char: 32, length: 1
//@[04:16) Variable resLoopNames. Type: string[]. Declaration start char: 0, length: 44

module modLoop './empty.bicep' = [for item in range(0, 5): {
//@[38:42) Local item. Type: int. Declaration start char: 38, length: 4
//@[07:14) Module modLoop. Type: module[]. Declaration start char: 0, length: 84
  name: 'foo${item}'
}]
var modLoopNames = map(modLoop, i => i.name)
//@[32:33) Local i. Type: module. Declaration start char: 32, length: 1
//@[04:16) Variable modLoopNames. Type: string[]. Declaration start char: 0, length: 44

