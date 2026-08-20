# Flutter Clean Architecture Mason Bricks 🧱

ชุด **Mason Bricks** สำหรับสร้างโครงสร้างโปรเจกต์ Flutter ด้วย **Clean Architecture** (Feature-first & Production Ready) รองรับ 3 State Management ยอดนิยม: **BLoC**, **Riverpod**, และ **GetX**

> ⚡ **Auto Dependencies Installation:** เมื่อรันคำสั่ง `init` (`bloc_init`, `riverpod_init`, `getx_init`) ระบบจะทำการติดตั้ง Packages ที่จำเป็นทั้งหมดลงใน `pubspec.yaml` ให้อัตโนมัติทันทีผ่าน Flutter CLI

---

## 📁 โครงสร้างโฟลเดอร์ Bricks

```text
bricks/
├── bloc/           # 🔴 Flutter BLoC + GoRouter + GetIt
│   ├── init/       (bloc_init)
│   ├── feature/    (bloc_feature)
│   └── page/       (bloc_page)
├── riverpod/       # 🟣 Flutter Riverpod + GoRouter
│   ├── init/       (riverpod_init)
│   ├── feature/    (riverpod_feature)
│   └── page/       (riverpod_page)
└── getx/           # 🔵 Flutter GetX
    ├── init/       (getx_init)
    ├── feature/    (getx_feature)
    └── page/       (getx_page)
```

---

## 📦 รายการ Bricks ทั้งหมด

### 🔴 Flutter BLoC Bricks
| Brick | คำสั่งใช้งาน | รายละเอียด |
| :--- | :--- | :--- |
| **`bloc_init`** | `mason make bloc_init` | สร้างโครงสร้างตั้งต้น BLoC + GoRouter + GetIt + ติดตั้ง Dependencies ใน `pubspec.yaml` อัตโนมัติ |
| **`bloc_feature`** | `mason make bloc_feature` | สร้าง Feature ใหม่ BLoC Clean Architecture (`data`, `domain`, `presentation/bloc`) พร้อม Auto GoRoute & DI |
| **`bloc_page`** | `mason make bloc_page` | เพิ่ม Page ย่อยใหม่ใน Feature เดิมของ BLoC พร้อม Auto GoRoute |

### 🟣 Flutter Riverpod Bricks
| Brick | คำสั่งใช้งาน | รายละเอียด |
| :--- | :--- | :--- |
| **`riverpod_init`** | `mason make riverpod_init` | สร้างโครงสร้างตั้งต้น Riverpod + GoRouter + ติดตั้ง Dependencies ใน `pubspec.yaml` อัตโนมัติ |
| **`riverpod_feature`** | `mason make riverpod_feature` | สร้าง Feature ใหม่ Riverpod Clean Architecture (`data`, `domain`, `presentation/providers`) พร้อม Auto GoRoute |
| **`riverpod_page`** | `mason make riverpod_page` | เพิ่ม Page ย่อยใหม่ใน Feature เดิมของ Riverpod พร้อม Auto GoRoute |

### 🔵 Flutter GetX Bricks
| Brick | คำสั่งใช้งาน | รายละเอียด |
| :--- | :--- | :--- |
| **`getx_init`** | `mason make getx_init` | สร้างโครงสร้างตั้งต้น GetX + ติดตั้ง Dependencies ใน `pubspec.yaml` อัตโนมัติ |
| **`getx_feature`** | `mason make getx_feature` | สร้าง Feature ใหม่ GetX Clean Architecture (`data`, `domain`, `presentation`) พร้อม Auto Route |
| **`getx_page`** | `mason make getx_page` | เพิ่ม Page ย่อยใหม่ใน Feature เดิมของ GetX พร้อม Auto Route |

---

# 📖 คู่มือการติดตั้งและใช้งานสำหรับผู้ใช้งาน (Developer Guide)

ผู้ใช้งานคนอื่น **ไม่จำเป็นต้อง Clone โปรเจกต์นี้ลงเครื่อง** สามารถติดตั้งและใช้งานผ่าน GitHub ได้ทันทีตามขั้นตอนต่อไปนี้:

### 1️⃣ ขั้นตอนที่ 1: ติดตั้ง Mason CLI (ทำครั้งเดียวในเครื่อง)
```bash
dart pub global activate mason_cli
```

---

### 2️⃣ ขั้นตอนที่ 2: ติดตั้ง Bricks เข้าสู่ Global ผ่าน GitHub 🌐

#### ⚡ ติดตั้งทั้งหมดในคำสั่งเดียว (One-liner - แนะนำ):
```bash
mason add -g bloc_init --git-url https://github.com/Singhanat-Dev/flutter-clean-architecture-bricks.git --git-path bricks/bloc/init && mason add -g bloc_feature --git-url https://github.com/Singhanat-Dev/flutter-clean-architecture-bricks.git --git-path bricks/bloc/feature && mason add -g bloc_page --git-url https://github.com/Singhanat-Dev/flutter-clean-architecture-bricks.git --git-path bricks/bloc/page && mason add -g riverpod_init --git-url https://github.com/Singhanat-Dev/flutter-clean-architecture-bricks.git --git-path bricks/riverpod/init && mason add -g riverpod_feature --git-url https://github.com/Singhanat-Dev/flutter-clean-architecture-bricks.git --git-path bricks/riverpod/feature && mason add -g riverpod_page --git-url https://github.com/Singhanat-Dev/flutter-clean-architecture-bricks.git --git-path bricks/riverpod/page && mason add -g getx_init --git-url https://github.com/Singhanat-Dev/flutter-clean-architecture-bricks.git --git-path bricks/getx/init && mason add -g getx_feature --git-url https://github.com/Singhanat-Dev/flutter-clean-architecture-bricks.git --git-path bricks/getx/feature && mason add -g getx_page --git-url https://github.com/Singhanat-Dev/flutter-clean-architecture-bricks.git --git-path bricks/getx/page
```

---

#### 🔹 หรือเลือกติดตั้งแยกเฉพาะ Framework ที่ต้องการ:

<details>
<summary><b>🔴 สำหรับ Flutter BLoC</b> (คลิกเพื่อดูคำสั่ง)</summary>

```bash
mason add -g bloc_init --git-url https://github.com/Singhanat-Dev/flutter-clean-architecture-bricks.git --git-path bricks/bloc/init
mason add -g bloc_feature --git-url https://github.com/Singhanat-Dev/flutter-clean-architecture-bricks.git --git-path bricks/bloc/feature
mason add -g bloc_page --git-url https://github.com/Singhanat-Dev/flutter-clean-architecture-bricks.git --git-path bricks/bloc/page
```
</details>

<details>
<summary><b>🟣 สำหรับ Flutter Riverpod</b> (คลิกเพื่อดูคำสั่ง)</summary>

```bash
mason add -g riverpod_init --git-url https://github.com/Singhanat-Dev/flutter-clean-architecture-bricks.git --git-path bricks/riverpod/init
mason add -g riverpod_feature --git-url https://github.com/Singhanat-Dev/flutter-clean-architecture-bricks.git --git-path bricks/riverpod/feature
mason add -g riverpod_page --git-url https://github.com/Singhanat-Dev/flutter-clean-architecture-bricks.git --git-path bricks/riverpod/page
```
</details>

<details>
<summary><b>🔵 สำหรับ Flutter GetX</b> (คลิกเพื่อดูคำสั่ง)</summary>

```bash
mason add -g getx_init --git-url https://github.com/Singhanat-Dev/flutter-clean-architecture-bricks.git --git-path bricks/getx/init
mason add -g getx_feature --git-url https://github.com/Singhanat-Dev/flutter-clean-architecture-bricks.git --git-path bricks/getx/feature
mason add -g getx_page --git-url https://github.com/Singhanat-Dev/flutter-clean-architecture-bricks.git --git-path bricks/getx/page
```
</details>

---

### 3️⃣ ขั้นตอนที่ 3: วิธีการนำไปใช้งานในโปรเจกต์ใหม่ (Usage Workflow)

เมื่อติดตั้ง Bricks เข้าสู่ Global แล้ว สามารถเปิด Terminal ในโปรเจกต์ Flutter แล้วเรียกใช้คำสั่งได้ทันที:

#### 🔴 ตัวอย่างการใช้งาน Flutter BLoC:
```bash
# 1. สร้างโปรเจกต์ Flutter
flutter create my_app
cd my_app

# 2. เริ่มต้นโครงสร้าง Clean Architecture (ติดตั้ง dependencies ใน pubspec.yaml อัตโนมัติ)
mason make bloc_init

# 3. สร้าง Feature ใหม่ (Data + Domain + Presentation + Auto GoRoute & DI)
mason make bloc_feature --feature_name auth --page_name login

# 4. เพิ่ม Page ย่อยใน Feature เดิม (เช่น หน้า register ใน auth)
mason make bloc_page --feature_name auth --page_name register
```

#### 🟣 ตัวอย่างการใช้งาน Flutter Riverpod:
```bash
# 1. สร้างโปรเจกต์ Flutter
flutter create my_app
cd my_app

# 2. เริ่มต้นโครงสร้าง Clean Architecture (ติดตั้ง dependencies ใน pubspec.yaml อัตโนมัติ)
mason make riverpod_init

# 3. สร้าง Feature ใหม่ (Data + Domain + Presentation + Auto GoRoute)
mason make riverpod_feature --feature_name auth --page_name login

# 4. เพิ่ม Page ย่อยใน Feature เดิม
mason make riverpod_page --feature_name auth --page_name register
```

#### 🔵 ตัวอย่างการใช้งาน Flutter GetX:
```bash
# 1. สร้างโปรเจกต์ Flutter
flutter create my_app
cd my_app

# 2. เริ่มต้นโครงสร้าง Clean Architecture (ติดตั้ง dependencies ใน pubspec.yaml อัตโนมัติ)
mason make getx_init

# 3. สร้าง Feature ใหม่ (Data + Domain + Presentation + Auto Route)
mason make getx_feature --feature_name auth --page_name login

# 4. เพิ่ม Page ย่อยใน Feature เดิม
mason make getx_page --feature_name auth --page_name register
```

---

### 4️⃣ ขั้นตอนที่ 4: การจัดการ Bricks ในเครื่อง

#### 📋 ตรวจสอบรายการ Bricks ใน Global:
```bash
mason list -g
```

#### 🔄 อัปเดต Bricks เป็นเวอร์ชันล่าสุดจาก GitHub:
```bash
mason upgrade -g
```

#### 🧹 ลบ / ล้าง Bricks ออกจาก Global:
```bash
# ลบทั้งหมดในคำสั่งเดียว
mason remove -g bloc_init bloc_feature bloc_page riverpod_init riverpod_feature riverpod_page getx_init getx_feature getx_page

# หรือล้าง Cache ทั้งหมดของ Mason
mason cache clear
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
