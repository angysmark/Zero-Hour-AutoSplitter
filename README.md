# Zero-Hour-AutoSplitter
LiveSplit Autosplitter for Command and Conquer Generals: Zero Hour.

## Timing
Real time, with the time between missions removed:

- **Start:** the first frame the mouse cursor appears in the first mission, after the opening cutscene.
- **Split:** the first frame the "You Are Victorious!" splash appears. The timer pauses here.
- **Resume:** when the cursor appears in the next mission, after its opening cutscene.
- **Losing and restarting** does not pause the timer. The defeat screen, reload and cutscene all count.

Pausing the game (Esc) does not stop the timer.

## Installation
1. Download [`LiveSplit.CnCGZH.asl`](LiveSplit.CnCGZH.asl) and save it outside LiveSplit's `Components` folder. LiveSplit can overwrite files there.
2. In LiveSplit, open **Edit Splits** and click **Deactivate** if the built-in autosplitter is active.
3. Open **Edit Layout**, add **Control → Scriptable Auto Splitter**, and set its **Script Path** to the downloaded file.
4. Right-click LiveSplit and set **Compare Against → Game Time**. The Real Time clock does not pause between missions.
5. Make one split per mission.

## Settings
- **Split when the victory splash appears** (on by default)

## Supported versions
| Executable | Status |
|---|---|
| `generals.exe` | Tested |
| `generals_origin.exe` (Origin / EA App) | Same addresses as `generals.exe`, untested |
| `game.dat` | Start only: no splits or pauses |

## Known limitations
- The run only starts after a mission has loaded and its opening cutscene ends. A first mission with no opening cutscene will not start the timer.

## Credits
Memory addresses from [ROMaster2's original autosplitter](https://github.com/ROMaster2/LiveSplit.AutoSplitters/blob/master/LiveSplit.CnCGZH.asl).

## License
[MIT](LICENSE)
