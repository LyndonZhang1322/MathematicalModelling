%����һ����ͼ����,��������һ�������ڵ�ģ��Ч��.
%���Խ���Ӧ����ģ����Ĵ���ճ�������Թ۲�Ч��.
%��ɫ�ĵ����Ѿ��߹��Ĺ켣����ɫ�ĵ������ڵ�λ�ã���ɫ���ǳ����λ��.

m = 10;a1 = 1;a2 = 2;b1 = 1;b2 = 2;

time = 0;InitBatteryLife = 100;
BatteryLife=InitBatteryLife;
X = zeros(m,m);
a = a1;b = b1;%ɨ�ػ����˳�ʼλ��
X(a,b) = 1;BatteryLife=InitBatteryLife;
%��ͼ
[i,j] = find(X);
figure(gcf);
  plothandle = plot(i,j,'.', ...
      'Color','blue', ...
      'MarkerSize',12);
  hold on;
  plothandle2 = plot(a2,b2,'.', ...
      'Color','red', ...
      'MarkerSize',12);
  hold on;
  plothandle3 = plot(a,b,'.', ...
      'Color','green', ...
      'MarkerSize',12);
   axis([0 m+1 0 m+1]);

%�ƶ�
 while 1
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
time=time+1;
BatteryLife = BatteryLife-1;

 if([a,b] == [a2,b2])
     BatteryLife=InitBatteryLife;
 end
 
%��ص����ľ�������ѭ������¼ֵΪ-1
 if (BatteryLife<0)
     time = -1;
     fprintf("Battery has run out.\n");
     break;
 end

%�ж��Ƿ��ڵ����ľ�ǰ�����ռ�
 if (X == ones(m,m))
     pause;
 end
 
 %��ͼ
[i,j] = find(X);
set(plothandle,'XData',i,'YData',j);
set(plothandle3,'Xdata',a,'Ydata',b);
title(["Time = "+time ; "BatteryLife = "+BatteryLife])
drawnow
pause(0.2)
 
 end
