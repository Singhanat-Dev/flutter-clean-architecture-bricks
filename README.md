# Flutter Clean Architecture Mason Bricks 🧱

ชุด Mason Bricks สำหรับสร้างโครงสร้างโปรเจกต์ Flutter ด้วย **Clean Architecture** (Feature-first & Production Ready) แยกหมวดหมู่ตาม State Management: **GetX**, **Riverpod**, และ **BLoC**

> ⚡ **Auto Dependencies Installation:** เมื่อรันคำสั่ง `init` (`getx_init`, `riverpod_init`, `bloc_init`) ระบบจะทำการติดตั้ง Packages ที่จำเป็นทั้งหมดลงใน `pubspec.yaml` ให้อัตโนมัติทันทีผ่าน Flutter CLI

---

## 📁 โครงสร้างโฟลเดอร์ Bricks

```text
bricks/
├── getx/
│   ├── init/       (getx_init)
│   ├── feature/    (getx_feature)
│   └── page/       (getx_page)
├── riverpod/
│   ├── init/       (riverpod_init)
│   ├── feature/    (riverpod_feature)
│   └── page/       (riverpod_page)
└── bloc/
    ├── init/       (bloc_init)
    ├── feature/    (bloc_feature)
    └── page/       (bloc_page)
```

---

## 📦 รายการ Bricks ทั้งหมด

### 🔵 Flutter GetX Bricks
| Brick | คำสั่งใช้งาน | รายละเอียด |
| :--- | :--- | :--- |
| **`getx_init`** | `mason make getx_init` | สร้างโครงสร้างตั้งต้น GetX + ติดตั้ง Dependencies ใน `pubspec.yaml` อัตโนมัติ |
| **`getx_feature`** | `mason make getx_feature` | สร้าง Feature ใหม่ GetX Clean Architecture (`data`, `domain`, `presentation`) พร้อม Auto Route |
| **`getx_page`** | `mason make getx_page` | เพิ่ม Page ย่อยใหม่ใน Feature เดิมของ GetX พร้อม Auto Route |

### 🟣 Flutter Riverpod Bricks
| Brick | คำสั่งใช้งาน | รายละเอียด |
| :--- | :--- | :--- |
| **`riverpod_init`** | `mason make riverpod_init` | สร้างโครงสร้างตั้งต้น Riverpod + GoRouter + ติดตั้ง Dependencies ใน `pubspec.yaml` อัตโนมัติ |
| **`riverpod_feature`** | `mason make riverpod_feature` | สร้าง Feature ใหม่ Riverpod Clean Architecture (`data`, `domain`, `presentation`) พร้อม Auto GoRoute |
| **`riverpod_page`** | `mason make riverpod_page` | เพิ่ม Page ย่อยใหม่ใน Feature เดิมของ Riverpod พร้อม Auto GoRoute |

### 🔴 Flutter BLoC Bricks
| Brick | คำสั่งใช้งาน | รายละเอียด |
| :--- | :--- | :--- |
| **`bloc_init`** | `mason make bloc_init` | สร้างโครงสร้างตั้งต้น BLoC + GoRouter + GetIt + ติดตั้ง Dependencies ใน `pubspec.yaml` อัตโนมัติ |
| **`bloc_feature`** | `mason make bloc_feature` | สร้าง Feature ใหม่ BLoC Clean Architecture (`data`, `domain`, `presentation/bloc`) พร้อม Auto GoRoute & DI |
| **`bloc_page`** | `mason make bloc_page` | เพิ่ม Page ย่อยใหม่ใน Feature เดิมของ BLoC พร้อม Auto GoRoute |

---

## 🚀 วิธีการติดตั้งและเริ่มใช้งาน

### 1. ติดตั้ง Mason CLI (หากยังไม่ได้ติดตั้ง)
```bash
dart pub global activate mason_cli
```

---

### 2. ติดตั้ง Bricks เพื่อใช้งานแบบ Global 🌍 (แนะนำ)
รันคำสั่งด้านล่างนี้ในโฟลเดอร์ `mason-bricks` เพื่อติดตั้ง Bricks เข้าสู่ Global ของเครื่อง ทำให้สามารถเรียกใช้คำสั่ง `mason make ...` ได้จากทุกที่:

#### 🔵 ติดตั้ง GetX Bricks (Global):
```bash
mason add -g getx_init --path ./bricks/getx/init
mason add -g getx_feature --path ./bricks/getx/feature
mason add -g getx_page --path ./bricks/getx/page
```

#### 🟣 ติดตั้ง Riverpod Bricks (Global):
```bash
mason add -g riverpod_init --path ./bricks/riverpod/init
mason add -g riverpod_feature --path ./bricks/riverpod/feature
mason add -g riverpod_page --path ./bricks/riverpod/page
```

#### 🔴 ติดตั้ง BLoC Bricks (Global):
```bash
mason add -g bloc_init --path ./bricks/bloc/init
mason add -g bloc_feature --path ./bricks/bloc/feature
mason add -g bloc_page --path ./bricks/bloc/page
```

> **💡 ติดตั้งทั้งหมดในคำสั่งเดียว (One-liner):**
> ```bash
> mason add -g getx_init --path ./bricks/getx/init && mason add -g getx_feature --path ./bricks/getx/feature && mason add -g getx_page --path ./bricks/getx/page && mason add -g riverpod_init --path ./bricks/riverpod/init && mason add -g riverpod_feature --path ./bricks/riverpod/feature && mason add -g riverpod_page --path ./bricks/riverpod/page && mason add -g bloc_init --path ./bricks/bloc/init && mason add -g bloc_feature --path ./bricks/bloc/feature && mason add -g bloc_page --path ./bricks/bloc/page
> ```

#### 📋 ตรวจสอบรายการ Bricks ที่ติดตั้งใน Global:
```bash
mason list -g
```

#### 🧹 ลบ / ล้าง Bricks ออกจาก Global:
```bash
# ลบเฉพาะ Framework ที่ต้องการ (เช่น GetX)
mason remove -g getx_init getx_feature getx_page

# ลบเฉพาะ Riverpod
mason remove -g riverpod_init riverpod_feature riverpod_page

# ลบเฉพาะ BLoC
mason remove -g bloc_init bloc_feature bloc_page

# หรือ ลบ Bricks ทั้งหมดออกจาก Global ในคำสั่งเดียว
mason remove -g getx_init getx_feature getx_page riverpod_init riverpod_feature riverpod_page bloc_init bloc_feature bloc_page

# หรือ ล้าง Cache ทั้งหมดของ Mason
mason cache clear
```

---


---

### 🌐 ติดตั้งแบบ Global ผ่าน GitHub โดยตรง (ไม่ต้อง Clone) 🚀
ผู้ใช้งานสามารถติดตั้ง Bricks เข้าเครื่องผ่าน GitHub URL ได้ทันที:

```bash
# 🔵 GetX Bricks (จาก GitHub)
mason add -g getx_init --git-url https://github.com/Singhanat-Dev/flutter-clean-architecture-bricks.git --git-path bricks/getx/init
mason add -g getx_feature --git-url https://github.com/Singhanat-Dev/flutter-clean-architecture-bricks.git --git-path bricks/getx/feature
mason add -g getx_page --git-url https://github.com/Singhanat-Dev/flutter-clean-architecture-bricks.git --git-path bricks/getx/page

# 🟣 Riverpod Bricks (จาก GitHub)
mason add -g riverpod_init --git-url https://github.com/Singhanat-Dev/flutter-clean-architecture-bricks.git --git-path bricks/riverpod/init
mason add -g riverpod_feature --git-url https://github.com/Singhanat-Dev/flutter-clean-architecture-bricks.git --git-path bricks/riverpod/feature
mason add -g riverpod_page --git-url https://github.com/Singhanat-Dev/flutter-clean-architecture-bricks.git --git-path bricks/riverpod/page

# 🔴 BLoC Bricks (จาก GitHub)
mason add -g bloc_init --git-url https://github.com/Singhanat-Dev/flutter-clean-architecture-bricks.git --git-path bricks/bloc/init
mason add -g bloc_feature --git-url https://github.com/Singhanat-Dev/flutter-clean-architecture-bricks.git --git-path bricks/bloc/feature
mason add -g bloc_page --git-url https://github.com/Singhanat-Dev/flutter-clean-architecture-bricks.git --git-path bricks/bloc/page
```

### 3. หรือ ติดตั้งแบบ Local (เฉพาะโฟลเดอร์นี้)
```bash
mason get
```

---

## 🛠️ ตัวอย่างการใช้งานคำสั่ง

### 🔴 สำหรับ Flutter BLoC

#### 1. Initializing โปรเจกต์ BLoC (`bloc_init`)
*(ระบบจะสร้างไฟล์โครงสร้าง + รัน `flutter pub add` ติดตั้ง dependencies ทั้งหมดให้อัตโนมัติ)*
```bash
mason make bloc_init
```
**Variables:**
- `project_name`: ชื่อโปรเจกต์ (default: `my_app`)
- `application_title`: ชื่อ Application (default: `Flutter BLoC App`)

**Dependencies ที่ระบบติดตั้งให้อัตโนมัติ:**
- `flutter_bloc: ^8.1.6`
- `equatable: ^2.0.5`
- `get_it: ^7.7.0`
- `go_router: ^14.2.0`
- `dio: ^5.4.3+1`
- `shared_preferences: ^2.2.3`
- `flutter_secure_storage: ^9.2.2`
- `connectivity_plus: ^6.1.0`
- `crypto: ^3.0.6`

#### 2. สร้าง Feature ใหม่ BLoC (`bloc_feature`)
```bash
mason make bloc_feature --feature_name auth --page_name login
```

#### 3. เพิ่ม Page ใน Feature เดิม (`bloc_page`)
```bash
mason make bloc_page --feature_name auth --page_name register
```

---

### 🟣 สำหรับ Flutter Riverpod

#### 1. Initializing โปรเจกต์ Riverpod (`riverpod_init`)
*(ระบบจะสร้างไฟล์โครงสร้าง + รัน `flutter pub add` ติดตั้ง dependencies ทั้งหมดให้อัตโนมัติ)*
```bash
mason make riverpod_init
```
**Variables:**
- `project_name`: ชื่อโปรเจกต์ (default: `my_app`)
- `application_title`: ชื่อ Application (default: `Flutter Riverpod App`)

**Dependencies ที่ระบบติดตั้งให้อัตโนมัติ:**
- `flutter_riverpod: ^2.5.1`
- `go_router: ^14.2.0`
- `dio: ^5.4.3+1`
- `shared_preferences: ^2.2.3`
- `flutter_secure_storage: ^9.2.2`
- `connectivity_plus: ^6.1.0`
- `crypto: ^3.0.6`

#### 2. สร้าง Feature ใหม่ Riverpod (`riverpod_feature`)
```bash
mason make riverpod_feature --feature_name auth --page_name login
```

#### 3. เพิ่ม Page ใน Feature เดิม (`riverpod_page`)
```bash
mason make riverpod_page --feature_name auth --page_name register
```

---

### 🔵 สำหรับ Flutter GetX

#### 1. Initializing โปรเจกต์ GetX (`getx_init`)
*(ระบบจะสร้างไฟล์โครงสร้าง + รัน `flutter pub add` ติดตั้ง dependencies ทั้งหมดให้อัตโนมัติ)*
```bash
mason make getx_init
```
**Variables:**
- `project_name`: ชื่อโปรเจกต์ (default: `my_app`)
- `application_title`: ชื่อ Application (default: `Flutter GetX App`)

**Dependencies ที่ระบบติดตั้งให้อัตโนมัติ:**
- `get: ^4.6.6`
- `get_storage: ^2.1.1`
- `flutter_secure_storage: ^9.2.2`
- `connectivity_plus: ^6.1.0`
- `crypto: ^3.0.6`

#### 2. สร้าง Feature ใหม่ GetX (`getx_feature`)
```bash
mason make getx_feature --feature_name auth --page_name login
```

#### 3. เพิ่ม Page ใน Feature เดิม (`getx_page`)
```bash
mason make getx_page --feature_name auth --page_name register
```

---

## 🏗️ ภาพรวมโครงสร้าง Clean Architecture

```text
lib/
├── main.dart
│
├── app/
│   ├── app.dart
│   ├── config/
│   │   ├── app_config.dart
│   │   ├── app_info.dart
│   │   └── app_constants.dart
│   ├── routes/
│   │   ├── app_routes.dart
│   │   └── app_pages.dart (GetX) / app_router.dart (Riverpod, BLoC)
│   ├── theme/
│   │   └── app_theme.dart
│   └── localization/
│       ├── translations.dart
│       ├── en.dart
│       └── th.dart
│
├── core/
│   ├── network/
│   │   ├── api_client.dart
│   │   ├── api_endpoints.dart
│   │   ├── api_exception.dart
│   │   ├── api_result.dart
│   │   └── interceptors/auth_interceptor.dart
│   ├── storage/
│   │   ├── secure_storage.dart
│   │   └── preferences_storage.dart
│   ├── connectivity/
│   │   └── connectivity_service.dart
│   ├── security/
│   │   ├── encryption_helper.dart
│   │   └── key_manager.dart
│   ├── extensions/
│   │   └── app_extension.dart
│   ├── responsive/
│   │   └── app_responsive.dart
│   ├── assets/
│   │   └── app_assets.dart
│   ├── logger/
│   │   └── logger.dart
│   └── utils/
│       ├── validators.dart
│       ├── formatters.dart
│       └── helpers.dart
│
├── shared/
│   ├── widgets/
│   └── models/
│
├── features/
│   └── {{feature_name}}/
│       ├── data/
│       │   ├── datasources/
│       │   ├── mappers/
│       │   ├── models/
│       │   └── repositories/
│       ├── domain/
│       │   ├── entities/
│       │   ├── repositories/
│       │   └── usecases/
│       └── presentation/
│           ├── bloc/ (BLoC) or providers/ (Riverpod) or bindings/ (GetX)
│           ├── controllers/ (GetX)
│           ├── pages/
│           └── widgets/
│
└── bootstrap/
    ├── initial_binding.dart (GetX)
    └── initial_setup.dart (BLoC, Riverpod)
```
