function S = AverageMove3(m,a1,b1)
%本函数计算了随机游走的扫地机器人遍历整个空间需要的时间/步数(S(1)),以及在耗尽电量之前抵达充电站的概率(S(2)).
%扫地机器人从(a1,b1)点出发，每次可随机游走至临近8个方向,且每次走到初始位置的时候都会充电.
%m为空间大小，会生成一个(m*m)这么大的空间；(a1,b1)是扫地机器人初始位置的坐标.
%默认每次的迭代次数是500次,默认电量为500步.
%Version:1.2

iteration=ones(500,1);%迭代数组，首位为迭代次数（遍历算一次）
InitBatteryLife = 500;
BatteryLife=InitBatteryLife;l=1;
%迭代
while l<length(iteration)+1
%初始化
X = zeros(m,m);
a = a1;b = b1;
X(a,b) = 1;BatteryLife=InitBatteryLife;

%移动
 while iteration(l)
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
iteration(l)=iteration(l)+1;
BatteryLife = BatteryLife-1;

%充电
 if([a,b] == [a1,b1])
     BatteryLife=InitBatteryLife;
 end
 
%电池电量耗尽，跳出循环，记录值为-1
 if (BatteryLife<0)
     iteration(l) = -1;
     break;
 end

%判断是否在电量耗尽前遍历空间
 if (X == ones(m,m))
     break;
 end
 end
    l=l+1;
end

%计算均值与成功抵达概率
S = [mean(iteration(iteration>0)),length(iteration(iteration>0))/length(iteration)];