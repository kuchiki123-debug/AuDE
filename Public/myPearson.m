function coeff = myPearson(X,Y)  
% ������ʵ����Ƥ��ѷ���ϵ���ļ������  
%  
% ���룺  
%   X���������ֵ����  
%   Y���������ֵ����  
%  
% �����  
%   coeff������������ֵ����X��Y�����ϵ��  
% 
% 0.6-0.8 ǿ���
% 0.4-0.6 �еȳ̶����
% 0.2-0.4 �����
% 0.0-0.2 ������ػ������


if length(X) ~= length(Y)  
    error('������ֵ���е�ά�������');   
end  

fenzi = sum(X .* Y) - (sum(X) * sum(Y)) / length(X);  
fenmu = sqrt((sum(X .^2) - sum(X)^2 / length(X)) * (sum(Y .^2) - sum(Y)^2 / length(X)));  
coeff = fenzi / fenmu;  
  
end %����myPearson���� 