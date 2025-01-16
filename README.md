# SwingOlly - Advanced Forex Trading Expert Advisor

SwingOllyII is an advanced MetaTrader 5 (MT5) Expert Advisor (EA) designed to automate forex trading using a combination of technical indicators and robust risk management strategies. This EA integrates multiple signal filters and adaptive trailing stops to optimize trade execution and maximize profitability.

## Features

- **Multi-Indicator Strategy:** Combines Double Exponential Moving Average (DEMA), Parabolic SAR, Stochastic Oscillator, and Relative Strength Index (RSI) for diversified and accurate trade signals.
- **Configurable Risk Management:** Includes fixed lot size and percentage-based position sizing for flexible money management.
- **Dynamic Trailing Stop:** Utilizes a Moving Average (MA)-based trailing stop to lock in profits and minimize losses.
- **Customizable Inputs:** Full control over indicator settings, signal thresholds, and trade management parameters.
- **Error Handling:** Robust initialization and error-checking mechanisms to ensure smooth operation.

## Strategy Overview

SwingOllyII identifies trading opportunities based on the combined signals of multiple indicators. The strategy confirms trends and momentum to open trades, manages risk with configurable stop loss and take profit levels, and protects profits using dynamic trailing stops.

## Installation

1. Open the MetaTrader 5 platform.
2. Navigate to `File` > `Open Data Folder`.
3. Place the `SwingOllyII.mq5` file in the `MQL5/Experts` directory.
4. Restart MetaTrader 5.
5. In the Navigator panel, right-click on "Expert Advisors" and select "Refresh".
6. Drag and drop `SwingOllyII` onto your desired chart.

## Input Parameters

### General Settings
- **Expert_Title:** Name of the EA instance.
- **Expert_MagicNumber:** Unique identifier for trade management.
- **Expert_EveryTick:** Enable/disable every tick mode.

### Signal Filters
- **Signal_ThresholdOpen:** Threshold for opening trades (0-100).
- **Signal_ThresholdClose:** Threshold for closing trades (0-100).
- **Signal_StopLevel:** Stop Loss in points.
- **Signal_TakeLevel:** Take Profit in points.

### Indicators Configuration
- **DEMA Settings:** Period, Shift, Applied Price, and Weight.
- **SAR Settings:** Step, Maximum, and Weight.
- **Stochastic Settings:** Period K, D, Slow, Applied Price, and Weight.
- **RSI Settings:** Period and Weight.

### Trailing Stop
- **Trailing_MA_Period:** Period for the Moving Average trailing stop.
- **Trailing_MA_Method:** Method of averaging (SMA, EMA, etc.).

### Money Management
- **Money_FixLot_Percent:** Percentage-based lot size.
- **Money_FixLot_Lots:** Fixed lot size.

## Usage

1. Attach the EA to your preferred currency pair and timeframe.
2. Adjust the input parameters according to your trading strategy and risk appetite.
3. Ensure that automated trading is enabled in MT5 (`AutoTrading` button).
4. Monitor the EA performance through the strategy tester or live trading.

## Backtesting Performance

In backtests over January data, SwingOllyII achieved a profit of **$157**, demonstrating its ability to adapt to market conditions and effectively manage trades, outperforming simpler strategies.

## Disclaimer
Trading forex involves significant risk and may not be suitable for all investors. Use SwingOllyII at your own risk. Past performance is not indicative of future results.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author
**Olson Ngula**  
[Visit My Profile](https://www.mql5.com)

## Contributions
Contributions, issues, and feature requests are welcome! Feel free to open an issue or submit a pull request.

## Acknowledgments
Thanks to the MetaTrader community and developers for providing resources and continuous support in algorithmic trading development.

