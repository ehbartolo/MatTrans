function output = pss_delPw_signal(casedata)
%----Delta Power-Omega signal based PSS----

nb=size(casedata.bus,1);
[mm, output.order_delPw_pss]=sort([setxor(1:nb,casedata.dynamicdata.delPw_pss(:,1)'),casedata.dynamicdata.delPw_pss(:,1)']);

Tm0_delPw=casedata.dynamicdata.gen_turbineParameters.turbineInitialCondition.TmA0(casedata.dynamicdata.delPw_pss(:,1)');

[Tw1_delPw, Tw2_delPw, Tw3_delPw, Tw4_delPw, T6_delPw, T7_delPw, ...
    H_delPw, Ks3_delPw, ...
    T8_delPw, T9_delPw, T1_delPw, T2_delPw, ...
    Ks1_delPw, VS_delPw_max, VS_delPw_min] =  utils.matsplit(casedata.dynamicdata.delPw_pss(:,2:16),1);


%% Making the variables into Struct
variableValues = {Tw1_delPw; Tw2_delPw; Tw3_delPw; Tw4_delPw; T6_delPw; T7_delPw; ...
    H_delPw; Ks3_delPw; ...
    T8_delPw; T9_delPw; T1_delPw; T2_delPw; ...
    Ks1_delPw; VS_delPw_max; VS_delPw_min; ...
    Tm0_delPw};

variableNames = {'Tw1_delPw'; 'Tw2_delPw'; 'Tw3_delPw'; 'Tw4_delPw'; 'T6_delPw'; 'T7_delPw'; ...
    'H_delPw'; 'Ks3_delPw'; ...
    'T8_delPw'; 'T9_delPw'; 'T1_delPw'; 'T2_delPw'; ...
    'Ks1_delPw'; 'VS_delPw_max'; 'VS_delPw_min'; ...
    'Tm0_delPw';};
        
%         output = [];
        for i=1:length(variableNames)
             output = setfield(output,char(variableNames(i)),cell2mat(variableValues(i)));
        end
