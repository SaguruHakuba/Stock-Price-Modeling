%%
%Starting Data
clear;
clc;
format long;

alpha = 0.2;

M_total = zeros(124,65);

M_total(:,1) = xlsread('BLL.xlsx','B2:B125');
M_total(:,2) = xlsread('BREW.xlsx','B2:B125');
M_total(:,3) = xlsread('BUD.xlsx','B2:B125');
M_total(:,4) = xlsread('COT.xlsx','B2:B125');
M_total(:,5) = xlsread('DEO.xlsx','B2:B125');
M_total(:,6) = xlsread('FIZZ.xlsx','B2:B125');
M_total(:,7) = xlsread('KDP.xlsx','B2:B125');
M_total(:,8) = xlsread('KO.xlsx','B2:B125');
M_total(:,9) = xlsread('MNST.xlsx','B2:B125');
M_total(:,10) = xlsread('MT.xlsx','B2:B125');
M_total(:,11) = xlsread('PE.xlsx','B2:B125');
M_total(:,12) = xlsread('PRMW.xlsx','B2:B125');
M_total(:,13) = xlsread('SAM.xlsx','B2:B125');
M_total(:,14) = xlsread('STZ.xlsx','B2:B125');
M_total(:,15) = xlsread('TAP.xlsx','B2:B125');
M_total(:,16) = xlsread('HK.xlsx','B2:B125');
M_total(:,17) = xlsread('INTC.xlsx','B2:B125');
M_total(:,18) = xlsread('JNJ.xlsx','B2:B125');
M_total(:,19) = xlsread('LLY.xlsx','B2:B125');
M_total(:,20) = xlsread('RYCEY.xlsx','B2:B125');
M_total(:,21) = xlsread('SNE.xlsx','B2:B125');
M_total(:,22) = xlsread('SYK.xlsx','B2:B125');
M_total(:,23) = xlsread('ZBH.xlsx','B2:B125');
M_total(:,24) = xlsread('ALSN.xlsx','B2:B125');
M_total(:,25) = xlsread('AMZN.xlsx','B2:B125');
M_total(:,26) = xlsread('BSX.xlsx','B2:B125');
M_total(:,27) = xlsread('COST.xlsx','B2:B125');
M_total(:,28) = xlsread('DG.xlsx','B2:B125');
M_total(:,29) = xlsread('GOOG.xlsx','B2:B125');
M_total(:,30) = xlsread('DASTY.xlsx','B2:B125');
M_total(:,31) = xlsread('AAPL.xlsx','B2:B125');
M_total(:,32) = xlsread('ADBE.xlsx','B2:B125');
M_total(:,33) = xlsread('ADDYY.xlsx','B2:B125');
M_total(:,34) = xlsread('ADSK.xlsx','B2:B125');
M_total(:,35) = xlsread('AMD.xlsx','B2:B125');
M_total(:,36) = xlsread('FIZZ.xlsx','B2:B125');
M_total(:,37) = xlsread('AXP.xlsx','B2:B125');
M_total(:,38) = xlsread('BA.xlsx','B2:B125');
M_total(:,39) = xlsread('BRK-B.xlsx','B2:B125');
M_total(:,40) = xlsread('C.xlsx','B2:B125');
M_total(:,41) = xlsread('CRM.xlsx','B2:B125');
M_total(:,42) = xlsread('CSCO.xlsx','B2:B125');
M_total(:,43) = xlsread('DIS.xlsx','B2:B125');
M_total(:,44) = xlsread('FB.xlsx','B2:B125');
M_total(:,45) = xlsread('GS.xlsx','B2:B125');
M_total(:,46) = xlsread('JPM.xlsx','B2:B125');
M_total(:,47) = xlsread('LMT.xlsx','B2:B125');
M_total(:,48) = xlsread('MA.xlsx','B2:B125');
M_total(:,49) = xlsread('MSFT.xlsx','B2:B125');
M_total(:,50) = xlsread('NFLX.xlsx','B2:B125');
M_total(:,51) = xlsread('NKE.xlsx','B2:B125');
M_total(:,52) = xlsread('NVDA.xlsx','B2:B125');
M_total(:,53) = xlsread('ORCL.xlsx','B2:B125');
M_total(:,54) = xlsread('PGRE.xlsx','B2:B125');
M_total(:,55) = xlsread('PYPL.xlsx','B2:B125');
M_total(:,56) = xlsread('QCOM.xlsx','B2:B125');
M_total(:,57) = xlsread('SBUX.xlsx','B2:B125');
M_total(:,58) = xlsread('T.xlsx','B2:B125');
M_total(:,59) = xlsread('TGT.xlsx','B2:B125');
M_total(:,60) = xlsread('TSLA.xlsx','B2:B125');
M_total(:,61) = xlsread('V.xlsx','B2:B125');
M_total(:,62) = xlsread('VZ.xlsx','B2:B125');
M_total(:,63) = xlsread('WFC.xlsx','B2:B125');
M_total(:,64) = xlsread('WMT.xlsx','B2:B125');
M_total(:,65) = xlsread('XOM.xlsx','B2:B125');
M_use = M_total;

R = (M_total(2:end,:)-M_total(1:end-1,:))./M_total(1:end-1,:);

r = mean(R);

C = cov(R);

[w, optVal] = quadprog((1-alpha)*2.*C, -alpha .* r, [], [], ones(1,65), [1], zeros(65,1), 0.2 .* ones(65,1));

%%
months = 6;
days = 21;

for ind_mo = 1:months
    M2 = zeros(days+1,65);

    for s_ind = 1:65
        [ t,P ] = sim_forward_day( days , 1, M_total(end,s_ind), r(s_ind), sqrt(C(s_ind,s_ind)) );
        M2(:,s_ind) = P;
    end
    
    M_total = [M_total;M2(2:end,:)];
    M_use = [M_use(days+1:end,:);M2(2:end,:)];
    
    R = (M_total(2:end,:)-M_total(1:end-1,:))./M_total(1:end-1,:);

    r = mean(R);

    C = cov(R);

    [w, optVal] = quadprog((1-alpha)*2.*C, -alpha .* r, [], [], ones(1,65), [1], zeros(65,1), 0.2 .* ones(65,1));
    
end

%%
plot([1:250],M_total(:,[1,5,7,19,57,62]).')
ylabel('Price [USD]')
xlabel('Days')
legend('BLL','DEO','KDP','LLY','SBUX','VZ')