%%
%Starting Data
clear;
clc;
format long;

alpha = 0.2;

M = zeros(124,65);

M(:,1) = xlsread('BLL.xlsx','B2:B125');
M(:,2) = xlsread('BREW.xlsx','B2:B125');
M(:,3) = xlsread('BUD.xlsx','B2:B125');
M(:,4) = xlsread('COT.xlsx','B2:B125');
M(:,5) = xlsread('DEO.xlsx','B2:B125');
M(:,6) = xlsread('FIZZ.xlsx','B2:B125');
M(:,7) = xlsread('KDP.xlsx','B2:B125');
M(:,8) = xlsread('KO.xlsx','B2:B125');
M(:,9) = xlsread('MNST.xlsx','B2:B125');
M(:,10) = xlsread('MT.xlsx','B2:B125');
M(:,11) = xlsread('PE.xlsx','B2:B125');
M(:,12) = xlsread('PRMW.xlsx','B2:B125');
M(:,13) = xlsread('SAM.xlsx','B2:B125');
M(:,14) = xlsread('STZ.xlsx','B2:B125');
M(:,15) = xlsread('TAP.xlsx','B2:B125');
M(:,16) = xlsread('HK.xlsx','B2:B125');
M(:,17) = xlsread('INTC.xlsx','B2:B125');
M(:,18) = xlsread('JNJ.xlsx','B2:B125');
M(:,19) = xlsread('LLY.xlsx','B2:B125');
M(:,20) = xlsread('RYCEY.xlsx','B2:B125');
M(:,21) = xlsread('SNE.xlsx','B2:B125');
M(:,22) = xlsread('SYK.xlsx','B2:B125');
M(:,23) = xlsread('ZBH.xlsx','B2:B125');
M(:,24) = xlsread('ALSN.xlsx','B2:B125');
M(:,25) = xlsread('AMZN.xlsx','B2:B125');
M(:,26) = xlsread('BSX.xlsx','B2:B125');
M(:,27) = xlsread('COST.xlsx','B2:B125');
M(:,28) = xlsread('DG.xlsx','B2:B125');
M(:,29) = xlsread('GOOG.xlsx','B2:B125');
M(:,30) = xlsread('DASTY.xlsx','B2:B125');
M(:,31) = xlsread('AAPL.xlsx','B2:B125');
M(:,32) = xlsread('ADBE.xlsx','B2:B125');
M(:,33) = xlsread('ADDYY.xlsx','B2:B125');
M(:,34) = xlsread('ADSK.xlsx','B2:B125');
M(:,35) = xlsread('AMD.xlsx','B2:B125');
M(:,36) = xlsread('FIZZ.xlsx','B2:B125');
M(:,37) = xlsread('AXP.xlsx','B2:B125');
M(:,38) = xlsread('BA.xlsx','B2:B125');
M(:,39) = xlsread('BRK-B.xlsx','B2:B125');
M(:,40) = xlsread('C.xlsx','B2:B125');
M(:,41) = xlsread('CRM.xlsx','B2:B125');
M(:,42) = xlsread('CSCO.xlsx','B2:B125');
M(:,43) = xlsread('DIS.xlsx','B2:B125');
M(:,44) = xlsread('FB.xlsx','B2:B125');
M(:,45) = xlsread('GS.xlsx','B2:B125');
M(:,46) = xlsread('JPM.xlsx','B2:B125');
M(:,47) = xlsread('LMT.xlsx','B2:B125');
M(:,48) = xlsread('MA.xlsx','B2:B125');
M(:,49) = xlsread('MSFT.xlsx','B2:B125');
M(:,50) = xlsread('NFLX.xlsx','B2:B125');
M(:,51) = xlsread('NKE.xlsx','B2:B125');
M(:,52) = xlsread('NVDA.xlsx','B2:B125');
M(:,53) = xlsread('ORCL.xlsx','B2:B125');
M(:,54) = xlsread('PGRE.xlsx','B2:B125');
M(:,55) = xlsread('PYPL.xlsx','B2:B125');
M(:,56) = xlsread('QCOM.xlsx','B2:B125');
M(:,57) = xlsread('SBUX.xlsx','B2:B125');
M(:,58) = xlsread('T.xlsx','B2:B125');
M(:,59) = xlsread('TGT.xlsx','B2:B125');
M(:,60) = xlsread('TSLA.xlsx','B2:B125');
M(:,61) = xlsread('V.xlsx','B2:B125');
M(:,62) = xlsread('VZ.xlsx','B2:B125');
M(:,63) = xlsread('WFC.xlsx','B2:B125');
M(:,64) = xlsread('WMT.xlsx','B2:B125');
M(:,65) = xlsread('XOM.xlsx','B2:B125');

R = (M(2:end,:)-M(1:end-1,:))./M(1:end-1,:);

r = mean(R);

C = cov(R);

[w, optVal] = quadprog((1-alpha)*2.*C, -alpha .* r, [], [], ones(1,65), [1], zeros(65,1), 0.2 .* ones(65,1));

%%

months = 6;

for 
    M2 = zeros(125,65);

    for s_ind = 1:65
        [ t,P ] = sim_forward_day( 21 , 1, M(end,s_ind), r(s_ind), sqrt(C(s_ind,s_ind)) );
        M2(:,s_ind) = P;
    end

    plot([1:124],M(:,[1,5,7,19,57,62]),[124:248],M2(:,[1,5,7,19,57,62]))
    ylabel('Price [USD]')
    xlabel('Days')
    legend('BLL','DEO','KDP','LLY','SBUX','VZ')
end