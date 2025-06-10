# MyEldenRingMacro

Some Macro scripts wrote for EldenRing. This project utilizes AutoHotkey to automate various in-game actions to improve efficiency and gameplay experience.

**Tools Used:**

* [AutoHotkey](https://www.autohotkey.com/)
* GitHub Copilot
* Youtube Tutorial: [https://www.youtube.com/watch?v=J8QHHxVv3Gw&t=1036s](https://www.youtube.com/watch?v=J8QHHxVv3Gw&t=1036s)

---

## How It Works

This script uses AutoHotkey v2 to send a series of pre-defined key presses to the game, automating repetitive tasks.  It is configured to work specifically when the "ELDEN RING™" window is active. The script sends inputs using the "Event" mode for better reliability with games. 

## Features

* **Quick Exit:** Hotkeys to instantly quit to the main menu, either fully or just opening the final confirmation prompt.
* **Automated Rune Farming:** A comprehensive macro designed to automatically farm runes by repeatedly defeating Monge The Bank President (Boss resurrection mod required).

## Utilities

* **Fast Teleport:** A function to immediately teleport to the first Grace site you have marked as a favorite.
* **Utility Functions:** A collection of helper functions to perform actions like repeated key presses, sprinting, and menu navigation.

## Hotkeys

| Hotkey | Action | Description |
| --- | --- | --- |
| `V` | **Quick Exit to Main Menu** | Fully exits the game to the main menu by navigating the menus and confirming the exit. User input is blocked during the process to prevent interference. |
| `B` | **Open Exit Menu** | Navigates the in-game menu to bring up the "Exit Game" confirmation prompt. This allows the user to wait for the right moment (e.g., after a boss kill) before manually confirming the exit. |
| `Ctrl`+`Shift`+`P` | **Start Rune Farming** | Activates the `MongeTheBankPresident` function in a continuous loop for automated rune farming. |
| `F8` | **Reload Script** | Reloads the AutoHotkey script, which is useful for applying changes during development. |

## Functions Explained

### `MongeTheBankPresident()` - Automatic Rune Farming

This is the script's primary macro, designed to automate the process of farming runes from a boss, likely Mohg, The Omen, via a boss resurrection mod.

**The process is as follows:**
1.  **Teleport:** The character teleports to the first favorited Site of Grace.
2.  **Buff/Setup:** The script navigates menus to apply buffs or arrange items/spells. It uses a long press on 'T' to move a spell to the first slot. 
3.  **Approach:** The character automatically runs a specific path toward the boss arena. This involves a combination of sprinting, turning, and precise timings.
4.  **Combat/Action:** The script simulates mouse clicks and key presses to likely trigger an attack or skill that defeats the boss quickly.
5.  **Reset:** After a significant delay (presumably for the boss to die and runes to be acquired), the script automatically performs a "Quick Exit to Main Menu".
6.  **Reload and Repeat:** It re-enters the game, reloads the area, and begins the entire sequence again.

### `QuickExitToMainMenu()` - Safe and Fast Exit

This function provides a reliable way to quit to the main menu. 

1.  **Blocks Input:** It temporarily blocks all user mouse and keyboard input to ensure the macro runs without interruption. 
2.  **Navigates Menus:** It sends a precise sequence of key presses to navigate the system menu:
    * Opens the main menu (`Esc`). 
    * Navigates up to the "System" menu. 
    * Selects "System" (`E`). 
    * Tabs over to the "Quit Game" section (`Z`). 
    * Selects "Quit to Main Menu" (`E`). 
    * Moves the cursor to "Yes" on the confirmation dialogue (`Left Arrow`). 
3.  **Confirms Exit:** It calls the `Confirm()` function, which rapidly presses the 'E' key multiple times to finalize the exit. 
4.  **Restores Input:** It re-enables user input once the sequence is complete. 
