function [y1] = TCU10_annS1_fx(x1)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 03-Feb-2021 14:20:39.
%
% [y1] = myNeuralNetworkFunction(x1) takes these arguments:
%   x = Qx2 matrix, input #1
% and returns:
%   y = Qx1 matrix, output #1
% where Q is the number of samples.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [5.34;0];
x1_step1.gain = [0.1085776330076;0.0854883522120111];
x1_step1.ymin = -1;

% Layer 1
b1 = [-3.3464064865361105028;-1.1622940228641378546;-1.2037317853192599504;1.9837747486238743733;1.4257431013647305917;3.4552762615669552204;-2.2802505030177186995;1.6335614404993092919;-2.3600668676196088214;3.1573333096992577396;0.22556523383903490099;-0.42469000035042175911;3.3687728019941585167;-0.0064473525261049425411;1.8286386443453985784];
IW1_1 = [-0.33413429082697337913 -3.4460024482194757667;-6.5771414150216287453 2.0002495065225533999;2.3552870779661736478 -4.5654883135913699732;-1.9156680447737288731 -1.7926358761519625151;-1.6136608791057629464 0.01189752043661891634;7.4847555025222458625 2.2409916379309131607;-2.8644821805821698568 -6.5266247918672108952;1.4278349991797600893 6.842616473759786544;0.82137888112873469471 -1.9970918651430480395;6.3675851481879952587 2.281109661739717076;-3.8465961204848304611 3.523205173790798117;-4.1079307256838673013 2.0202333412991242412;2.3300821143794920864 5.4636790220618989267;-2.1493758059866254762 1.0250175010758859617;-6.9170127017166542771 3.0167311874392983562];

% Layer 2
b2 = -1.1898882856024437515;
LW2_1 = [-2.8494362680372140595 1.078717013052969298 1.6408142037100594823 -1.3714628155911654517 6.2580066367931088678 1.8073492031637565791 -1.5629956562282263377 -1.1539914349904192292 6.4565859291661551467 -2.6121201157764617484 3.3019805005202700343 -5.4387597452887224136 0.54056718373647527631 3.6905668012354717611 -0.49560033181873158759];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = 0.0562863104043787;
y1_step1.xoffset = 1.12576;

% ===== SIMULATION ========

% Dimensions
Q = size(x1,1); % samples

% Input 1
x1 = x1';
xp1 = mapminmax_apply(x1,x1_step1);

% Layer 1
a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*xp1);

% Layer 2
a2 = repmat(b2,1,Q) + LW2_1*a1;

% Output 1
y1 = mapminmax_reverse(a2,y1_step1);
y1 = y1';
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings)
y = bsxfun(@minus,x,settings.xoffset);
y = bsxfun(@times,y,settings.gain);
y = bsxfun(@plus,y,settings.ymin);
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n,~)
a = 2 ./ (1 + exp(-2*n)) - 1;
end

% Map Minimum and Maximum Output Reverse-Processing Function
function x = mapminmax_reverse(y,settings)
x = bsxfun(@minus,y,settings.ymin);
x = bsxfun(@rdivide,x,settings.gain);
x = bsxfun(@plus,x,settings.xoffset);
end
