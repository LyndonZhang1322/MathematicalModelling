function S = AverageMove3(m,a1,b1)
%������������������ߵ�ɨ�ػ����˱��������ռ���Ҫ��ʱ��/����(S(1)),�Լ��ںľ�����֮ǰ�ִ���վ�ĸ���(S(2)).
%ɨ�ػ����˴�(a1,b1)�������ÿ�ο�����������ٽ�8������,��ÿ���ߵ���ʼλ�õ�ʱ�򶼻���.
%mΪ�ռ��С��������һ��(m*m)��ô��Ŀռ䣻(a1,b1)��ɨ�ػ����˳�ʼλ�õ�����.
%Ĭ��ÿ�εĵ���������500��,Ĭ�ϵ���Ϊ500��.
%Version:1.2

iteration=ones(500,1);%�������飬��λΪ����������������һ�Σ�
InitBatteryLife = 500;
BatteryLife=InitBatteryLife;l=1;
%����
while l<length(iteration)+1
%��ʼ��
X = zeros(m,m);
a = a1;b = b1;
X(a,b) = 1;BatteryLife=InitBatteryLife;

%�ƶ�
 while iteration(l)
 %ת�Ƹ�����
 A = rand(3);
 %ת��״̬
 %�ж��Ƿ�ᴥ���߽�
for ap = 1:3
    for aq = 1:3
        if (a+ap-2<1)||(a+ap-2>m)||(b+aq-2<1)||(b+aq-2>m)||((ap==2)&&(aq==2))
         A(ap,aq)=0;
        end
    end
end
%״̬ת��:���������ڽ�8��λ�������ֵ�����ƶ�
[p,q] = find(A==max(max(A)));        
a = a+p-2;
b = b+q-2;
X(a,b)=1;
iteration(l)=iteration(l)+1;
BatteryLife = BatteryLife-1;

%���
 if([a,b] == [a1,b1])
     BatteryLife=InitBatteryLife;
 end
 
%��ص����ľ�������ѭ������¼ֵΪ-1
 if (BatteryLife<0)
     iteration(l) = -1;
     break;
 end

%�ж��Ƿ��ڵ����ľ�ǰ�����ռ�
 if (X == ones(m,m))
     break;
 end
 end
    l=l+1;
end

%�����ֵ��ɹ��ִ����
S = [mean(iteration(iteration>0)),length(iteration(iteration>0))/length(iteration)];