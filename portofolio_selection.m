load('stockprices');
number_of_stocks = 10;
R = zeros(height(AAPL)-1, number_of_stocks);
R(:,1) = (table2array(AAPL(2:end, 5)) - table2array(AAPL(1:end-1, 5))) ./ table2array(AAPL(1:end-1, 5));
R(:,2) = (table2array(ADBE(2:end, 5)) - table2array(ADBE(1:end-1, 5))) ./ table2array(ADBE(1:end-1, 5));
R(:,3) = (table2array(ADDYY(2:end, 5)) - table2array(ADDYY(1:end-1, 5))) ./ table2array(ADDYY(1:end-1, 5));
R(:,4) = (table2array(ADSK(2:end, 5)) - table2array(ADSK(1:end-1, 5))) ./ table2array(ADSK(1:end-1, 5));
R(:,5) = (table2array(AMZN(2:end, 5)) - table2array(AMZN(1:end-1, 5))) ./ table2array(AAPL(1:end-1, 5));
R(:,6) = (table2array(AXP(2:end, 5)) - table2array(AXP(1:end-1, 5))) ./ table2array(AXP(1:end-1, 5));
R(:,7) = (table2array(BA(2:end, 5)) - table2array(BA(1:end-1, 5))) ./ table2array(BA(1:end-1, 5));
R(:,8) = (table2array(BRKB(2:end, 5)) - table2array(BRKB(1:end-1, 5))) ./ table2array(BRKB(1:end-1, 5));
R(:,9) = (table2array(C(2:end, 5)) - table2array(C(1:end-1, 5))) ./ table2array(C(1:end-1, 5));
R(:,10) = (table2array(COST(2:end, 5)) - table2array(COST(1:end-1, 5))) ./ table2array(COST(1:end-1, 5));

r = mean(R);
C = cov(R);
alpha = 0.2;

expected_return = zeros(number_of_stocks, 11);
risk = zeros(1,11);
i = 1;

for alpha = 0:0.1:1
    [w, optVal] = quadprog((1-alpha)*2*C, -alpha*r, [], [], ones(1,number_of_stocks), [1], zeros(number_of_stocks,1), ones(number_of_stocks,1));
    expected_return(:, i) = r'.*w;
    risk(1, i) = w'*C*w;
    i = i+1;
end

figure(1);
title('Efficient frontiers for portfolio selected');
plot(risk, expected_return);
legend({'AAPL','ADBE','ADDYY','ADSK'},'Location','best');
xlabel('Risk'); ylabel('Expected Return');