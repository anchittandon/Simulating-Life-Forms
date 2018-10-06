% Scirpt to run Monte Carlo Simulation for
% simulating various life form structures
% and finding patterns between them 

x=1000*rand(50,1);
y=1000*rand(50,1);

x=floor(x);
y=floor(y);

points=[x,y];

average=sum(points)/length(points);
[initial,t]=closest(points,average);

table=sort(points,t);
table=[table;table(1,:)];
x=table(:,1);
y=table(:,2);
plot(x,y);

function [point, index] = closest(points,p)
  point=points(1,:);
  index=1;
  dmin = 1000000;
  for i=1:size(points,1)
    di=sqrt((p(1,1)-points(i,1))^2+(p(1,2)-points(i,2))^2);
    if (di<dmin && di~=0)
      point=points(i,:);
      index=i;
      dmin=di;
    end
  end
end

function [sorted]= sort(points,initial)
  sorted=[points(initial,:)];
  points(initial,:)=[];
  while size(sorted,1) ~= 50
    [point, index]=closest(points,sorted(size(sorted,1),:));
    sorted=[sorted;points(index,:)];
    points(index,:)=[];
  end
end