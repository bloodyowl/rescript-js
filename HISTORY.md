## 0.5.17

- Add `trimStart` and `trimEnd` to string (183cd16)

## 0.5.16

- Add `padStart` and `padEnd` to string (848a904)

## 0.5.15

Features:

- Fix a bug where @obj required a missing type (dea9c76)

## 0.5.14

Features:

- Add bitwise and exp to BigInt (1f81781)

## 0.5.13

Features:

- Add `Add BigInt.toInt` (0e726fe)

## 0.5.12

Changes:

- Add `Float.mod` (42e510a)

## 0.5.11

Changes:

- Add `identity` function (eaa0847)

## 0.5.10

Changes:

- Add compare for convenience (c0a7d8e)

## 0.5.9

Changes:

- Add mod to Pervasives (cc3575b)

## 0.5.8

Changes:

- Remove float mod (f658a23)

## 0.5.7

Features:

- Add new pervasives for a test (93047ee)

## 0.5.6

Features:

- Add convenience float/int conversion (ff91fda)

## 0.5.5

Features:

- Fix `Object.create` (aa8edf8)

## 0.5.4

Features:

- Have a `ReScriptJs__Js` module (f794a8f)

## 0.5.3

Features:

- Add `makeWithOptions` to Intl (3048de1)

## 0.5.2

Fixes:

- Fixed typed array bindings (thanks [@Minnozz](https://github.com/Minnozz)!) (5953490)

## 0.5.1

Fixes:

- Fix binding for Dict.toArray (thanks [@Minnozz](https://github.com/Minnozz)!)  (bba8959)

## 0.5.0

Features:

- Use @ryyppy/rescript-promise (9482beb)

## 0.4.2

Features:

- Add Promise.wrap (e868a31)

## 0.4.1

Fix:

- Fixed typo in JSON.classify (a5b7998)

## 0.4.0

Changes:

- JSON.classify arrays & objects contain `JSON.t` (a257881)

## 0.3.0

Changes:

- Rollback BS (a3bec83)

## 0.2.0

Changes:

- Upgrade to BS 9 (8bbe5e7)
- **Breaking**: `classify` doesn't return a result anymore, as it defaults to object type (af0367c)

## 0.1.12

Fixes:

- Fix promise bindings (c96df58)

## 0.1.11

Changes:

- Bit of explanation (b6f3d54)
- Move `minValue` & `maxValue` to `Int.Constants` (b6f3d54)

## 0.1.10

Fixes:

- Various updates/DX improvements & fixes (54a49ff)

## 0.1.9

Fixes:

- Add Re module for syntax sugar (0545c98)

## 0.1.8

Fixes:

- Add internal types (45681e9)

## 0.1.7

Fixes:

- Fixed a case-sensitivity bug caused by VSCode (fc51dc4)

## 0.1.6

Fixes:

- Fixed symbol definition for arrays (45dccba)

## 0.1.5

Features:

- Add `Symbol` support (571c0a4)
- Add `Intl` support (571c0a4)

Fixes:

- Fixed generators/async functions classification (571c0a4)

## 0.1.4

Changes:

- Fix serializer signature (e15cf24)

## 0.1.3

Changes:

- Fix serializer to prevent sparse data (aab4f81)

## 0.1.2

Changes:

- serialize -> serializeExn (554cd29)

## 0.1.1

Fixes:

- Fixed namespace (d1ce914)

## 0.1.0

Initial release
