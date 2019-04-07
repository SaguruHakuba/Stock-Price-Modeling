load('stockprices');
number_of_stocks = 10;
stocks_prices = zeros(number_of_stocks, height(AAPL));
stocks_prices(1,:) = table2array(AAPL(:,5));
stocks_prices(2,:) = table2array(ADBE(:,5));
stocks_prices(3,:) = table2array(ADDYY(:,5));
stocks_prices(4,:) = table2array(ADSK(:,5));
stocks_prices(5,:) = table2array(AMD(:,5));
stocks_prices(6,:) = table2array(AMZN(:,5));
stocks_prices(7,:) = table2array(AXP(:,5));
stocks_prices(8,:) = table2array(BA(:,5));
stocks_prices(9,:) = table2array(BRKB(:,5));
stocks_prices(10,:) = table2array(C(:,5));

figure(1);
title('Stock prices over 124 days');
plot([0:123], stocks_prices);
legend({'AAPL','ADBE','ADDYY','ADSK','AMD','AMZN','AXP','BA','BRKB','C'},'Location','best');
xlabel('days'); ylabel('Prices($)');

stocks_prices = zeros(number_of_stocks, height(COST));
stocks_prices(1,:) = table2array(COST(:,5));
stocks_prices(2,:) = table2array(CRM(:,5));
stocks_prices(3,:) = table2array(CSCO(:,5));
stocks_prices(4,:) = table2array(DIS(:,5));
stocks_prices(5,:) = table2array(FB(:,5));
stocks_prices(6,:) = table2array(GS(:,5));
stocks_prices(7,:) = table2array(INTC(:,5));
stocks_prices(8,:) = table2array(JPM(:,5));
stocks_prices(9,:) = table2array(LMT(:,5));
stocks_prices(10,:) = table2array(MA(:,5));

figure(2);
title('Stock prices over 124 days');
plot([0:123], stocks_prices);
legend({'COST','CRM','CSCO','DIS','FB','GS','INTC','JPM','LMT','MA'},'Location','best');
xlabel('days'); ylabel('Prices($)');

stocks_prices = zeros(number_of_stocks, height(MSFT));
stocks_prices(1,:) = table2array(MSFT(:,5));
stocks_prices(2,:) = table2array(NFLX(:,5));
stocks_prices(3,:) = table2array(NKE(:,5));
stocks_prices(4,:) = table2array(NVDA(:,5));
stocks_prices(5,:) = table2array(ORCL(:,5));
stocks_prices(6,:) = table2array(PGRE(:,5));
stocks_prices(7,:) = table2array(PYPL(:,5));
stocks_prices(8,:) = table2array(QCOM(:,5));
stocks_prices(9,:) = table2array(SBUX(:,5));
stocks_prices(10,:) = table2array(T(:,5));

figure(3);
title('Stock prices over 124 days');
plot([0:123], stocks_prices);
legend({'MSFT','NFLX','NKE','NVDA','ORCL','PFRE','PYPL','QCOM','SBUX','T'},'Location','best');
xlabel('days'); ylabel('Prices($)');

numer
stocks_prices = zeros(number_of_stocks, height(TGT));
stocks_prices(1,:) = table2array(TGT(:,5));
stocks_prices(2,:) = table2array(TSLA(:,5));
stocks_prices(3,:) = table2array(V(:,5));
stocks_prices(4,:) = table2array(VZ(:,5));
stocks_prices(5,:) = table2array(WFC(:,5));
stocks_prices(6,:) = table2array(WMT(:,5));
stocks_prices(7,:) = table2array(XOM(:,5));

figure(3);
title('Stock prices over 124 days');
plot([0:123], stocks_prices);
legend({'MSFT','NFLX','NKE','NVDA','ORCL','PFRE','PYPL','QCOM','SBUX','T'},'Location','best');
xlabel('days'); ylabel('Prices($)');