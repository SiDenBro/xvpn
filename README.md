# X VPN

Flutter приложение для демонстрации минимальных навыков разработки ПО

## Зависимости

-   flutter_riverpod - State Managment & DI
-   dio - HTTP-клиент
-   hive - локальное хранилище
-   flutter_svg - взаимодействие с svg файлами
-   dartz - Right-Left Generics механика
-   flutter_spinkit - Виджеты загрузки страницы
-   flutter_staggered_animations - анимация страничных блоков
-   introduction_screen - onboarding

## Что реализовано

-   ✅ Все основные требования ТЗ  
-   ✅ Провайдеры для управления состоянием  
-   ✅ Разделение на data/domain/presentation (Clean Architecture)  
-   ✅ Имитация покупки премиум-доступа  
-   ✅ Локальное хранение данных  
-   ✅ Обработка ошибок

## Структура 

lib/
├── core/
│   ├── enums/
│   ├── errors/
│   ├── network/
│   ├── secure_storage/
├── feature/
│   ├──data/
│   │   ├── datasources/
│   │   │   ├── local/
│   │   │   └── remote/
│   │   ├── models/
│   │   └── repositories/
│   ├── domain/
│   │   ├── entities/
│   │   ├── repositories/
│   │   └── usecases/
│   └── presentation/
│       ├── app/
│       ├── architecture/
│       ├── pages/
│       ├── providers/
│       └── widgets/
├── utils/
│       ├── constants/
│       ├── handlers/
│       ├── theme/
│       ├── validation/
│       └── widgets/
├── app.dart
├── config.dart
└── main.dart

## Что бы я улучшил?

-   Реализовал бы техническую задумку по созданию VPN приложения
-   Реализовал бы мультиязычность и смену тем (светлая и тёмная)
-   Улучшил бы UI и добавил бы больше анимаций