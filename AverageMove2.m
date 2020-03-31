function S = AverageMove2(m,a1,b1)
%本函数计算了随机游走的扫地机器人遍历整个空间需要的时间/步数(S(1)),以及在耗尽电量之前抵达充电站的概率(S(2)).
%扫地机器人从(a1,b1)点出发，每次可随机游走至临近8个方向.
%m为空间大小，会生成一个(m*m)这么大的空间；(a1,b1)分别是扫地机器人的初始位置.
%默认每次的迭代次数是100次，可调。
%Version:1.2

k=ones(100,1);%迭代数组，首位为迭代次数（遍历算一次）
l=1;
while l<length(k)+1
X = zeros(m,m);
a = a1;b = b1;%扫地机器人初始位置
X(a,b) = 1;

%移动
 while k(l)
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
k(l)=k(l)+1;

%判断是否遍历空间
 if X == ones(m,m)
     break;
 end
 end
    l=l+1;
end

%计算均值
%计算成功抵达概率
S = [vpa(mean(k(:))),vpa(sum(k(:)<500)/length(k))];