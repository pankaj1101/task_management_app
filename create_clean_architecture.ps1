# Clean Architecture + Riverpod Folder Structure Script
# Run this from the root of your Flutter project

$base = "lib"

# Core
New-Item -ItemType Directory -Force -Path "$base/core/errors"
New-Item -ItemType Directory -Force -Path "$base/core/usecases"
New-Item -ItemType Directory -Force -Path "$base/core/utils"
New-Item -ItemType Directory -Force -Path "$base/core/constants"

# Domain
New-Item -ItemType Directory -Force -Path "$base/domain/entities"
New-Item -ItemType Directory -Force -Path "$base/domain/repositories"
New-Item -ItemType Directory -Force -Path "$base/domain/usecases"

# Data
New-Item -ItemType Directory -Force -Path "$base/data/datasources"
New-Item -ItemType Directory -Force -Path "$base/data/models"
New-Item -ItemType Directory -Force -Path "$base/data/repositories"

# Features -> Auth
New-Item -ItemType Directory -Force -Path "$base/features/auth/providers"
New-Item -ItemType Directory -Force -Path "$base/features/auth/controllers"
New-Item -ItemType Directory -Force -Path "$base/features/auth/screens"

# Features -> Tasks
New-Item -ItemType Directory -Force -Path "$base/features/tasks/providers"
New-Item -ItemType Directory -Force -Path "$base/features/tasks/controllers"
New-Item -ItemType Directory -Force -Path "$base/features/tasks/screens"

# Features -> Profile
New-Item -ItemType Directory -Force -Path "$base/features/profile/providers"
New-Item -ItemType Directory -Force -Path "$base/features/profile/controllers"
New-Item -ItemType Directory -Force -Path "$base/features/profile/screens"

# Services
New-Item -ItemType Directory -Force -Path "$base/services/network"
New-Item -ItemType Directory -Force -Path "$base/services/storage"
New-Item -ItemType Directory -Force -Path "$base/services/notifications"

# Root files
New-Item -ItemType File -Force -Path "$base/app.dart"
New-Item -ItemType File -Force -Path "$base/main.dart"
New-Item -ItemType File -Force -Path "$base/router.dart"

Write-Output "✅ Flutter Clean Architecture + Riverpod structure created successfully!"
