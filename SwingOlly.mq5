//+------------------------------------------------------------------+
//|                                                    SwingOlly.mq5 |
//|                                                      olson ngula |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "olson ngula"
#property link      "https://www.mql5.com"
#property version   "1.02"
//+------------------------------------------------------------------+
//| Include                                                          |
//+------------------------------------------------------------------+
#include <Expert\Expert.mqh>
#include <Expert\Trailing\TrailingFixedPips.mqh>
#include <Expert\Money\MoneyFixedRisk.mqh>
//+------------------------------------------------------------------+
//| Inputs                                                           |
//+------------------------------------------------------------------+
input string   Expert_Title = "SwingOlly";
ulong          Expert_MagicNumber = 4422;
bool           Expert_EveryTick = false;

//--- EMA Trend Filter
input int      EMA_Trend_Period = 12;

//--- ATR Dynamic SL/TP Inputs
input int      ATR_Period = 14;                // ATR Period
input double   ATR_SL_Multiplier = 2.0;        // Stop-Loss = ATR * Multiplier
input double   ATR_TP_Multiplier = 4.0;        // Take-Profit = ATR * Multiplier

//--- Trailing Stop Inputs
input int      Trailing_FixedPips_StopLevel = 30;
input int      Trailing_FixedPips_ProfitLevel = 100;

//--- Money Management
input double   Money_FixRisk_Percent = 2.0;

//+------------------------------------------------------------------+
//| Global Objects                                                   |
//+------------------------------------------------------------------+
CMoneyFixedRisk Money;
CTrailingFixedPips TrailingStop;

//+------------------------------------------------------------------+
//| Function to Check for Existing Trades                            |
//+------------------------------------------------------------------+
bool IsPositionOpen()
{
   for (int i = 0; i < PositionsTotal(); i++)
   {
      if (PositionGetTicket(i) > 0 && PositionGetInteger(POSITION_MAGIC) == Expert_MagicNumber)
         return true;
   }
   return false;
}

//+------------------------------------------------------------------+
//| Function to Place Trades                                         |
//+------------------------------------------------------------------+
void PlaceTrade(ENUM_ORDER_TYPE orderType, double stopLoss, double takeProfit)
{
   MqlTradeRequest request;
   MqlTradeResult result;

   ZeroMemory(request);
   ZeroMemory(result);

   // Calculate lot size based on risk percentage
   double lotSize = Money.LotsCalculated(stopLoss);

   request.action   = TRADE_ACTION_DEAL;
   request.symbol   = _Symbol;
   request.volume   = lotSize;
   request.type     = orderType;
   request.price    = (orderType == ORDER_TYPE_BUY) ? SymbolInfoDouble(_Symbol, SYMBOL_ASK) : SymbolInfoDouble(_Symbol, SYMBOL_BID);
   request.sl       = stopLoss;
   request.tp       = takeProfit;
   request.magic    = Expert_MagicNumber;

   if (!OrderSend(request, result))
      Print("Error placing order: ", GetLastError());
   else
      Print("Trade placed: ", (orderType == ORDER_TYPE_BUY) ? "Buy" : "Sell", " | Lot: ", lotSize);
}

//+------------------------------------------------------------------+
//| Function to Calculate Dynamic SL/TP                              |
//+------------------------------------------------------------------+
void CalculateDynamicSLTP(double &stopLoss, double &takeProfit, ENUM_ORDER_TYPE orderType)
{
   double atr = iATR(_Symbol, PERIOD_CURRENT, ATR_Period, 0);
   double price = (orderType == ORDER_TYPE_BUY) ? SymbolInfoDouble(_Symbol, SYMBOL_ASK) : SymbolInfoDouble(_Symbol, SYMBOL_BID);

   stopLoss  = (orderType == ORDER_TYPE_BUY) ? price - ATR_SL_Multiplier * atr : price + ATR_SL_Multiplier * atr;
   takeProfit = (orderType == ORDER_TYPE_BUY) ? price + ATR_TP_Multiplier * atr : price - ATR_TP_Multiplier * atr;

   Print("ATR: ", atr, " | SL: ", stopLoss, " | TP: ", takeProfit);
}

//+------------------------------------------------------------------+
//| Tick Function: Trade Logic                                       |
//+------------------------------------------------------------------+
void OnTick()
{
   // Skip if a position is already open
   if (IsPositionOpen())
      return;

   // Calculate EMA trend filter
   double emaValue = iMA(_Symbol, PERIOD_CURRENT, EMA_Trend_Period, 0, MODE_EMA, PRICE_CLOSE, 0);
   double price = Close[0];

   double stopLoss = 0.0, takeProfit = 0.0;

   // Buy Condition: Price above EMA
   if (price > emaValue)
   {
      CalculateDynamicSLTP(stopLoss, takeProfit, ORDER_TYPE_BUY);
      PlaceTrade(ORDER_TYPE_BUY, stopLoss, takeProfit);
   }
   // Sell Condition: Price below EMA
   else if (price < emaValue)
   {
      CalculateDynamicSLTP(stopLoss, takeProfit, ORDER_TYPE_SELL);
      PlaceTrade(ORDER_TYPE_SELL, stopLoss, takeProfit);
   }
}

//+------------------------------------------------------------------+
//| Initialization Function                                          |
//+------------------------------------------------------------------+
int OnInit()
{
   Print("SwingOlly EA Initialized");

   // Initialize Money Management
   Money.Percent(Money_FixRisk_Percent);

   // Initialize Trailing Stop
   TrailingStop.StopLevel(Trailing_FixedPips_StopLevel);
   TrailingStop.ProfitLevel(Trailing_FixedPips_ProfitLevel);

   return INIT_SUCCEEDED;
}

//+------------------------------------------------------------------+
//| Deinitialization Function                                        |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
   Print("SwingOlly EA Deinitialized");
}
