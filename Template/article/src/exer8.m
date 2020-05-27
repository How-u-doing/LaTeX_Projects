% programs to solve exercise 8 in page 231
years=50;
time=0:50;
x=zeros(1,51); % # of rats in 50 years
y=zeros(1,51); % # of owls in 50 years
% question 1
r1=0.2; r2=0.3;
a1=0.001; a2=0.002;
x(1)=100; y(1)=50; % initial conditions
figure(2)
plot(x(1),y(1),'m*')
text(x(1)-30,y(1)+30,'Initial Point')
for k=1:years
    x(k+1)=(1+r1-a1*y(k))*x(k);
    x(k+1)=round(x(k+1)); % # can only be integer, e.g. 4.3->4, 4.6->5
    y(k+1)=(1-r2+a2*x(k))*y(k);
    y(k+1)=round(y(k+1));
    
    hold on
    % draw vecters (with arrow) every two points
    plot(x(k),y(k),'b.', x(k+1),y(k+1),'b.')
    vectarrow([x(k),y(k)],[x(k+1),y(k+1)])
end
xlabel('Rats #'), ylabel('Owls #')
title('# of Rats vs. Owls in 50 years')

figure(1)
subplot(2,1,1)
plot(time,x,'-b.')
xlabel('Year'), ylabel('Rats #')
title('Rats # in 50 years')

subplot(2,1,2)
plot(time,y,'-r.')
xlabel('Year'), ylabel('Owls #')
title('Owls # in 50 years')

function vectarrow(p0,p1)
% see also <https://www.mathworks.com/matlabcentral/fileexchange/
%        7470-plot-2d-3d-vector-with-arrow?s_tid=prof_contriblnk>
x0 = p0(1);  
y0 = p0(2);
x1 = p1(1);
y1 = p1(2);
plot([x0;x1],[y0;y1],'r');   % Draw a line between p0 and p1

p = p1-p0;
alpha = 0.1;  % Size of arrow head relative to the length of the vector
beta = 0.1;   % Width of the base of the arrow head relative to the length

hu = [x1-alpha*(p(1)+beta*(p(2)+eps)); x1; x1-alpha*(p(1)-beta*(p(2)+eps))];
hv = [y1-alpha*(p(2)-beta*(p(1)+eps)); y1; y1-alpha*(p(2)+beta*(p(1)+eps))];

hold on
plot(hu(:),hv(:),'b')  % Plot arrow head
hold off
end

