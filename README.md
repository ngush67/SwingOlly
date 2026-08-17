# SwingOlly - Advanced Forex Trading Expert Advisor

SwingOlly is a MetaTrader 5 (MT5) Expert Advisor (EA) designed to automate forex trading using technical indicator filters and a moving-average trailing stop.

## Features.

- **Multi-Indicator Strategy:** Combines Double Exponential Moving Average (DEMA), Parabolic SAR, Stochastic Oscillator, and Relative Strength Index (RSI) for diversified and accurate trade signals.
- **Configurable Risk Management:** Includes fixed lot size and percentage-based position sizing for flexible money management.
- **Dynamic Trailing Stop:** Utilizes a Moving Average (MA)-based trailing stop to lock in profits and minimize losses.
- **Customizable Inputs:** Full control over indicator settings, signal thresholds, and trade management parameters.
- **Error Handling:** Robust initialization and error-checking mechanisms to ensure smooth operation.

## Strategy Overview.

SwingOlly combines the signals of multiple indicators to identify trading opportunities. It uses configurable stop loss and take profit levels and a moving-average trailing stop.

## Installation.

1. Open the MetaTrader 5 platform.
2. Navigate to `File` > `Open Data Folder`.
3. Place the `SwingOlly.mq5` file in the `MQL5/Experts` directory.
4. Restart MetaTrader 5.
5. In the Navigator panel, right-click on "Expert Advisors" and select "Refresh".
6. Drag and drop `SwingOlly` onto your desired chart.

## Input Parameters

The table lists the EA's declared `input` parameters and their source defaults.

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `Expert_Title` | `string` | `"SwingOllyII"` | Document name passed as an expert input. |
| `Expert_MagicNumber` | `ulong` | `16170` | Magic number passed to the expert framework. |
| `Expert_EveryTick` | `bool` | `false` | Tick-processing setting passed to the expert framework. |
| `Signal_ThresholdOpen` | `int` | `10` | Signal threshold for opening trades. |
| `Signal_ThresholdClose` | `int` | `10` | Signal threshold for closing trades. |
| `Signal_PriceLevel` | `double` | `0.0` | Price level passed to the main signal. |
| `Signal_StopLevel` | `double` | `50.0` | Stop loss level in points passed to the main signal. |
| `Signal_TakeLevel` | `double` | `50.0` | Take profit level in points passed to the main signal. |
| `Signal_Expiration` | `int` | `4` | Pending order expiration in bars passed to the main signal. |
| `Signal_DEMA_PeriodMA` | `int` | `12` | DEMA averaging period. |
| `Signal_DEMA_Shift` | `int` | `0` | DEMA time shift. |
| `Signal_DEMA_Applied` | `ENUM_APPLIED_PRICE` | `PRICE_CLOSE` | Price series used by DEMA. |
| `Signal_DEMA_Weight` | `double` | `1.0` | DEMA filter weight. |
| `Signal_SAR_Step` | `double` | `0.02` | Parabolic SAR step. |
| `Signal_SAR_Maximum` | `double` | `0.2` | Parabolic SAR maximum. |
| `Signal_SAR_Weight` | `double` | `1.0` | Parabolic SAR filter weight. |
| `Signal_Stoch_PeriodK` | `int` | `8` | Stochastic K period. |
| `Signal_Stoch_PeriodD` | `int` | `3` | Stochastic D period. |
| `Signal_Stoch_PeriodSlow` | `int` | `3` | Stochastic slowing period. |
| `Signal_Stoch_Applied` | `ENUM_STO_PRICE` | `STO_LOWHIGH` | Price mode used by Stochastic. |
| `Signal_Stoch_Weight` | `double` | `1.0` | Stochastic filter weight. |
| `Signal_RSI_PeriodRSI` | `int` | `8` | RSI calculation period. |
| `Signal_RSI_Applied` | `ENUM_APPLIED_PRICE` | `PRICE_CLOSE` | Price series used by RSI. |
| `Signal_RSI_Weight` | `double` | `1.0` | RSI filter weight. |
| `Trailing_MA_Period` | `int` | `12` | Moving average period used by the trailing object. |
| `Trailing_MA_Shift` | `int` | `0` | Moving average shift used by the trailing object. |
| `Trailing_MA_Method` | `ENUM_MA_METHOD` | `MODE_SMA` | Moving average method used by the trailing object. |
| `Trailing_MA_Applied` | `ENUM_APPLIED_PRICE` | `PRICE_CLOSE` | Price series used by the trailing moving average. |
| `Money_FixLot_Percent` | `double` | `10.0` | Percent value passed to the fixed-lot money object. |
| `Money_FixLot_Lots` | `double` | `0.1` | Lot value passed to the fixed-lot money object. |

## Usage.

1. Attach the EA to your preferred currency pair and timeframe.
2. Adjust the input parameters according to your trading strategy and risk appetite.
3. Ensure that automated trading is enabled in MT5 (`AutoTrading` button).
4. Monitor the EA performance through the strategy tester or live trading.

## Backtesting Performance.

In backtests over January data, SwingOllyII achieved a profit of **$157**, demonstrating its ability to adapt to market conditions and effectively manage trades, outperforming simpler strategies.

## Disclaimer.
Trading forex involves significant risk and may not be suitable for all investors. Use SwingOllyII at your own risk. Past performance is not indicative of future results.

## License.
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author
**Olson Ngula**  
[Visit My Profile](https://www.mql5.com)
## Contributions
Contributions, issues, and feature requests are welcome! Feel free to open an issue or submit a pull request.

## Acknowledgments
Thanks to the MetaTrader community and developers for providing resources and continuous support in algorithmic trading development.

