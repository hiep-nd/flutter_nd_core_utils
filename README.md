# nd_core_utils
nd_core_utils is a small utility library for dart core.

## 1. NDClosureIterable and NDClosureIterator
```dart
var iteratable = NDClosureIterable(get: () => MyIterator());
var iterator = NDClosureIterator(
    current: () {
        // return current
    },
    moveNext() {
        // move next
        // return result
    }
);
```

## 2. Iteratable
### 2.1 notNull
```dart
final Iteratable it = <int?>[1, null, 2];
print(it.notNull());
// [1, 2]
```

### 2.2 insertSeparator
```dart
final Iteratable it = [1, 2, 3];
print(it.insertSeparator(100));
// [1, 100, 2, 100, 3]
```

## 3. List
### 3.1 notNullInsertSeparator
```dart
final List list = <int?>[1, null, 3];
print(list.notNullInsertSeparator(100));
// [1, 100, 3]
```
