function S = AverageMove(m,a1,b1,a2,b2)
%������������������ߵ�ɨ�ػ����˵���ָ�����λ������Ҫ��ƽ��ʱ��/����(S(1)),�Լ��ںľ�����֮ǰ�ִ���վ�ĸ���(S(2)).
%ɨ�ػ����˴�(a1,b1)�������ֱ��������λ��(a2,b2)��ÿ�ο�����������ٽ�8������.
%mΪ�ռ��С��������һ��(m*m)��ô��Ŀռ䣻a1,b1�ֱ���ɨ�ػ����˵ĳ�ʼλ�ã�a2,b2�ֱ��ǳ������λ��.
%Ĭ��ÿ�εĵ���������100��,����Ϊ500��.
%Version:1.2

iteration=ones(100,1);%�������飬��λΪ���������������������һ�Σ�
l=1;BatteryLife=500;
while l<length(iteration)+1
Space = zeros(m,m);
a = a1;b = b1;%ɨ�ػ����˳�ʼλ��
Space(a,b) = 1;BatteryLife = 500;

%�ƶ�
 while iteration(l)
 %ת�Ƹ�����
 RAND = rand(3);
 %ת��״̬
 %�ж��Ƿ�ᴥ���߽�
for ap = 1:3
    for aq = 1:3
        if (a+ap-2<1)||(a+ap-2>m)||(b+aq-2<1)||(b+aq-2>m)||((ap==2)&&(aq==2))
         RAND(ap,aq)=0;
        end
    end
end
%״̬ת��:���������ڽ�8��λ�������ֵ�����ƶ�
[p,q] = find(RAND==max(max(RAND)));        
a = a+p-2;
b = b+q-2;
Space = zeros(m,m);
Space(a,b)=1;
iteration(l)=iteration(l) + 1;
BatteryLife = BatteryLife - 1;

%�ж��Ƿ��ڳ����λ�ã�a,b��ֵ�ǳ�������꣩
 if ((a == a2)&&(b == b2))
     break;
 end
 
 %�ж��Ƿ�ϵ�(�ϵ��¼Ϊʧ��1��)
 if(BatteryLife < 0)
     iteration(l) = -1;
     break;
 end
  
 end
 l=l+1;
end

%�����ֵ
%����ɹ��ִ����
S = [mean(iteration(iteration>0)),length(iteration(iteration>0))/length(iteration)];