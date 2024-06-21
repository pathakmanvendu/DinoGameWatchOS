# Dino Game for watchOS

## Overview
Dino Game is a simple and fun game for the Apple Watch built using SwiftUI. Inspired by the classic Chrome Dino game, this project allows players to control a dinosaur and avoid obstacles by tapping the watch screen.

## Features
- Simple, intuitive controls
- Retro-inspired graphics
- Real-time score tracking
- Game over detection with restart functionality

## Requirements
- Xcode 12.0 or later
- watchOS 7.0 or later
- Swift 5.3 or later

## Installation
1. **Clone the repository:**
   ```sh
   git clone https://github.com/yourusername/dino-game-watchos.git
Open the project in Xcode:
sh
Copy code
cd dino-game-watchos
open DinoGame.xcodeproj
Select the target device:
Ensure your Apple Watch simulator or actual device is selected.
Build and run the project:
Click the build and run button in Xcode or press Cmd + R.
How to Play
Start the Game:
The game starts automatically when the app is launched.
Control the Dino:
Tap the screen to make the dinosaur jump.
Avoid the obstacles to continue running.
Score:
The score increases the longer you survive.
The game ends when the dinosaur hits an obstacle.
Restart:
After a game over, tap the screen to restart the game.
Project Structure
DinoGameApp.swift: Entry point of the application.
ContentView.swift: Main view containing the game logic.
Dino.swift: Model for the dinosaur character.
Obstacle.swift: Model for the obstacles.
GameLogic.swift: Contains the game loop and collision detection.
Customization
To customize the game, you can adjust parameters such as:

Dino speed
Obstacle frequency
Graphics and design elements
These settings can be modified in GameLogic.swift and the corresponding SwiftUI views.

Contribution
Contributions are welcome! If you have suggestions for improvements or want to report a bug, please open an issue or submit a pull request.

License
This project is licensed under the MIT License. See the LICENSE file for details.

Contact
For any questions or feedback, please reach out to your.email@example.com.

Enjoy the game!
