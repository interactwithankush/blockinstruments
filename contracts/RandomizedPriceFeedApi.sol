contract RandomizedPriceFeedApi {

    // block time when the prices were last updated
    uint public updateTime;

    mapping(bytes32 => uint)    _prices;
    mapping(bytes32 => uint)    _timestamps;

    function RandomizedPriceFeedApi(){
        _prices['USD_ETH']  = 673478;
        _prices['BTC_ETH']  = 2189;
        _prices['USDT_BTC'] = 285000000;
        _prices['EURUSD']   = 1102100;
        _prices['GBPUSD']   = 1531500;
        _prices['USDJPY']   = 121180000;
        _prices['XAUUSD']   = 1162880000;
        _prices['XAGUSD']   = 15818000;
        _prices['SP500']    = 2075150000;
        _prices['NASDAQ']   = 2147483647;
        _prices['AAPL']     = 119080000;
        _prices['GOOG']     = 702000000;
        _prices['MSFT']     = 52870000;
        _prices['GM']       = 35950000;
        _prices['WMT']      = 58300000;
        _prices['F']        = 15670000;
        _prices['T']        = 33740000;

        _timestamps['USD_ETH']  = block.timestamp;
        _timestamps['BTC_ETH']  = block.timestamp;
        _timestamps['USDT_BTC'] = block.timestamp;
        _timestamps['EURUSD']   = block.timestamp;
        _timestamps['GBPUSD']   = block.timestamp;
        _timestamps['USDJPY']   = block.timestamp;
        _timestamps['XAUUSD']   = block.timestamp;
        _timestamps['XAGUSD']   = block.timestamp;
        _timestamps['SP500']    = block.timestamp;
        _timestamps['NASDAQ']   = block.timestamp;
        _timestamps['AAPL']     = block.timestamp;
        _timestamps['GOOG']     = block.timestamp;
        _timestamps['MSFT']     = block.timestamp;
        _timestamps['GM']       = block.timestamp;
        _timestamps['WMT']      = block.timestamp;
        _timestamps['F']        = block.timestamp;
        _timestamps['T']        = block.timestamp;
    }

    // returns the price of an asset
    // the price is represented as uint: (double price) * 1000000
    function getPrice(bytes32 symbol) returns(uint currPrice)
    {
        uint price = _prices[symbol];

        uint shift = price / 10;
        if(block.number % 2 == 0)
            price = price + shift;
        else price = price - shift;

        _prices[symbol] = price;
        updateTime = block.timestamp;
        _timestamps[symbol] = block.timestamp;
        return price;
    }

    // returns the timestamp of the latest price for an asset
    // normally this is the exchange timestamp, but if exchange
    // doesn't supply such info the latest data retrieval time is returned
    function getTimestamp(bytes32 symbol) returns(uint timestamp){
        return _timestamps[symbol];
    }
}