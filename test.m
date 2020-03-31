%这是一个绘图进程,用来检验一个迭代内的模拟效果.
%可以将相应函数模块里的代码粘贴进来以观察效果.
%蓝色的点是已经走过的轨迹，绿色的点是现在的位置，红色点是充电器位置.

m = 10;a1 = 1;a2 = 2;b1 = 1;b2 = 2;

time = 0;InitBatteryLife = 100;
BatteryLife=InitBatteryLife;
X = zeros(m,m);
a = a1;b = b1;%扫地机器人初始位置
X(a,b) = 1;BatteryLife=InitBatteryLife;
%绘图
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

%移动
 while 1
 %转移概率阵
 A = rand(3);
 %转移状态
 %判断是否会触及边界
for ap = 1:3
    for aq = 1:3
        if (a+ap-2<1)||(a+ap-2>m)||(b+aq-2<1)||(b+aq-2>m)||((ap==2)&&(aq==2))
         A(ap,aq)=0;
        end
    end
end
%状态转移:机器人向邻近8个位置中随机值最大的移动
[p,q] = find(A==max(max(A)));        
a = a+p-2;
b = b+q-2;
X(a,b)=1;
time=time+1;
BatteryLife = BatteryLife-1;

 if([a,b] == [a2,b2])
     BatteryLife=InitBatteryLife;
 end
 
%电池电量耗尽，跳出循环，记录值为-1
 if (BatteryLife<0)
     time = -1;
     fprintf("Battery has run out.\n");
     break;
 end

%判断是否在电量耗尽前遍历空间
 if (X == ones(m,m))
     pause;
 end
 
 %绘图
[i,j] = find(X);
set(plothandle,'XData',i,'YData',j);
set(plothandle3,'Xdata',a,'Ydata',b);
title(["Time = "+time ; "BatteryLife = "+BatteryLife])
drawnow
pause(0.2)
 
 end
