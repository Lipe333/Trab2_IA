% Este código implementa a questão 1 passada no enunciado
% e calcula a reposta da letra (e) com base no teorema de bayes.

% Probabilidades para as variáveis independentes
0.2::str_snow_covered.
0.3::flw_worn.
0.95::bulb_ok.
0.9::cable_ok.

% Probabilidade condicional de R (dínamo deslizando) dado Str (condição da rua)
0.85::r_slides :- str_snow_covered.
0.2::r_slides :- \+str_snow_covered.

% Probabilidade condicional de V (dínamo mostra tensão) dado R (dínamo deslizando)
0.8::v_voltage :- r_slides.
0.1::v_voltage :- \+r_slides.

% Probabilidade condicional de Li (luz ligada) dado V, B, K, e Flw
0.9::li_on :- v_voltage, bulb_ok, cable_ok, \+flw_worn.
0.7::li_on :- v_voltage, bulb_ok, cable_ok, flw_worn.
0.6::li_on :- v_voltage, bulb_ok, \+cable_ok, \+flw_worn.
0.4::li_on :- v_voltage, bulb_ok, \+cable_ok, flw_worn.
0.5::li_on :- v_voltage, \+bulb_ok, cable_ok, \+flw_worn.
0.3::li_on :- v_voltage, \+bulb_ok, cable_ok, flw_worn.
0.2::li_on :- \+v_voltage, bulb_ok, cable_ok, \+flw_worn.
0.1::li_on :- \+v_voltage, \+bulb_ok, \+cable_ok, \+flw_worn.

% Evidência da condição da rua
evidence(str_snow_covered,true).

% Consulta para a probabilidade de V (tensão)
query(v_voltage).
