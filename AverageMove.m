function S = AverageMove(m,a1,b1,a2,b2)
%本函数计算了随机游走的扫地机器人到达指定充电位置所需要的平均时间/步数(S(1)),以及在耗尽电量之前抵达充电站的概率(S(2)).
%扫地机器人从(a1,b1)点出发，直至到达充电位置(a2,b2)，每次可随机游走至临近8个方向.
%m为空间大小，会生成一个(m*m)这么大的空间；a1,b1分别是扫地机器人的初始位置；a2,b2分别是充电器的位置.
%默认每次的迭代次数是100次,电量为500步.
%Version:1.2

iteration=ones(100,1);%迭代数组，首位为迭代次数（碰到充电器算一次）
l=1;BatteryLife=500;
while l<length(iteration)+1
Space = zeros(m,m);
a = a1;b = b1;%扫地机器人初始位置
Space(a,b) = 1;BatteryLife = 500;

%移动
 while iteration(l)
 %转移概率阵
 RAND = rand(3);
 %转移状态
 %判断是否会触及边界
for ap = 1:3
    for aq = 1:3
        if (a+ap-2<1)||(a+ap-2>m)||(b+aq-2<1)||(b+aq-2>m)||((ap==2)&&(aq==2))
         RAND(ap,aq)=0;
        end
    end
end
%状态转移:机器人向邻近8个位置中随机值最大的移动
[p,q] = find(RAND==max(max(RAND)));        
a = a+p-2;
b = b+q-2;
Space = zeros(m,m);
Space(a,b)=1;
iteration(l)=iteration(l) + 1;
BatteryLife = BatteryLife - 1;

%判断是否处在充电器位置（a,b的值是充电器坐标）
 if ((a == a2)&&(b == b2))
     break;
 end
 
 %判断是否断电(断电记录为失败1次)
 if(BatteryLife < 0)
     iteration(l) = -1;
     break;
 end
  
 end
 l=l+1;
end

%计算均值
%计算成功抵达概率
S = [mean(iteration(iteration>0)),length(iteration(iteration>0))/length(iteration)];